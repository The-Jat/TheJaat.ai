<?php

namespace Botble\Base\Enums;

use Botble\Base\Supports\Enum;
use Botble\Base\Facades\Html;
use Illuminate\Support\HtmlString;

/**
 * @method static BaseStatusEnum DRAFT()
 * @method static BaseStatusEnum PUBLISHED()
 * @method static BaseStatusEnum PENDING()
 */
class DifficultyStatusEnum extends Enum
{
    public const EASY = 'easy';
    public const MEDIUM = 'medium';
    public const HARD = 'hard';

    public static $langPath = 'core/base::enums.statuses';

    public function toHtml(): string|HtmlString
    {
        return match ($this->value) {
            self::EASY => Html::tag('span', self::DRAFT()->label(), ['class' => 'label-info status-label'])
                ->toHtml(),
            self::MEDIUM => Html::tag('span', self::PENDING()->label(), ['class' => 'label-warning status-label'])
                ->toHtml(),
            self::HARD => Html::tag('span', self::PUBLISHED()->label(), ['class' => 'label-success status-label'])
                ->toHtml(),
            default => parent::toHtml(),
        };
    }
}
