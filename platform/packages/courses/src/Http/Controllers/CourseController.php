<?php

namespace Botble\Course\Http\Controllers;

use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Traits\HasDeleteManyItemsTrait;
use Botble\Course\Forms\CourseForm;
use Botble\Course\Http\Requests\CourseRequest;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Course\Tables\CourseTable;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Contracts\View\View;
use Throwable;

class CourseController extends BaseController
{
    use HasDeleteManyItemsTrait;

    /**
     * @var CourseInterface
     */
    protected $courseRepository;

    /**
     * CourseController constructor.
     * @param CourseInterface $courseRepository
     */
    public function __construct(CourseInterface $courseRepository)
    {
        $this->courseRepository = $courseRepository;
    }

    /**
     * @param CourseTable $dataTable
     * @return JsonResponse|View
     *
     * @throws Throwable
     */
    public function index(CourseTable $dataTable)
    {
        // dd($dataTable);
        course_title()->setTitle(trans('packages/courses::courses.menu_name'));

        return $dataTable->renderTable();
    }

    /**
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        //dd(trans('packages/courses::courses.create'));
        course_title()->setTitle(trans('packages/courses::courses.create'));

        return $formBuilder->create(CourseForm::class)->renderForm();
    }

    /**
     * @param CourseRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function store(CourseRequest $request, BaseHttpResponse $response)
    {
        $course = $this->courseRepository->createOrUpdate(array_merge($request->input(), [
            'user_id' => Auth::id(),
        ]));

        event(new CreatedContentEvent(COURSE_MODULE_SCREEN_NAME, $request, $course));

        return $response->setPreviousUrl(route('courses.index'))
            ->setNextUrl(route('courses.edit', $course->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    /**
     * @param Request $request
     * @param int $id
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function edit($id, FormBuilder $formBuilder, Request $request)
    {
        $course = $this->courseRepository->findOrFail($id);

        course_title()->setTitle(trans('packages/course::courses.edit') . ' "' . $course->name . '"');

        event(new BeforeEditContentEvent($request, $course));

        return $formBuilder->create(CourseForm::class, ['model' => $course])->renderForm();
    }

    /**
     * @param $id
     * @param CourseRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function update($id, CourseRequest $request, BaseHttpResponse $response)
    {
        $course = $this->courseRepository->findOrFail($id);
        $course->fill($request->input());

        $course = $this->courseRepository->createOrUpdate($course);

        event(new UpdatedContentEvent(COURSE_MODULE_SCREEN_NAME, $request, $course));

        return $response
            ->setPreviousUrl(route('courses.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    /**
     * @param Request $request
     * @param int $id
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function destroy(Request $request, $id, BaseHttpResponse $response)
    {
        try {
            $course = $this->courseRepository->findOrFail($id);
            $this->courseRepository->delete($course);

            event(new DeletedContentEvent(COURSE_MODULE_SCREEN_NAME, $request, $course));

            return $response->setMessage(trans('packages/course::courses.deleted'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     * @throws Exception
     */
    public function deletes(Request $request, BaseHttpResponse $response)
    {
        return $this->executeDeleteItems($request, $response, $this->courseRepository, COURSE_MODULE_SCREEN_NAME);
    }
}
