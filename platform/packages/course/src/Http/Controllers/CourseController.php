<?php

namespace Botble\Course\Http\Controllers;

use Botble\Base\Events\BeforeUpdateContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Facades\CourseTitle;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Traits\HasDeleteManyItemsTrait;
use Botble\Course\Forms\CourseForm;
use Botble\Course\Http\Requests\CourseRequest;
use Botble\Course\Models\Course;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Course\Tables\CourseTable;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CourseController extends BaseController
{
    use HasDeleteManyItemsTrait;

    public function __construct(protected CourseInterface $courseRepository)
    {
    }

    public function index(CourseTable $dataTable)
    {
        $this->pageTitle(trans('packages/course::courses.menu'));

        return $dataTable->renderTable();
    }

    public function create(FormBuilder $formBuilder)
    {
        $this->pageTitle(trans('packages/course::courses.create'));
        // return $formBuilder->create(CourseForm::class)->renderForm();
        return CourseForm::create()->renderForm();
    }

    public function store(CourseRequest $request, BaseHttpResponse $response)
    {
        // dd($request->input());
        // $parent_id = $request->input()['parent_id'];
        // dd($request->input());
        $child = $request->input(['child']);
        // dd($parent_id);
        // dd($child);
        if ($child !== "None" && $child != "0") {
        // if ($child != "0") {
            $child_id = Course::where('name', $child)->pluck('id');
            $array = $child_id->toArray();
            // dd($array);
            $request->merge(['parent_id' => $array[0]]);
            // $request->merge(['parent_id' => $child]);
            // dd($request);
        }
        $course = $this->courseRepository->createOrUpdate(array_merge($request->input(), [
            'user_id' => Auth::id(),
        ]));

        event(new CreatedContentEvent(COURSE_MODULE_SCREEN_NAME, $request, $course));

        return $response->setPreviousUrl(route('courses.index'))
            ->setNextUrl(route('courses.edit', $course->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(Course $course, FormBuilder $formBuilder)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $course->name]));

        $items = Course::all(); // Retrieve all items from the model

        $dataArray = [];

        foreach ($items as $item) {
            $dataArray[] = [
                'id'   => $item->id,
                'name' => $item->name,
            ];
        }

        return $formBuilder->create(CourseForm::class, ['model' => $course, 'data' => $dataArray])->renderForm($dataArray);
    }

    public function update(Course $course, CourseRequest $request, BaseHttpResponse $response)
    {
        // dd($request);
        // $parent_id = $request->input()['parent_id'];
        // dd($request->input());
        $child = $request->input(['child']);
        // dd($parent_id);
        // dd($child);
        // if ($child !== "None") {
            //  Bug, when we have any course which we need to transfer to another grandparent
            //  Suppose A-B-C and D-E-F
            //  and we need to migrate C to E, for that we have to select the grandparent from the upper
            //  select box, which cause the parent select box to be refreshed and repopulated. Then select
            //  E from the parent select box, and when save it, the parent select box is sending the value "E"
            //  which i didn't found out yet, it should send the id of the "E" but when we migrate within the same
            //  parent then it sends the id of the selected parent. So as of now, I check if we receive the digit
            //  or string. If it has only digits which means just pass it to be saved, else it it contains any alphabetic
            // characters then that characters are actually the name of the parent from it pluck the id and then save.
            // Remember not to name any post with just digits, this solution will fail then.

        if ($child != "0" && $child != "None") {
            if (ctype_digit($child)) {
                // if it contains only digits
                // dd("String contains only digits.");
                $request->merge(['parent_id' => $child]);

                // dd($child_id);
            } else {
                // if it has any non-digit characters.
                // dd("String contains non-digit characters.");
                $child_id = Course::where('name', $child)->pluck('id')->first();
                // $request->merge(['parent_id' => $child_id]);
                $request->merge(['parent_id' => $child_id ?? 0]); //if $child_id is null assign 0 in that case.
            }
        }
        event(new BeforeUpdateContentEvent($request, $course));

        $course->fill($request->input());
        $course = $this->courseRepository->createOrUpdate($course);

        event(new UpdatedContentEvent(COURSE_MODULE_SCREEN_NAME, $request, $course));

        return $response
            ->setPreviousUrl(route('courses.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(Course $course, Request $request, BaseHttpResponse $response)
    {
        try {
            $this->courseRepository->delete($course);

            event(new DeletedContentEvent(COURSE_MODULE_SCREEN_NAME, $request, $course));

            return $response->setMessage(trans('packages/course::courses.deleted'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    public function deletes(Request $request, BaseHttpResponse $response)
    {
        return $this->executeDeleteItems($request, $response, $this->courseRepository, COURSE_MODULE_SCREEN_NAME);
    }
}
