<?php

namespace Botble\Code\Services;

use Botble\Code\Models\CodePost;
use Botble\Code\Services\Abstracts\StoreCategoryServiceAbstract;
use Illuminate\Http\Request;

class StoreCategoryService extends StoreCategoryServiceAbstract
{
    public function execute(Request $request, CodePost $post): void
    {
        $categories = $request->input('categories');
        if (! empty($categories) && is_array($categories)) {
            $post->categories()->sync($categories);
        }
    }
}
