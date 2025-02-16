
{{-- It applies this class "mb-3 position-relative" which causes the improper layout of other
elements causing them to be straight line instead of grid. --}}
{{-- @if ($showLabel && $showField)
    @if ($options['wrapper'] !== false)
        <div {!! $options['wrapperAttrs'] !!}>
    @endif
@endif --}}
@if ($showLabel && $options['label'] !== false && $options['label_show'])
{!! Form::customLabel($name, $options['label'], $options['label_attr']) !!}
@endif

@if ($showField)
@php
        $emptyVal = $options['empty_value'] ? ['' => $options['empty_value']] : null;
        
        // dd($options);
        // dd($options['choices']);
        if (array_key_exists($options['selected'], $options['choices'])){//in_array($options['choices'], $options['selected'])) {
            // Value 5 exists in the array
            // dd('Value 5 exists in the array.');
            // dd($options);
            $matchingItems = [];
            // dd($options['completeList']);
            // Find items with parent_id = $parentItem['id']
            // store the items that has the id equal to the our parent_id
            foreach ($options['completeList'] as $item) {
                if ($item['parent_id'] === $options['selected']) {
                    $matchingItems[] = $item;
                }
            }
            // dd($matchingItems);
            $options['optionAttrs']['childChoices'] = $matchingItems;
        } else {
            // Value 5 does not exist in the array
            // dd('Value 5 does not exist in the array.');
            // $courseModel = Course::find($options['selected']);
        
            $foundItem = null;
            // dd($options);
            $options['optionAttrs']['childSelected'] = $options['selected']; //store 5 as the child selection
        
            // Find the parent_id of the item with id which is selected.
            $desiredId = $options['selected'];
            $parentId = null;
            // It will iterate over the completeList and store the parent_id of the item
            //  which is selected, and then break the loop
            foreach ($options['completeList'] as $item) {
                if ($item['id'] === $desiredId) {
                    $parentId = $item['parent_id'];
                    break;
                }
            }
            // dd($parentId);
            // if (!$parentId) {
            //     $parentId = 0;
            // }
        
            $parentItem = null;
            // Find the item with id equal to $parentId
            // It will again iterate over the complete list as $item and store the item which
            // is equal to $parentId and Store the id of the parentItem in the options which
            // will be passed to the partials.
            if ($parentId !== null) {
                foreach ($options['completeList'] as $item) {
                    if ($item['id'] === $parentId) {
                        $parentItem = $item;
                        $options['selected'] = $parentItem['id'];
                        break;
                    }
                }
            } else {
                // dd("else");
                $parentItem = [
                    'id' => 0,
                    'name' => 'None',
                    'parent_id' => 0,
                ];
            }
            // dd($parentItem);
            $matchingItems = [];
            // dd($options['completeList']);
            // Find items with parent_id = $parentItem['id']
            // store the items that has the id equal to the our parent_id
            foreach ($options['completeList'] as $item) {
                if ($item['parent_id'] === $parentItem['id']) {
                    $matchingItems[] = $item;
                }
            }
        
            // dd($matchingItems);
            $options['childChoices'] = $matchingItems;
            // $options["childChoices"] = $matchingItems;
            $options['optionAttrs']['childChoices'] = $matchingItems;
        
            // dd($options);
        
            // $matchingItems now contains items with parent_id = $parentItem['id']
        
            // dd($options);
            // $parentId now contains the parent_id of the item with id = 5
            // $parentItem contains the item with id equal to $parentId (if found)
        }
        
        // dd( Arr::get($options, 'optionAttrs', []));
        // dd()
    @endphp
    {!! Form::customSelectParentChild(
        $name,
        (array) $emptyVal + $options['choices'],
        $options['selected'],
        $options['attr'],
        Arr::get($options, 'optionAttrs', []),
        Arr::get($options, 'optgroupsAttributes', []),
    ) !!}
    {{-- @php
        $name = 'abc';
    @endphp
    {!! Form::customSelect($name, (array)$emptyVal + $options['choices'], $options['selected'], $options['attr'], Arr::get($options, 'optionAttrs', []), Arr::get($options, 'optgroupsAttributes', [])) !!} --}}
    @include('core/base::forms.partials.help-block')
@endif
{{-- 
@include('core/base::forms.partials.errors')

@if ($showLabel && $showField)
    @if ($options['wrapper'] !== false)
        </div>
    @endif
@endif --}}
