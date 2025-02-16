<?php

namespace Botble\Shortener\Http\Controllers;

use Botble\ACL\Models\User;
use Botble\Base\Events\BeforeUpdateContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Facades\PageTitle;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Traits\HasDeleteManyItemsTrait;
use Botble\Shortener\Forms\PostForm;
use Botble\Shortener\Http\Requests\ShortenerRequest;
use Botble\Shortener\Models\Shortener;
use Botble\Shortener\Repositories\Interfaces\ShortenerInterface;
use Botble\Shortener\Services\StoreCategoryService;
use Botble\Shortener\Services\StoreTagService;
// use Botble\Shortener\Tables\PostTable;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Botble\Shortener\Help\Helper;
use Illuminate\Support\Facades\Log;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Hash;


class ShortenerController extends BaseController
{
    use HasDeleteManyItemsTrait;

    public function __construct(
        // protected ShortenerInterface $postRepository
    )
    {
    }

    public function index()
    {
        PageTitle::setTitle(trans('plugins/shortener::index.menu_name'));

        $urls = Shortener::all();
        // dd($urls);
        return view('plugins/shortener::shortener-list', ['urls' => $urls]);
    }

    public function fetch()
    {
        $urls = Shortener::all();
        return view('core/table::shortener-list', ['urls' => $urls]);
    }

    public function create(FormBuilder $formBuilder)
    {
        PageTitle::setTitle(trans('plugins/shortener::posts.create'));

        // return $formBuilder->create(PostForm::class)->renderForm();
        return view("plugins/shortener::shortener");
    }


    // public function store(
    //     PostRequest $request,
    //     BaseHttpResponse $response
    // ) {
    //     /**
    //      * @var Post $post
    //      */
    //     $post = $this->postRepository->createOrUpdate(
    //         array_merge($request->input(), [
    //             'author_id' => Auth::id(),
    //             'author_type' => User::class,
    //         ])
    //     );

    //     event(new CreatedContentEvent(POST_MODULE_SCREEN_NAME, $request, $post));

    //     $request->request->remove('seo_meta');

    //     $tagService->execute($request, $post);

    //     $categoryService->execute($request, $post);

    //     return $response
    //         ->setPreviousUrl(route('posts.index'))
    //         ->setNextUrl(route('posts.edit', $post->id))
    //         ->setMessage(trans('core/base::notices.create_success_message'));
    // }

    public function store(Request $request)
    {
        dd($request);
        // return redirect()->route('shortener.index')->with('success', 'Shortener created successfully');
    }
    public function edit(Shortener $shortener, FormBuilder $formBuilder)
    {
        return view("plugins/shortener::shortener", compact('shortener'));
        // PageTitle::setTitle(trans('core/base::forms.edit_item', ['name' => $post->name]));

        // return $formBuilder->create(PostForm::class, ['model' => $post])->renderForm();
    }

    // public function update(
    //     // Shortener $shortener,
    //     // ShortenerRequest $request,
    //     // StoreTagService $tagService,
    //     // StoreCategoryService $categoryService,
    //     // BaseHttpResponse $response
    // ) {
    //     // event(new BeforeUpdateContentEvent($request, $post));

    //     // dd("hi");
    //     $shortener->fill($request->input());

    //     // $this->postRepository->createOrUpdate($post);

    //     // event(new UpdatedContentEvent(POST_MODULE_SCREEN_NAME, $request, $post));

    //     // $tagService->execute($request, $post);

    //     // $categoryService->execute($request, $post);

    //     // return $response
    //     //     ->setPreviousUrl(route('posts.index'))
    //     //     ->setMessage(trans('core/base::notices.update_success_message'));
    // }


    public function update(Shortener $shortener, Request $request, BaseHttpResponse $response)
    {
        // Todo Validate URL
        // $url = $this->validateIt(Helper::clean($request->url, 3));
        // if (empty($url) || !$url) throw new \Exception(e('Please enter a valid URL.'));

        // Update the Shortener model with the new data
        $shortener->update([
            'url' => $request->input('url'),
            'type' => $request->input('type'),
            'description' => $request->input('description'),
            'pass'  => $request->input('pass') ?? "",
            'domain' => $request->input('domain') ?? "",
            // 'pass'  => $request->input('pass') ? Hash::make($request->input('pass')) : "",
            // Hash the password if provided, or set it to null if not provided
            'clicklimit' => $request->input('clicklimit') ?? "",
            // 'custom' => $request->input('custom'),
            // Add other fields as needed
        ]);
        // dd($shortener);
        // Add a success flash message to the session
        // session()->flash('success', 'Shortener updated successfully');
        return redirect()->route('shortener.edit', $shortener->id)->with('success', 'Shortener updated successfully');


        // return $response
        //     ->setPreviousUrl(route('shortener.edit', $shortener))
        //     ->setMessage('done');


        // return redirect()->route('shortener.edit', $shortener->id)->with('success', 'Shortener updated successfully');
    }


