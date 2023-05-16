<?php

namespace Botble\Code\Providers;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Dashboard\Supports\DashboardWidgetInstance;
use Botble\Code\Models\Code;
use Botble\Code\Repositories\Interfaces\CodeInterface;
use Botble\Code\Services\CodeService;
use Eloquent;
use Html;
use Illuminate\Contracts\Container\BindingResolutionException;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;
use Menu;
use RvMedia;
use Throwable;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        if (defined('MENU_ACTION_SIDEBAR_OPTIONS')) {
            Menu::addMenuOptionModel(Code::class);
            add_action(MENU_ACTION_SIDEBAR_OPTIONS, [$this, 'registerMenuOptions'], 10);
        }

        add_filter(DASHBOARD_FILTER_ADMIN_LIST, [$this, 'addCodeStatsWidget'], 15, 2);
        add_filter(BASE_FILTER_PUBLIC_SINGLE_DATA, [$this, 'handleSingleView'], 1);

        if (function_exists('theme_option')) {
            add_action(RENDERING_THEME_OPTIONS_PAGE, [$this, 'addThemeOptions'], 31);
        }

        if (defined('THEME_FRONT_HEADER')) {
            add_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, function ($screen, $code) {
                add_filter(THEME_FRONT_HEADER, function ($html) use ($code) {
                    if (get_class($code) != Code::class) {
                        return $html;
                    }

                    $schema = [
                        '@context' => 'https://schema.org',
                        '@type'    => 'Organization',
                        'name'     => theme_option('site_title'),
                        'url'      => $code->url,
                        'logo'     => [
                            '@type' => 'ImageObject',
                            'url'   => RvMedia::getImageUrl(theme_option('logo')),
                        ],
                    ];

                    return $html . Html::tag('script', json_encode($schema), ['type' => 'application/ld+json'])
                            ->toHtml();
                }, 2);
            }, 2, 2);
        }
    }

    public function addThemeOptions()
    {
        $codes = $this->app->make(CodeInterface::class)
            ->pluck('name', 'id', ['status' => BaseStatusEnum::PUBLISHED]);

    
            // No need as of now.....
        // theme_option()
        //     ->setSection([
        //         'title'      => 'Code',
        //         'desc'       => 'Theme options for Code',
        //         'id'         => 'opt-text-subsection-code',
        //         'subsection' => true,
        //         'icon'       => 'fa fa-book',
        //         'fields'     => [
        //             [
        //                 'id'         => 'homepage_id',
        //                 'type'       => 'customSelect',
        //                 'label'      => trans('packages/codes::codes.settings.show_on_front'),
        //                 'attributes' => [
        //                     'name'    => 'homepage_id',
        //                     'list'    => ['' => trans('packages/codes::codes.settings.select')] + $codes,
        //                     'value'   => '',
        //                     'options' => [
        //                         'class' => 'form-control',
        //                     ],
        //                 ],
        //             ],
        //         ],
        //     ]);
    }

    /**
     * Register sidebar options in menu
     * @throws Throwable
     */
    public function registerMenuOptions()
    {
        if (Auth::user()->hasPermission('codes.index')) {
            Menu::registerMenuOptions(Code::class, trans('packages/codes::codes.menu'));
        }
    }

    /**
     * @param array $widgets
     * @param Collection $widgetSettings
     * @return array
     * @throws BindingResolutionException
     * @throws Throwable
     */
    public function addCodeStatsWidget(array $widgets, Collection $widgetSettings): array
    {
        $codes = $this->app->make(CodeInterface::class)->count(['status' => BaseStatusEnum::PUBLISHED]);

        return (new DashboardWidgetInstance())
            ->setType('stats')
            ->setPermission('codes.index')
            ->setTitle(trans('packages/codes::codes.codes'))
            ->setKey('widget_total_pages')
            ->setIcon('far fa-file-alt')
            ->setColor('#32c5d2')
            ->setStatsTotal($codes)
            ->setRoute(route('codes.index'))
            ->init($widgets, $widgetSettings);
    }

    /**
     * @param Eloquent|Builder $slug
     * @return array|Eloquent
     */
    public function handleSingleView($slug)
    {
        return (new CodeService())->handleFrontRoutes($slug);
    }
}
