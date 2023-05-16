<?php

namespace Botble\Base\Facades;

use Botble\Base\Supports\CodeTitle;
use Illuminate\Support\Facades\Facade;

class CodeTitleFacade extends Facade
{
    /**
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return CodeTitle::class;
    }
}
