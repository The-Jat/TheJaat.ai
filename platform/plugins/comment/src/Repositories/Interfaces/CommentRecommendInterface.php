<?php

namespace Botble\Comment\Repositories\Interfaces;

use Botble\Base\Models\BaseModel;
use Botble\Support\Repositories\Interfaces\RepositoryInterface;

interface CommentRecommendInterface extends RepositoryInterface
{
    /**
     * @param array $reference
     * @param BaseModel $user
     * @return mixed
     */
    public function getRecommendOfArticle(array $reference, $user);
}
