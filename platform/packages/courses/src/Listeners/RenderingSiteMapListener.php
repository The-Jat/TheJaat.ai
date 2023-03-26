<?php

namespace Botble\Course\Listeners;

use Botble\Course\Repositories\Interfaces\CourseInterface;
use SiteMapManager;

class RenderingSiteMapListener
{
    /**
     * @var CourseInterface
     */
    protected $courseRepository;

    /**
     * RenderingSiteMapListener constructor.
     * @param CourseInterface $courseRepository
     */
    public function __construct(CourseInterface $courseRepository)
    {
        $this->courseRepository = $courseRepository;
    }

    /**
     * Handle the event.
     *
     * @return void
     */
    public function handle()
    {
        $courses = $this->courseRepository->getDataSiteMap();

        foreach ($courses as $course) {
            SiteMapManager::add($course->url, $course->updated_at, '0.8');
        }
    }
}
