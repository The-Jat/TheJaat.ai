<?php

namespace Botble\Code\Http\Controllers;

use Botble\Code\Models\Code;
use Botble\Code\Services\CodeService;
use Botble\Theme\Events\RenderingSingleEvent;
use Illuminate\Http\RedirectResponse;
use Illuminate\Routing\Controller;
use Response;
use SlugHelper;
use Theme;

class PublicController extends Controller
{
    /**
     * @param string $slug
     * @param CodeService $codeService
     * @return RedirectResponse|Response
     */
    public function getCode($slug, CodeService $codeService)
    {
        $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(Code::class));

        if (!$slug) {
            abort(404);
        }

        $data = $codeService->handleFrontRoutes($slug);

        if (isset($data['slug']) && $data['slug'] !== $slug->key) {
            return redirect()->to(url(SlugHelper::getPrefix(Code::class) . '/' . $data['slug']));
        }

        event(new RenderingSingleEvent($slug));

        return Theme::scope($data['view'], $data['data'], $data['default_view'])->render();
    }
}
