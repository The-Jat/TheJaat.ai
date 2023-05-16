<?php

namespace Botble\Code\Listeners;

use Botble\Code\Repositories\Interfaces\CodeInterface;
use SiteMapManager;

class RenderingSiteMapListener
{
    /**
     * @var CodeInterface
     */
    protected $codeRepository;

    /**
     * RenderingSiteMapListener constructor.
     * @param CodeInterface $codeRepository
     */
    public function __construct(CodeInterface $codeRepository)
    {
        $this->codeRepository = $codeRepository;
    }

    /**
     * Handle the event.
     *
     * @return void
     */
    public function handle()
    {
        $codes = $this->codeRepository->getDataSiteMap();

        foreach ($codes as $code) {
            SiteMapManager::add($code->url, $code->updated_at, '0.8');
        }
    }
}
