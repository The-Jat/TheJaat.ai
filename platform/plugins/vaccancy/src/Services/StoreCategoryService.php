<?php

namespace Botble\Vaccancy\Services;

use Botble\Vaccancy\Models\VaccancyPost;
use Botble\Vaccancy\Services\Abstracts\StoreCategoryServiceAbstract;
use Illuminate\Http\Request;

class StoreCategoryService extends StoreCategoryServiceAbstract
{
    public function execute(Request $request, VaccancyPost $post): void
    {
        $categories = $request->input('categories');
        if (! empty($categories) && is_array($categories)) {
            $post->categories()->sync($categories);
        }
    }
}
