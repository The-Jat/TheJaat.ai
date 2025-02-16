<?php

namespace Botble\Course\Listeners;

use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Theme\Events\RenderingSiteMapEvent;
use Botble\Theme\Facades\SiteMapManager;

class RenderingSiteMapListener
{
    public function __construct(protected CourseInterface $courseRepository)
    {
    }

    public function handle(RenderingSiteMapEvent $event): void
    {
        if ($event->key == 'courses') {
            $courses = $this->courseRepository->getDataSiteMap();

            foreach ($courses as $course) {
                SiteMapManager::add($course->url, $course->updated_at, '0.8');
            }
        }
    }
}
