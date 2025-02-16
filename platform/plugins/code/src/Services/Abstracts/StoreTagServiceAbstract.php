<?php

namespace Botble\Code\Services\Abstracts;

use Botble\Code\Models\CodePost;
use Botble\Code\Repositories\Interfaces\TagInterface;
use Illuminate\Http\Request;

abstract class StoreTagServiceAbstract
{
    public function __construct(protected TagInterface $tagRepository)
    {
    }

    abstract public function execute(Request $request, CodePost $post): void;
}
