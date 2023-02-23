<?php

namespace Botble\Comment\Supports;

use Illuminate\Foundation\Application;

class CheckMemberCredentials
{
    /**
     * @var Application
     */
    protected $app;

    /**
     * @var string
     */
    protected $provider = COMMENT_GUARD;

    /**
     * @param Application $app
     */
    public function __construct(Application $app)
    {
        $this->app = $app;
    }

    /**
     * @return \Illuminate\Contracts\Auth\Authenticatable|null
     */
    public function handle()
    {
        $user = auth()->guard(COMMENT_GUARD)->user();

        if ($user) {
            app('auth')->guard(COMMENT_GUARD)->setUser($user);

            return $user;
        }

        return null;
    }
}
