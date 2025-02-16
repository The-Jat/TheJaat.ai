<?php

namespace Botble\Member\Forms\Fronts;

use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\FormAbstract;
use Botble\Member\Http\Requests\UpdatePasswordRequest;
use Botble\Member\Models\Member;
use Illuminate\Support\Facades\Blade;

class ChangePasswordForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Member::class)
            ->setMethod('PUT')
            ->setValidatorClass(UpdatePasswordRequest::class)
            ->setFormOption('template', 'core/base::forms.form-content-only')
            ->setUrl(route('public.member.post.security'))
            ->add(
                'old_password',
                'password',
                TextFieldOption::make()
                    ->label(trans('plugins/member::dashboard.current_password'))
                    ->required()
                    ->maxLength(60)
                    ->toArray()
            )
            ->add(
                'password',
                'password',
                TextFieldOption::make()
                    ->label(trans('plugins/member::dashboard.password_new'))
                    ->required()
                    ->maxLength(60)
                    ->toArray()
            )
            ->add(
                'password_confirmation',
                'password',
                TextFieldOption::make()
                    ->label(trans('plugins/member::dashboard.password_new_confirmation'))
                    ->required()
                    ->maxLength(60)
                    ->toArray()
            )
            ->add('submit', 'html', [
                'html' => Blade::render(
                    sprintf(
                        '<x-core::button type="submit" color="primary">%s</x-core::button>',
                        trans('plugins/member::dashboard.password_update_btn')
                    )
                ),
            ]);
    }
}
