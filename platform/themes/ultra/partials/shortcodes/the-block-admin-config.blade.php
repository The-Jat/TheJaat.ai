<div class="form-group mb-3">
    <label class="control-label">{{ __('Heading') }}</label>
    <input type="text" name="heading" value="{{ Arr::get($shortcode, 'heading') }}" class="form-control"/>
</div>

<div class="form-group mb-3">
    <label class="control-label">{{ __('Sub title') }}</label>
    <input name="subtitle" value="{{ Arr::get($shortcode, 'subtitle') }}" class="form-control" placeholder="Sub title">
</div>
<div class="form-group">
    <label class="control-label">{{  __('Content') }}</label>
    {{-- {{ Form::textarea('content', Arr::get($attributes, 'content'), ['class' => 'form-control', 'data-shortcode-attribute' => 'content', 'rows' => 3, 'placeholder' => __('HTML code')]) }} --}}

    {{-- {{ Form::textarea('content', Arr::get($attributes, 'content'), ['class' => 'form-control', 'data-shortcode-attribute' => 'content', 'rows' => 3, 'placeholder' => __('HTML code')]) }} --}}

{{-- this below works --}}
    {{-- {{ Form::textarea('content', nl2br(e(Arr::get($shortcode, 'content'))), ['class' => 'form-control', 'rows' => 3, 'placeholder' => __('HTML code')]) }} --}}
    
    {!! Form::textarea('content', Arr::get($shortcode, 'content'), ['class' => 'form-control', 'rows' => 3, 'placeholder' => __('HTML code')]) !!}




    {{-- {!! Form::textarea('seo_meta[seo_description]', strip_tags($meta['seo_description']) ?? old('seo_meta.seo_description'), ['class' => 'form-control', 'rows' => 3, 'id' => 'seo_description', 'placeholder' => trans('packages/seo-helper::seo-helper.seo_description'), 'data-counter' => 160]) !!} --}}
</div>

{{-- <div class="form-group mb-3">
    <label class="control-label">{{ __('Background style') }}</label>
    {!! Form::select('background_style', get_background_styles(), Arr::get($attributes, 'background_style'), ['class' => 'form-control']) !!}
</div> --}}
