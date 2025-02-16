<?php

namespace Botble\Course\Http\Controllers;
use Illuminate\Http\Request;
use Botble\Course\Models\Course;
use Botble\Course\Services\CourseService;
use Botble\Theme\Events\RenderingSingleEvent;
use Illuminate\Routing\Controller;
use Botble\Slug\Facades\SlugHelper;
use Botble\Theme\Facades\Theme;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\Log;

// Table controller in admin/courses/table
class TableController extends Controller
{
    public function tableLanding(CourseService $courseService)
    {
        // ddd($courseService);
        // $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(Course::class));

        // if (! $slug) {
            // abort(404);
        // }

        // $data = $courseService->handleFrontRoutes($slug);

        // if (isset($data['slug']) && $data['slug'] !== $slug->key) {
        //     return redirect()->to(url(SlugHelper::getPrefix(Course::class) . '/' . $data['slug']));
        // }

        // event(new RenderingSingleEvent($slug));

        // return Theme::scope($data['view'], $data['data'], $data['default_view'])->render();

        // return "hi";

        $courses = Course::where("parent_id","=", 0)->get();
        return view("core/table::course-table", compact('courses'));
    }

    // public function tableList(Request $request){

    //     ddd("tableList");

    //     if ($request->ajax()) {
    //         $data = Course::latest()->get();
    //         return Datatables::of($data)
    //             ->addIndexColumn()
    //             ->addColumn('action', function($row){
    //                 $actionBtn = '<a href="javascript:void(0)" class="edit btn btn-success btn-sm">Edit</a> <a href="javascript:void(0)" class="delete btn btn-danger btn-sm">Delete</a>';
    //                 return $actionBtn;
    //             })
    //             ->rawColumns(['action'])
    //             ->make(true);
    //     }

    // }

    public function edit($id)
    {
        $user = Course::findOrFail($id);
        return "editing " . $id;
        // return view('users.edit', compact('user'));
    }

    public function destroy($id)
    {
        $user = Course::findOrFail($id);
        return "destroying " . $id;
        // $user->delete();
        // return redirect()->route('users.index')->with('success', 'User deleted successfully');
    }

    public function getChildren($itemId){
        $child = Course::where("parent_id",$itemId )->get();
        Log::info('Children data:', [$child]);
        // dd($child);
        return response()->json($child);

    }

    // public function changeSequence(Request $request){
    //     $sequenceData = $request->input('sequence');

    //     foreach ($sequenceData as $postId => $newOrder) {
    //         $post = Course::find($postId);
    //         $post->order = $newOrder;
    //         $post->save();
    //     }
        
    //     return redirect()->back()->with('success', 'Post sequence updated successfully.');

    // }


    public function showReorder()
    {
        $posts = Course::orderBy('order')->get();
        // $posts = null;
        // ddd($posts);
        return view('core/table::reorder', ['posts' => $posts]);
    }

    public function saveReorder(Request $request)
    {
        $newOrder = $request->input('post_order');
        // Log::debug('$newOrder ',[$newOrder]);
        // dd($newOrder);

        $normalArray = [];

        foreach ($newOrder as $key => $value) {
            $elements = explode(',', $value); // Split the comma-separated elements
            $normalArray[$key] = $elements; // Assign the split elements to the normal array
        }
        $flattenedArray = array_merge(...$normalArray); // Flattened array: ['3', '1', '2', '4']

        // dd(count($flattenedArray));
        // foreach ($newOrder as $index => $postId) {
        //     // dd($order);
        //     // Course::where('id', $postId)->update(['order' => $order+1]);
        //     Log::debug('$order ',[$index]);

        //     $post = Course::find($postId);
        //     $post->order = $index + 1;
        //     $post->save();
        // }
        for ($i = 0; $i < count($flattenedArray); $i++) {
            $post = Course::find($flattenedArray[$i]);
            $post->order = $i + 1;
            $post->save();
        }

        return redirect('/admin/courses/posts/reorder')->with('success', 'Post order updated successfully.');
    }

}
