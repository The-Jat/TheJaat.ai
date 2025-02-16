<?php

namespace Botble\Vaccancy\Listeners;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Vaccancy\Repositories\Interfaces\CategoryInterface;
use Botble\Vaccancy\Repositories\Interfaces\PostInterface;
use Botble\Vaccancy\Repositories\Interfaces\TagInterface;
use Botble\Theme\Events\RenderingSiteMapEvent;
use Botble\Theme\Facades\SiteMapManager;

class RenderingSiteMapListener
{
    public function __construct(
        protected PostInterface $postRepository,
        protected CategoryInterface $categoryRepository,
        protected TagInterface $tagRepository
    ) {
    }

    public function handle(RenderingSiteMapEvent $event): void
    {
        if ($key = $event->key) {
            switch ($key) {
                case 'vaccancy-posts':
                    $posts = $this->postRepository->getDataSiteMap();

                    foreach ($posts as $post) {
                        SiteMapManager::add($post->url, $post->updated_at, '0.8');
                    }

                    break;

                case 'vaccancy-categories':
                    $categories = $this->categoryRepository->getDataSiteMap();

                    foreach ($categories as $category) {
                        SiteMapManager::add($category->url, $category->updated_at, '0.8');
                    }

                    break;
                case 'vaccancy-tags':
                    $tags = $this->tagRepository->getDataSiteMap();

                    foreach ($tags as $tag) {
                        SiteMapManager::add($tag->url, $tag->updated_at, '0.3', 'weekly');
                    }

                    break;
            }

            return;
        }

        $postLastUpdated = $this->postRepository
            ->getModel()
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->latest('updated_at')
            ->value('updated_at');

        SiteMapManager::addSitemap(SiteMapManager::route('vaccancy-posts'), $postLastUpdated);

        $categoryLastUpdated = $this->categoryRepository
            ->getModel()
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->latest('updated_at')
            ->value('updated_at');

        SiteMapManager::addSitemap(SiteMapManager::route('vaccancy-categories'), $categoryLastUpdated);

        $tagLastUpdated = $this->tagRepository
            ->getModel()
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->latest('updated_at')
            ->value('updated_at');

        SiteMapManager::addSitemap(SiteMapManager::route('vaccancy-tags'), $tagLastUpdated);
    }
}
