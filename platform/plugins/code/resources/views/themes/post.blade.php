@php Theme::layout('no-breadcrumbs') @endphp

{{-- Retrieve CSS from the Theme options --}}
@php
    $cssStyles = theme_option('child_code_css');
@endphp

<style>
    {{ $cssStyles }}
</style>

<div class="row">
    <div class="col-lg-8 col-md-12 col-sm-12">

        <div class='code-content'>
            {!! BaseHelper::clean($post->content) !!}
        </div>
        <br />
        {!! apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, null) !!}
    </div>
</div>
