<div class="tabbable-custom">
    <div class="tab-content">
        <div class="tab-pane active" id="buttons-tab">

            <div class="form-group mb-3">
                <label class="control-label">{{ __('Link') }}</label>
                {{-- value="{{ Arr::get($attributes, 'link') }}" --}}
                <input name="link"
                    value="{{ empty(Arr::get($attributes, 'link')) ? 'www.thejat.in' : Arr::get($attributes, 'link') }}"
                    class="form-control" placeholder="Link">
            </div>

            <div class="form-group mb-3">
                <label class="control-label">{{ __('Button Text') }}</label>
                {{-- <input name="button_text" class="form-control" value="{{ Arr::get($attributes, 'button_text') }}"
                    placeholder="Button Text"> --}}
                <input name="button_text" class="form-control"
                    value="{{ empty(Arr::get($attributes, 'button_text')) ? 'Default Text' : Arr::get($attributes, 'button_text') }}">
            </div>

            <div class="form-group
                    mb-3">
                <label class="control-label">{{ __('Target') }}</label>
                <select name="target[]" class="select2 form-control" multiple>
                    @foreach ($targetsData as $target)
                        <option value="{{ $target['id'] }}" @if (
                            (empty(Arr::get($attributes, 'target')) && $loop->first) ||
                                in_array($target['id'], explode(',', Arr::get($attributes, 'target')))) selected @endif>
                            {{ $target['name'] }}
                        </option>
                    @endforeach

                </select>
            </div>

            <div class="form-group mb-3">
                <label class="control-label">{{ __('Style') }}</label>
                <select name="style[]" class="select2 form-control" multiple>
                    {{-- @foreach ($data as $daat)
                        <option value="{{ $daat['id'] }}" @if (in_array($daat['id'], explode(',', Arr::get($attributes, 'style')))) selected @endif>
                            {{ $daat['name'] }}
                        </option>
                    @endforeach --}}

                    @foreach ($styleData as $daat)
                        <option value="{{ $daat['id'] }}" @if (
                            (empty(Arr::get($attributes, 'style')) && $loop->first) ||
                                in_array($daat['id'], explode(',', Arr::get($attributes, 'style')))) selected @endif>
                            {{ $daat['name'] }}
                        </option>
                    @endforeach

                </select>
            </div>
        </div>
    </div>
</div>