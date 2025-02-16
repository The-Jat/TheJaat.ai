<?php

namespace Botble\Course\Http\Controllers;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Course\Models\Course;
use Botble\Course\Services\CourseService;

// use Illuminate\Support\Facades\Log;
use Illuminate\Routing\Controller;

class FormFieldsController extends Controller
{
    // use HasDeleteManyItemsTrait;

    public function getChildsForParent($id)
    {

        // Query the database or any data source to get options based on $selectedValue
        // Get only those whose status is pulished
        $options = Course::where('parent_id', $id)
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->pluck('name');

        // $options = "abc";
        // array_unshift($options, 'None');

        // dd($options);

        // return response()->json($options);
        // $stringValue = "This is the string you want to return.";

        return response()->json(['opt' => $options]);
    }
}
