<?php

namespace Botble\Course\Supports;

use Botble\Base\Facades\BaseHelper;
use Botble\Theme\Facades\Theme;

class Template
{
    public static function registerCourseTemplate(array $templates = []): void
    {
        $validTemplates = [];
        foreach ($templates as $key => $template) {
            if (in_array($key, self::getExistsTemplate())) {
                $validTemplates[$key] = $template;
            }
        }

        config([
            'packages.course.general.templates' => array_merge(
                config('packages.course.general.templates'),
                $validTemplates
            ),
        ]);
    }

    protected static function getExistsTemplate(): array
    {
        // $files = BaseHelper::scanFolder(theme_path(Theme::getThemeName() . DIRECTORY_SEPARATOR . config('packages.theme.general.containerDir.layout')));
        // foreach ($files as $key => $file) {
        //     $files[$key] = str_replace('.blade.php', '', $file);
        // }

        // return $files;

        $themes = [
            Theme::getThemeName(),
        ];

        if (Theme::hasInheritTheme()) {
            $themes[] = Theme::getInheritTheme();
        }

        foreach ($themes as $theme) {
            $files = BaseHelper::scanFolder(theme_path($theme . DIRECTORY_SEPARATOR . config('packages.theme.general.containerDir.layout')));

            foreach ($files as $key => $file) {
                $files[$key] = str_replace('.blade.php', '', $file);
            }
        }
        return $files;
    }

    public static function getCourseTemplates(): array
    {
        return (array)config('packages.course.general.templates', []);
    }
}
