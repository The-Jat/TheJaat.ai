<?php

namespace Botble\Vaccancy\Services\Abstracts;

use Botble\Vaccancy\Models\VaccancyPost;
use Botble\Vaccancy\Repositories\Interfaces\CategoryInterface;
use Illuminate\Http\Request;

abstract class StoreCategoryServiceAbstract
{
    public function __construct(protected CategoryInterface $categoryRepository)
    {
    }

    abstract public function execute(Request $request, VaccancyPost $post): void;
}
