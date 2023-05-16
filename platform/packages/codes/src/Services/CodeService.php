<?php

namespace Botble\Code\Services;

use Barryvdh\Debugbar\Facades\Debugbar as FacadesDebugbar;
use BaseHelper;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Code\Models\Code;
use Botble\Code\Repositories\Interfaces\CodeInterface;
use Botble\SeoHelper\SeoOpenGraph;
use DebugBar\DebugBar;
use Eloquent;
use Exception;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use RvMedia;
use SeoHelper;
use Theme;

class CodeService
{
    /**
     * @param Eloquent|Builder $slug
     * @return array|Eloquent
     */
    public function handleFrontRoutes($slug)
    {
        if (!$slug instanceof Eloquent) {
            return $slug;
        }

        $condition = [
            'id'     => $slug->reference_id,
            'status' => BaseStatusEnum::PUBLISHED,
        ];

        if (Auth::check() && request()->input('preview')) {
            Arr::forget($condition, 'status');
        }

        if ($slug->reference_type !== Code::class) {
            return $slug;
        }

        $code = app(CodeInterface::class)->getFirstBy($condition, ['*'], ['slugable']);

        if (empty($code)) {
            abort(404);
        }

        $meta = new SeoOpenGraph();
        if ($code->image) {
            $meta->setImage(RvMedia::getImageUrl($code->image));
        }

        if (!BaseHelper::isHomepage($code->id)) {
            SeoHelper::setTitle($code->name)
                ->setDescription($code->description);

            $meta->setTitle($code->name);
            $meta->setDescription($code->description);
        } else {
            $siteTitle = theme_option('seo_title') ? theme_option('seo_title') : theme_option('site_title');
            $seoDescription = theme_option('seo_description');

            SeoHelper::setTitle($siteTitle)
                ->setDescription($seoDescription);

            $meta->setTitle($siteTitle);
            $meta->setDescription($seoDescription);
        }

        $meta->setUrl($code->url);
        $meta->setType('article');

        SeoHelper::setSeoOpenGraph($meta);

        if ($code->template) {
            Theme::uses(Theme::getThemeName())
                ->layout($code->template);
        }

        if (function_exists('admin_bar') && Auth::check() && Auth::user()->hasPermission('codes.edit')) {
            admin_bar()
                ->registerLink(trans('packages/codes::codes.edit_this_page'), route('codes.edit', $code->id));
        }

        do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, CODE_MODULE_SCREEN_NAME, $code);

        Theme::breadcrumb()
            ->add(__('Home'), route('public.index'))
            ->add(SeoHelper::getTitle(), $code->url);

            // FacadesDebugbar::warning("hi");

            // try{
            //     throw new Exception("was trying");

            // }catch(Exception $e){
            //     FacadesDebugbar::addException($e);
            // }


            // try {

  

            //     /* Write Your Code Here */
              
                
              
            //   } catch (Exception $e) {
              
                
              
            //       return $e->getMessage();
              
            //   }

        return [
            'view'         => 'code',
            'default_view' => 'packages/codes::themes.code',
            'data'         => compact('code'),
            'slug'         => $code->slug,
        ];
    }
}
