<div class="ui-select-wrapper form-group {{ Arr::get($selectAttributes, 'wrapper_class') ?: '' }}">
    @php
        // dd($optionsttributes);
        // dd($selectAttributes);
        Arr::set($selectAttributes, 'class', Arr::get($selectAttributes, 'class') . ' ui-select');
        
        $child_id = Arr::get($optionsAttributes, 'child_id', 'blank');
        // Arr::set($selectAttributes, 'class', Arr::get($selectAttributes, 'class') . ' ' . $child_id);
        // dd($selectAttributes);
        
        $childChoices = Arr::get($optionsAttributes, 'childChoices', 'None');
        // dd($childChoices);
        $childChoicesFormatized = [];
        // dd($childChoices);
        $childChoicesFormatized[0] = 'None';
        if($childChoices != 'None'){
            foreach ($childChoices as $item) {
                // $childChoicesFormatized[] = $item['name'];
                $childChoicesFormatized[$item['id']] = $item['name'];
            }
        }
        // else{
        //     $childChoicesFormatized[0] = 'None';
        // }
        // Add "None" to the beginning of the output array
        // array_unshift($childChoicesFormatized, 'None');
        // Append 'None' with key 0

        $childSelected = Arr::get($optionsAttributes, 'childSelected', 0);
        
        // dd($childSelected);
        // dd($childChoicesFormatized);
        // dd($childChoicesFormatized);
        // dd($selected);
    @endphp
    {!! Form::select(
        $name,
        $list ?? $choices,
        $selected,
        $selectAttributes,
        $optionsAttributes,
        $optgroupsAttributes,
    ) !!}
    @php
        Arr::set($selectAttributes, 'class', Arr::get($selectAttributes, 'class') . ' ' . $child_id);
    @endphp
    {!! Form::select(
        $child_id,
        $childChoicesFormatized ?? 'None',
        $childSelected,
        $selectAttributes,
        $optionsAttributes,
        $optgroupsAttributes,
    ) !!}
    <svg class="svg-next-icon svg-next-icon-size-16">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
            <path d="M10 16l-4-4h8l-4 4zm0-12L6 8h8l-4-4z"></path>
        </svg>
    </svg>
</div>
<script>
    $(document).ready(function() {
        $('#{{ $name }}').change(function() {
            var selectedValue = $(this).val();

            // Make an AJAX request to populate the second select box
            $.get('/admin/courses/get-childs-for-parent/' + selectedValue, function(data) {
                data.opt.splice(0, 0, "None");
                // console.log(data.opt);
                // var stringValue = data.stringValue;
                // console.log(stringValue);
                // Clear existing options in the second select
                $('.child').empty();

                // Populate the second select with new options
                $.each(data.opt, function(key, value) {
                    $('.child').append($('<option>', {
                        value: value,
                        text: value
                    }));
                });
            });
        });
    });
</script>
