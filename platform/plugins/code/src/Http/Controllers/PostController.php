<?php

namespace Botble\Code\Http\Controllers;

use Botble\ACL\Models\User;
use Botble\Base\Events\BeforeUpdateContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Facades\PageTitle;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Traits\HasDeleteManyItemsTrait;
use Botble\Code\Forms\PostForm;
use Botble\Code\Http\Requests\PostRequest;
use Botble\Code\Models\CodePost;
use Botble\Code\Repositories\Interfaces\CategoryInterface;
use Botble\Code\Repositories\Interfaces\PostInterface;
use Botble\Code\Repositories\Interfaces\TagInterface;
use Botble\Code\Services\StoreCategoryService;
use Botble\Code\Services\StoreTagService;
use Botble\Code\Tables\PostTable;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends BaseController
{
    use HasDeleteManyItemsTrait;

    public function __construct(
        protected PostInterface $postRepository,
        protected TagInterface $tagRepository,
        protected CategoryInterface $categoryRepository
    ) {
    }

    public function index(PostTable $dataTable)
    {
        PageTitle::setTitle(trans('plugins/code::posts.menu_name'));

        return $dataTable->renderTable();
    }

    public function create(FormBuilder $formBuilder)
    {
        PageTitle::setTitle(trans('plugins/code::posts.create'));

        return $formBuilder->create(PostForm::class)->renderForm();
    }

    public function store(
        PostRequest $request,
        StoreTagService $tagService,
        StoreCategoryService $categoryService,
        BaseHttpResponse $response
    ) {
        /**
         * @var CodePost $post
         */
        $post = $this->postRepository->createOrUpdate(
            array_merge($request->input(), [
                'author_id' => Auth::id(),
                'author_type' => User::class,
            ])
        );

        event(new CreatedContentEvent(POST_MODULE_SCREEN_NAME, $request, $post));

        $request->request->remove('seo_meta');

        $tagService->execute($request, $post);

        $categoryService->execute($request, $post);

        return $response
            ->setPreviousUrl(route('code_posts.index'))
            ->setNextUrl(route('code_posts.edit', $post->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(CodePost $post, FormBuilder $formBuilder)
    {
        PageTitle::setTitle(trans('core/base::forms.edit_item', ['name' => $post->name]));

        return $formBuilder->create(PostForm::class, ['model' => $post])->renderForm();
    }

    public function update(
        CodePost $post,
        PostRequest $request,
        StoreTagService $tagService,
        StoreCategoryService $categoryService,
        BaseHttpResponse $response
    ) {
        event(new BeforeUpdateContentEvent($request, $post));

        $post->fill($request->input());

        $this->postRepository->createOrUpdate($post);

        event(new UpdatedContentEvent(POST_MODULE_SCREEN_NAME, $request, $post));

        $tagService->execute($request, $post);

        $categoryService->execute($request, $post);

        return $response
            ->setPreviousUrl(route('code_posts.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(CodePost $post, Request $request, BaseHttpResponse $response)
    {
        try {
            $this->postRepository->delete($post);

            event(new DeletedContentEvent(POST_MODULE_SCREEN_NAME, $request, $post));

            return $response
                ->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    public function deletes(Request $request, BaseHttpResponse $response)
    {
        return $this->executeDeleteItems($request, $response, $this->postRepository, POST_MODULE_SCREEN_NAME);
    }

    public function getWidgetRecentPosts(Request $request, BaseHttpResponse $response)
    {
        $limit = $request->integer('paginate', 10);
        $limit = $limit > 0 ? $limit : 10;

        $posts = $this->postRepository->advancedGet([
            'with' => ['slugable'],
            'order_by' => ['created_at' => 'desc'],
            'paginate' => [
                'per_page' => $limit,
                'current_paged' => $request->integer('page', 1),
            ],
        ]);

        return $response
            ->setData(view('plugins/code::posts.widgets.posts', compact('posts', 'limit'))->render());
    }
}
