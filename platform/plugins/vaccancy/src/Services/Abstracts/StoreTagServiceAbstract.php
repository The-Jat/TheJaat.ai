<?php

namespace Botble\Vaccancy\Services\Abstracts;

use Botble\Vaccancy\Models\VaccancyPost;
use Botble\Vaccancy\Repositories\Interfaces\TagInterface;
use Illuminate\Http\Request;

abstract class StoreTagServiceAbstract
{
    public function __construct(protected TagInterface $tagRepository)
    {
    }

    abstract public function execute(Request $request, VaccancyPost $post): void;
}
