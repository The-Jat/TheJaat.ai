<?php

namespace Botble\Code\Services\Abstracts;

use Botble\Code\Models\CodePost;
use Botble\Code\Repositories\Interfaces\CategoryInterface;
use Illuminate\Http\Request;

abstract class StoreCategoryServiceAbstract
{
    public function __construct(protected CategoryInterface $categoryRepository)
    {
    }

    abstract public function execute(Request $request, CodePost $post): void;
}
