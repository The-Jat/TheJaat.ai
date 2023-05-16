<?php

namespace Botble\Code\Http\Controllers;

use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Traits\HasDeleteManyItemsTrait;
use Botble\Code\Forms\CodeForm;
use Botble\Code\Http\Requests\CodeRequest;
use Botble\Code\Repositories\Interfaces\CodeInterface;
use Botble\Code\Tables\CodeTable;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Contracts\View\View;
use Throwable;

class CodeController extends BaseController
{
    use HasDeleteManyItemsTrait;

    /**
     * @var CodeInterface
     */
    protected $codeRepository;

    /**
     * CodeController constructor.
     * @param CodeInterface $codeRepository
     */
    public function __construct(CodeInterface $codeRepository)
    {
        $this->codeRepository = $codeRepository;
    }

    /**
     * @param CodeTable $dataTable
     * @return JsonResponse|View
     *
     * @throws Throwable
     */
    public function index(CodeTable $dataTable)
    {
        // dd($dataTable);
        code_title()->setTitle(trans('packages/codes::codes.menu_name'));

        return $dataTable->renderTable();
    }

    /**
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        //dd(trans('packages/codes::codes.create'));
        code_title()->setTitle(trans('packages/codes::codes.create'));

        return $formBuilder->create(CodeForm::class)->renderForm();
    }

    /**
     * @param CodeRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function store(CodeRequest $request, BaseHttpResponse $response)
    {
        $code = $this->codeRepository->createOrUpdate(array_merge($request->input(), [
            'user_id' => Auth::id(),
        ]));

        event(new CreatedContentEvent(CODE_MODULE_SCREEN_NAME, $request, $code));

        return $response->setPreviousUrl(route('codes.index'))
            ->setNextUrl(route('codes.edit', $code->id))
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
        $code = $this->codeRepository->findOrFail($id);

        code_title()->setTitle(trans('packages/codes::codes.edit') . ' "' . $code->name . '"');

        event(new BeforeEditContentEvent($request, $code));

        return $formBuilder->create(CodeForm::class, ['model' => $code])->renderForm();
    }

    /**
     * @param $id
     * @param CodeRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function update($id, CodeRequest $request, BaseHttpResponse $response)
    {
        $code = $this->codeRepository->findOrFail($id);
        $code->fill($request->input());

        $code = $this->codeRepository->createOrUpdate($code);

        event(new UpdatedContentEvent(CODE_MODULE_SCREEN_NAME, $request, $code));

        return $response
            ->setPreviousUrl(route('codes.index'))
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
            $code = $this->codeRepository->findOrFail($id);
            $this->codeRepository->delete($code);

            event(new DeletedContentEvent(CODE_MODULE_SCREEN_NAME, $request, $code));

            return $response->setMessage(trans('packages/codes::codes.deleted'));
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
        return $this->executeDeleteItems($request, $response, $this->codeRepository, CODE_MODULE_SCREEN_NAME);
    }
}