    public function destroy(Request $request, BaseHttpResponse $response, $id)
    {
        try {
            // Find the entry by ID and delete it
            $entry = Shortener::find($id);

            if (!$entry) {
                // Handle the case where the entry is not found
                return $response
                    ->setError()
                    ->setMessage("Error, Not found the id = " . $id);
            }

            $entry->delete();
            return $response
                ->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    public function deletes(Request $request, BaseHttpResponse $response)
    {
        return $this->executeDeleteItems($request, $response, $this->postRepository, POST_MODULE_SCREEN_NAME);
    }

    public function getWidgetRecentPosts(Request $request, BaseHttpResponse $response)
    {
        $limit = $request->integer('paginate', 10);
        $limit = $limit > 0 ? $limit : 10;

        $posts = $this->postRepository->advancedGet([
            'with' => ['slugable'],
            'order_by' => ['created_at' => 'desc'],
            'paginate' => [
                'per_page' => $limit,
                'current_paged' => $request->integer('page', 1),
            ],
        ]);

        return $response
            ->setData(view('plugins/shortener::posts.widgets.posts', compact('posts', 'limit'))->render());
    }

    public function Sub(Request $request, BaseHttpResponse $response)
    {
        $user = null;
        // dd($request);
        $results = [];
        if ($request->urls) {

            $urls = explode("\n", $request->urls);
            if (!$urls || empty($urls)) return response()->json(['message' => 'Form submitted successfully']); //(new Response(['error' => true, 'message' => 'Please enter valid links.']))->json();


            foreach ($urls as $url) {
                $request->url = trim($url);
                try {
                    $results[] = $this->createLink($request, $user)['shorturl'];
                } catch (\Exception $e) {
                    $results[] =  $e->getMessage();
                }
            }

            return (response()->json(['error' => false, 'message' => 'Links have been shortened.', 'multiple' => true, 'data' => implode("\n", $results)]))->json();
        }
        try {
            $result = $this->createLink($request, $user, true);
            // dd("aftr return");
            // Return a response indicating the action is completed
            // Assuming the action was successful, return a JSON response
            // dd('done');
            // Log::debug($request->all());
            return response(json_encode(['success' => true, 'url' => $result['url'], 'alias' => $result['alias'], 'unProtocolUrl' => $result['unProtocolUrl'], 'domain' => $result['domain']]))
                ->header('Content-Type', 'text/plain')
                ->header('Content-Disposition', 'inline');

            return response()->json(['success' => true, 'url' => $result['url'], 'alias' => $result['alias']]);
            return $response()->json(['success' => true, 'url' => $result['url'], 'alias' => $result['alias']]);
            // ->json(['success' => true, 'url' => $result['url'], 'alias' => $result['alias']])
            // ->setPreviousUrl(route('posts.index'))
            // ->setNextUrl(route('posts.edit', $post->id))
            // ->setMessage(trans('core/base::notices.create_success_message'));
            // return response()->json(['message' => 'Links have been shortened.']);
            // return (response()->json(['error' => false, 'message' => 'Links have been shortened.', 'multiple' => true, 'data' => implode("\n", $results)]))->json();

        } catch (\Exception $e) {
            return (response()->json(['error'   => true]));
        }

        // return (response()->json(['error'   => true]));

    }

    public function createLink($request, $user = null, $output = false)
    {
        $unProtocolUrl = $request->url;
        $shortenedUrl = new Shortener();

        // Validate URL
        $url = $this->validateIt(Helper::clean($request->url, 3));

        // // Validate Request
        if (empty($url) || !$url) throw new \Exception(e('Please enter a valid URL.'));

        // // Prevent self-shortening;
        // if(appConfig('app.self_shortening') == false && $this->isSelf($url)) throw new \Exception(e('You cannot shorten URLs of this website.'));

        // // Check domain is blacklisted
        // if($this->domainBlacklisted($url)) throw new \Exception(e('This domain name or link has been blacklisted.'));

        // // Match the domain to the list of keywords
        // if($this->wordBlacklisted($url)) throw new \Exception(e('This URL contains blacklisted keywords.'));

        // // Checks URL with Google
        // if(!$this->safe($url)) throw new \Exception(e('URL is suspected to contain malware and other harmful content.'));

        // // Checks URL with Phishtank
        // if($this->phish($url)) throw new \Exception(e('URL is suspected to contain malware and other harmful content.'));

        // // Check Virus Total
        // if($this->virus($url)) throw new \Exception(e('URL is suspected to contain malware and other harmful content.'));

        // // Check if URL is linked to .exe, .dll, .bin, .dat, .osx,
        // if(config('adult') && in_array(Helper::extension($url), appConfig('app.executables'))) throw new \Exception(e('Linking to executable files is not allowed.'));

        // // Check expiration
        // if($request->expiry && strtotime("now") > strtotime($request->expiry)) throw new \Exception(e('The expiry date must be later than today.'));

        // // Validate selected domain name
        // if($request->domain && !$this->validateDomainNames(trim($request->domain), $user, false)){
        // 	$request->domain = config("url");
        // }

        // if(!$request->domain && config("root_domain")) {
        // 	$request->domain = config("url");
        // }

        // Generate the alias
        $shortenedUrl->alias = $this->alias();
        // Check custom alias
        if ($request->custom) {
            if (strlen($request->custom) < 3) {
                throw new \Exception('Custom alias must be at least 3 characters.');
            }
            // Check if the entry exists
            $exists = Shortener::where('alias', '=', $request->custom)->exists();
            if ($exists) {
                // The entry exists in the database
                // You can perform further actions here
                throw new \Exception('That alias is taken. Please choose another one.');
            } else {
                $shortenedUrl->alias = $request->custom;
            }
        }

        // Check expiration
        if ($request->expiry && strtotime("now") > strtotime($request->expiry)) throw new \Exception('The expiry date must be later than today.');

        // Todo Add real userid and custom alias
        $shortenedUrl->userid = 1; // Replace with the actual user ID
        // $shortenedUrl->alias = $this->alias();
        $shortenedUrl->custom = 'custom_alias';
        $shortenedUrl->url = $url;
        $shortenedUrl->domain = $request->domain;

        // Will not hash the password because in current way we not able to unhash it, in case of editing.
        // $password = $request->input('pass', '');
        // // $hashedPassword = $password ? Hash::make($password) : '';
        $shortenedUrl->pass = $request->pass ?? '';

        // $shortenedUrl->pass = $request->pass ?? "";
        $shortenedUrl->description = $request->description ?? '';

        $shortenedUrl->meta_image = isset($filename) ? $filename : null;
        $shortenedUrl->bundle = 0;

        $shortenedUrl->meta_title = "";
        $shortenedUrl->meta_description = "";

        $shortenedUrl->type = $request->type;
        $shortenedUrl->pixels = "";
        $shortenedUrl->parameters = null;
        $shortenedUrl->qrid = 0;
        $shortenedUrl->profileid = 0;

        $shortenedUrl->expiry = $request->expiry;
        $shortenedUrl->click = $request->clicklimit ?? 0;

        // $shortenedUrl->save();
        try {
            $saved = $shortenedUrl->save();

            // dd($saved);

            // Remove both "https://" and "http://" from the URL
            // $trimmedUrl = str_replace(['https://', 'http://'], '', $url);
            $result = [
                'url' => $shortenedUrl->url,
                'alias' => $shortenedUrl->alias,
                'unProtocolUrl' => $unProtocolUrl,
                'domain'    => $shortenedUrl->domain,
            ];
            return $result;
        } catch (\Exception $e) {
            dd($e);
            // Handle the exception (e.g., log the error message)
        }

        if ($shortenedUrl->save()) {
            // The save operation was successful
            dd("Saved successfully!");
        } else {
            // The save operation failed
            dd("Save operation failed!");
        }

    }

    public function alias()
    {
        $unique = false;
        $max_loop = 100;
        $i = 0;
        // Todo read it from config or from user input
        $length = 5; //config("alias_length");'alias_length' => '5'

        if ($length < 2) $length = 2;

        // 'aliasformat' => 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
        // Todo: read it from config.
        $format = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'; //appConfig('app.aliasformat');

        while (!$unique) {
            // retry if max attempt reached
            if ($i >= $max_loop) {
                $length++;
                $i = 0;
            }
            $alias = Helper::rand($length, '', $format);

            // Check if the alias exists in the database
            $existingUrl = Shortener::where('alias', $alias)->first();
            // dd(DB::getQueryLog()); // Dump the executed queries for debugging

            if (!$existingUrl) {
                // The alias does not exist in the database
                $unique = true;
            } else {
                // The alias already exists in the database
                $unique = false;
            }

            $i++;
        }
        return $alias;
    }

    public function validateIt($url)
    {
        if (empty($url)) return FALSE;

        $parsed = parse_url($url);
        $protocol = $parsed['scheme'] ?? 'https://';

        $schemes = explode(",", config("schemes"));

        $schemes = array_diff($schemes, ["http", "https", "www"]);

        if ($protocol) {
            if (in_array($protocol, $schemes)) {
                // dd($url);
                return $url;
            }
        }

        if (preg_match('~^([a-zA-Z0-9+!*(),;?&=$_.-]+(:[a-zA-Z0-9+!*(),;?&=$_.-]+)?@)?([a-zA-Z0-9\-\.]*)\.(([a-zA-Z]{2,4})|([0-9]{1,3}\.([0-9]{1,3})\.([0-9]{1,3})))(:[0-9]{2,5})?(/([a-zA-Z0-9+$_%-]\.?)+)*/?(\?[a-z+&\$_.-][a-zA-Z0-9;:@&%=+/$_.-]*)?(#[a-z_.-][a-zA-Z0-9+$%_.-]*)?~', $url) && !preg_match('(http://|https://)', $url)) {
            $url = "https://$url";
        }

        if (!Helper::isURL($url)) return false;

        if (!filter_var($url, FILTER_VALIDATE_URL)) {
            $parsed = parse_url($url);
            if (!isset($parsed["scheme"]) || !$parsed["scheme"]) return false;
            if (!isset($parsed["host"]) || !$parsed["host"]) return false;
        }
        return $url;
    }

    public function redirectLink(Request $request, $alias)
    {
        $shortener = Shortener::where('alias', $alias)->firstOrFail();

        // Check if expired
        if (!empty($shortener->expiry) && strtotime("now") > strtotime($shortener->expiry)) {
            
        }

        // Increment the click count
        $shortener->click++;
        $shortener->save();
        // Check user visited recently
        if ($request->cookie("short_{$shortener->id}")) return false;

        if ($shortener->type == "splash") {

            $view = 'shorty-splash';
            $default_view = 'plugins/shortener::shorty-splash';
            // 'data' => compact('post'),
            // 'slug' => $post->slug,
            // dd($shortener->url);
            return Theme::scope($view, ['shorted' => $shortener], $default_view)
                ->render();
        } else if ($shortener->type == "frame") {
            return view('plugins/shortener::frame', ['url' => $shortener->url]);
        }

        return redirect($shortener->url);
    }


    public function validateLink(Request $request, $alias)
    {
        $shortened = Shortener::where('alias', $alias)->firstOrFail();

        // If link is password protected show the form else redirect it
        if ($shortened->pass) {
            return view('plugins/shortener::shorty-password', ['link' => $shortened]);
        } else {
            return $this->redirectLink($request, $alias);
        }
    }

    public function checkPassword(Request $request, $id)
    {
        $shortener = Shortener::where('id', $id)->first();
        // return response()->json(['message' => 'Hi, the POST method is working!', 'id' => $id]);
        $submittedPassword = $request->input('password');

        // Check the enter password with the saved hashes password.
        // NOTE = We cant get the saved hash password. we can just check
        // the entered password is same as the saved hash password using check function.
        // if (Hash::check($submittedPassword, $shortener->pass)) {
        //     //Password is correct, redirect
        //     return $this->redirectLink($request, $shortener->alias);
        // }
        
        // Dropped the hash idea, check the normal way.
        if ($submittedPassword == $shortener->pass){
            //Password is correct, redirect
            return $this->redirectLink($request, $shortener->alias);
        }
        
        // Todo a better way to show wrong password.
        return response()->json(['message' => 'wrong password!', 'id' => $id]);
    }
}
