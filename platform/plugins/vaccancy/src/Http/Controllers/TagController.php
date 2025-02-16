<?php

namespace Botble\Vaccancy\Http\Controllers;

use Botble\ACL\Models\User;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Facades\PageTitle;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Traits\HasDeleteManyItemsTrait;
use Botble\Vaccancy\Forms\TagForm;
use Botble\Vaccancy\Http\Requests\TagRequest;
use Botble\Vaccancy\Models\VaccancyTag;
use Botble\Vaccancy\Repositories\Interfaces\TagInterface;
use Botble\Vaccancy\Tables\TagTable;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TagController extends BaseController
{
    use HasDeleteManyItemsTrait;

    public function __construct(protected TagInterface $tagRepository)
    {
    }

    public function index(TagTable $dataTable)
    {
        PageTitle::setTitle(trans('plugins/vaccancy::tags.menu'));

        return $dataTable->renderTable();
    }

    public function create(FormBuilder $formBuilder)
    {
        PageTitle::setTitle(trans('plugins/vaccancy::tags.create'));

        return $formBuilder->create(TagForm::class)->renderForm();
    }

    public function store(TagRequest $request, BaseHttpResponse $response)
    {
        $tag = $this->tagRepository->createOrUpdate(array_merge($request->input(), [
            'author_id' => Auth::id(),
            'author_type' => User::class,
        ]));
        event(new CreatedContentEvent(VACCANCY_TAG_MODULE_SCREEN_NAME, $request, $tag));

        return $response
            ->setPreviousUrl(route('vaccancy_tags.index'))
            ->setNextUrl(route('vaccancy_tags.edit', $tag->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(VaccancyTag $tag, FormBuilder $formBuilder)
    {
        PageTitle::setTitle(trans('core/base::forms.edit_item', ['name' => $tag->name]));

        return $formBuilder->create(TagForm::class, ['model' => $tag])->renderForm();
    }

    public function update(VaccancyTag $tag, TagRequest $request, BaseHttpResponse $response)
    {
        $tag->fill($request->input());

        $this->tagRepository->createOrUpdate($tag);
        event(new UpdatedContentEvent(VACCANCY_TAG_MODULE_SCREEN_NAME, $request, $tag));

        return $response
            ->setPreviousUrl(route('vaccancy_tags.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(VaccancyTag $tag, Request $request, BaseHttpResponse $response)
    {
        try {
            // dd($tag);
            $this->tagRepository->delete($tag);

            event(new DeletedContentEvent(VACCANCY_TAG_MODULE_SCREEN_NAME, $request, $tag));

            return $response->setMessage(trans('plugins/vaccancy::tags.deleted'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    public function deletes(Request $request, BaseHttpResponse $response)
    {
        // dd($request);
        return $this->executeDeleteItems($request, $response, $this->tagRepository, VACCANCY_TAG_MODULE_SCREEN_NAME);
    }

    public function getAllTags()
    {
        return $this->tagRepository->pluck('name');
    }
}
