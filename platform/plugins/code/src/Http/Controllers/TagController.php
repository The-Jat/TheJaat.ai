<?php

namespace Botble\Code\Http\Controllers;

use Botble\ACL\Models\User;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Facades\PageTitle;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Traits\HasDeleteManyItemsTrait;
use Botble\Code\Forms\TagForm;
use Botble\Code\Http\Requests\TagRequest;
use Botble\Code\Models\CodeTag;
use Botble\Code\Repositories\Interfaces\TagInterface;
use Botble\Code\Tables\TagTable;
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
        PageTitle::setTitle(trans('plugins/code::tags.menu'));

        return $dataTable->renderTable();
    }

    public function create(FormBuilder $formBuilder)
    {
        PageTitle::setTitle(trans('plugins/code::tags.create'));

        return $formBuilder->create(TagForm::class)->renderForm();
    }

    public function store(TagRequest $request, BaseHttpResponse $response)
    {
        $tag = $this->tagRepository->createOrUpdate(array_merge($request->input(), [
            'author_id' => Auth::id(),
            'author_type' => User::class,
        ]));
        event(new CreatedContentEvent(TAG_MODULE_SCREEN_NAME, $request, $tag));

        return $response
            ->setPreviousUrl(route('code_tags.index'))
            ->setNextUrl(route('code_tags.edit', $tag->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(CodeTag $tag, FormBuilder $formBuilder)
    {
        PageTitle::setTitle(trans('core/base::forms.edit_item', ['name' => $tag->name]));

        return $formBuilder->create(TagForm::class, ['model' => $tag])->renderForm();
    }

    public function update(CodeTag $tag, TagRequest $request, BaseHttpResponse $response)
    {
        $tag->fill($request->input());

        $this->tagRepository->createOrUpdate($tag);
        event(new UpdatedContentEvent(TAG_MODULE_SCREEN_NAME, $request, $tag));

        return $response
            ->setPreviousUrl(route('code_tags.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(CodeTag $tag, Request $request, BaseHttpResponse $response)
    {
        try {
            $this->tagRepository->delete($tag);

            event(new DeletedContentEvent(TAG_MODULE_SCREEN_NAME, $request, $tag));

            return $response->setMessage(trans('plugins/code::tags.deleted'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    public function deletes(Request $request, BaseHttpResponse $response)
    {
        return $this->executeDeleteItems($request, $response, $this->tagRepository, TAG_MODULE_SCREEN_NAME);
    }

    public function getAllTags()
    {
        return $this->tagRepository->pluck('name');
    }
}
