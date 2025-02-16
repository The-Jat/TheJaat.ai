@extends(BaseHelper::getAdminMasterLayoutTemplate())
@section('content')

@section('content')

    {{-- <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">{{ trans('core/acl::users.close') }}</button> --}}
    {{-- <button type="submit"
        class="btn btn-info button-publish-groups">{{ trans('plugins/translation::translation.publish_translations') }}</button> --}}
    <a href="{{ route('shortener.create') }}" class="btn btn-secondary translation-back">Create</a>
    <div class="p-3 rounded-3 border mb-2" style="background-color: #fff;">
        {{-- <?php foreach($urls as $url): ?> --}}
        {{-- @foreach ($urls as $shortedUrl)
            <div class="p-3 rounded-3 border mb-2">
                @php
                    // dd($shortedUrl->url);
                @endphp
                @include('core/table::partials.links', compact('shortedUrl'))
            </div>
        @endforeach --}}
        @forelse ($urls as $shortedUrl)
    <div class="p-3 rounded-3 border mb-2">
        {{-- @include('core/table::partials.links', compact('shortedUrl')) --}}
        @include('plugins/shortener::partials.links', compact('shortedUrl'))
    </div>
@empty
    <p>No shorted links available</p>
@endforelse
        {{-- <?php endforeach ?> --}}
    </div>

@endsection


@stop
