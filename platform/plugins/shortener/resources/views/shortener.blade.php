@extends(BaseHelper::getAdminMasterLayoutTemplate())
@section('content')
@section('content')
    <style>
        #loader {
            display: none;
            border: 3px solid #ffffff;
            border-top: 4px solid transparent;
            border-radius: 50%;
            width: 16px;
            height: 16px;
            animation: spin 1s linear infinite;
            margin-right: 8px;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

        #submitBtn {
            position: relative;
        }

        #submitBtn:disabled {
            cursor: not-allowed;
        }
    </style>
    <div class="card shadow-sm" data-select2-id="27">
        <div class="card-body" data-select2-id="26">
            <form id="TheForm"
                action="{{ isset($shortener) ? route('shortener.edit.update', $shortener) : route('shortener.sub') }}"
                method="post">

                @csrf
                @if (isset($shortener))
                    {{-- @method('PUT') --}}
                @endif
                <div class="d-flex items-align-center border rounded" style="border-radius: 0.2rem!important;">
                    <div class="flex-grow-1" id="linksinput">
                        <div id="single" class="collapse show" data-bs-parent="#linksinput">
                            <input type="text" class="form-control p-3 border-0" name="url" id="url"
                                placeholder="Paste a long link" value="{{ isset($shortener) ? $shortener->url : '' }}">
                        </div>
                        <div id="multiple" class="collapse" data-bs-parent="#linksinput">
                            <textarea name="urls" rows="5" class="form-control p-3 border-0" name="urls" id="urls"
                                placeholder="Paste up to 10 long urls. One URL per line."></textarea>
                            <input type="hidden" name="multiple" value="0">
                        </div>
                    </div>
                    <div class="align-self-center me-3">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default border" data-bs-toggle="collapse"
                                data-bs-target="#advancedOptions">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="feather feather-sliders">
                                    <line x1="4" y1="21" x2="4" y2="14"></line>
                                    <line x1="4" y1="10" x2="4" y2="3"></line>
                                    <line x1="12" y1="21" x2="12" y2="12"></line>
                                    <line x1="12" y1="8" x2="12" y2="3"></line>
                                    <line x1="20" y1="21" x2="20" y2="16"></line>
                                    <line x1="20" y1="12" x2="20" y2="3"></line>
                                    <line x1="1" y1="14" x2="7" y2="14"></line>
                                    <line x1="9" y1="8" x2="15" y2="8"></line>
                                    <line x1="17" y1="16" x2="23" y2="16"></line>
                                </svg>
                            </button>
                            <button id="submitButton" type="submit" class="btn btn-primary">
                                <span id="shortenText" class="d-none d-sm-block">Shorten</span>
                                {{-- <span class="d-block d-sm-block"><i class="fa-regular fa-spinner"></i></span> --}}
                                <span class="loader" id="loader"></span>
                            </button>
                        </div>
                    </div>
                </div>
                {{-- collapsable code --}}
                <div class="collapse" id="advancedOptions">
                    <div class="col-sm-6 mt-3">
                        <div class="form-group rounded input-select">
                            <label for="domain" class="form-label fw-bold">Domain</label>
                            <select name="domain" id="domain" class="form-select" data-toggle="select">
                                {{-- TODO, when implementing different domain --}}
                                @php
                                    $domains = getDomains();
                                    $selectedDomain = $shortener->domain ?? null;
                                @endphp
                                <?php foreach($domains as $domain): ?>
                                <option value="{{ $domain }}" {{ $selectedDomain == $domain ? 'selected' : '' }}>
                                    <?php echo $domain; ?></option>
                                <?php endforeach ?>
                            </select>
                        </div>
                    </div>
                    <div class="row">

                        <?php if($redirects = redirects()): ?>
                        {{-- <?php dd($redirects); ?> --}}
                        <div class="col-sm-6 mt-3">
                            <div class="form-group rounded input-select">
                                <label for="type" class="form-label fw-bold">Redirect</label>
                                {{-- <select name="type" id="type" class="form-select" data-toggle="select">

                                    <?php foreach($redirects as $id => $name): ?>
                                        <option>{{ $name }}</option>
                                    <?php endforeach ?>

                                </select> --}}
                                @php
                                    // dd($redirects);
                                @endphp
                                {{-- <select name="type" id="type" class="form-select" data-toggle="select">
                                    <?php foreach($redirects as $id => $name): ?>
                                        <option value="{{ $id }}" {{ $shortener->type == $id ? 'selected' : '' }}>{{ $name }}</option>
                                    <?php endforeach ?>
                                </select> --}}
                                <select name="type" id="type" class="form-select" data-toggle="select">
                                    <option value="direct"
                                        {{ !isset($shortener) || $shortener->type == 'direct' ? 'selected' : '' }}>direct
                                    </option>
                                    <option value="frame"
                                        {{ isset($shortener) && $shortener->type == 'frame' ? 'selected' : '' }}>frame
                                    </option>
                                    <option value="splash"
                                        {{ isset($shortener) && $shortener->type == 'splash' ? 'selected' : '' }}>splash
                                    </option>
                                </select>



                            </div>
                        </div>
                        <?php endif ?>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 mt-3">
                            <div class="form-group">
                                <label for="custom" class="form-label fw-bold">Custom</label>
                                <p class="form-text">If you need a custom alias, you can enter it below.</p>
                                <div class="input-group">
                                    <div class="input-group-text bg-white">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                            stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe">
                                            <circle cx="12" cy="12" r="10"></circle>
                                            <line x1="2" y1="12" x2="22" y2="12"></line>
                                            <path
                                                d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z">
                                            </path>
                                        </svg>
                                    </div>
                                    <input type="text" class="form-control border-start-0 ps-0" name="custom"
                                        id="custom" placeholder="Type your custom alias here" autocomplete="off">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mt-3">
                            <div class="form-group">
                                <label for="pass" class="form-label fw-bold">Password Protection</label>
                                <p class="form-text">By adding a password, you can restrict the access.</p>
                                <div class="input-group">
                                    <div class="input-group-text bg-white">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                            stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock">
                                            <rect x="3" y="11" width="18" height="11" rx="2"
                                                ry="2"></rect>
                                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                        </svg>
                                    </div>
                                    <input type="text" class="form-control border-start-0 ps-0" name="pass"
                                        id="pass" placeholder="Type your password here" autocomplete="off"
                                        value="{{ isset($shortener) ? $shortener->pass : '' }}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 mt-3">
                            <div class="form-group">
                                <label for="expiry" class="form-label fw-bold">Description</label>
                                <p class="form-text">This can be used to identify URLs on your account.</p>
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                            stroke-linecap="round" stroke-linejoin="round" class="feather feather-tag">
                                            <path
                                                d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z">
                                            </path>
                                            <line x1="7" y1="7" x2="7.01" y2="7"></line>
                                        </svg>
                                    </span>
                                    <input type="text" class="form-control border-start-0 ps-0" name="description"
                                        id="description" placeholder="Type your description here" autocomplete="off"
                                        value="{{ isset($shortener) ? $shortener->description : '' }}">
                                </div>
                            </div>
                        </div>
                    </div>


                    {{-- Expiration --}}
                    <div class="mt-4 border p-3 rounded-3" id="expiration">
                        <div class="d-flex">
                            <h4>
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                    stroke-linecap="round" stroke-linejoin="round"
                                    class="feather feather-alert-triangle me-2">
                                    <path
                                        d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z">
                                    </path>
                                    <line x1="12" y1="9" x2="12" y2="13"></line>
                                    <line x1="12" y1="17" x2="12.01" y2="17"></line>
                                </svg>
                                <span class="align-middle">Expiration</span>
                            </h4>
                        </div>
                        <p class="form-text">
                            Links can be expired based on the amount of clicks or a specific date. You can also set a url to
                            redirect to when the link expires.
                        </p>
                        <div class="row">
                            <div class="col-md-6 mt-3">
                                <div class="form-group">
                                    <label for="expiry" class="form-label fw-bold">Link Expiration</label>
                                    <p class="form-text">Set an expiration date to disable the link.</p>
                                    <div class="input-group">
                                        <div class="input-group-text bg-white">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                class="feather feather-lock">
                                                <rect x="3" y="11" width="18" height="11" rx="2"
                                                    ry="2"></rect>
                                                <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                            </svg>
                                        </div>
                                        <input type="date" class="form-control border-start-0 ps-0"
                                            data-toggle="datepicker" name="expiry" id="expiry"
                                            placeholder="MM/DD/YYYY" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                            {{-- <?php if(\Core\Auth::user()->has("clicklimit") !== false):?> --}}
                            <div class="col-md-6 mt-3">
                                <div class="form-group">
                                    <label for="expiry" class="form-label fw-bold">Click Limit</label>
                                    <p class="form-text">Limit the number of clicks.</p>
                                    <div class="input-group">
                                        <div class="input-group-text bg-white">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                class="feather feather-lock">
                                                <rect x="3" y="11" width="18" height="11" rx="2"
                                                    ry="2"></rect>
                                                <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                            </svg>
                                        </div>
                                        <input type="text" class="form-control border-start-0 ps-0" name="clicklimit"
                                            id="clicklimit" autocomplete="off" placeholder="e.g. 100">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                            <label for="expiry" class="form-label fw-bold">Expiration Redirect</label>
                            <p class="form-text">Set a link to redirect traffic to when the short link expires.</p>
                            <div class="input-group">
                                <span class="input-group-text bg-white">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe">
                                        <circle cx="12" cy="12" r="10"></circle>
                                        <line x1="2" y1="12" x2="22" y2="12"></line>
                                        <path
                                            d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z">
                                        </path>
                                    </svg>
                                </span>
                                <input type="text" name="expirationredirect" class="form-control border-start-0 ps-0"
                                    placeholder="Type the url to redirect user to.">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>


    <div class="card-body border-top">

        <div id="return-ajax"></div>
        <div id="link-holder" data-refresh="{{ route('shortener.fetch') }}" data-fetch="{{ route('shortener.fetch') }}">
            {{-- <?php foreach($urls as $url): ?> --}}
            <div class="p-3 rounded-3 border mb-2">
                {{-- <?php view('partials.links', compact('url')); ?>       --}}
            </div>
            {{-- <?php endforeach ?> --}}

            <div class="mt-4 d-block">
                {{-- <?php echo pagination(); ?> --}}
            </div>
        </div>
    </div>

    <div class="modal fade" id="successModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Short Link Info</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="d-flex">
                        <div class="modal-qr me-3">
                            <p>
                                <img id="qrCodeImage" style="width:150px;" src="" alt="QR Code">
                            </p>
                            <div class="btn-group" role="group" aria-label="downloadQR">
                                <a href="#" class="btn btn-primary" id="downloadPNG">Download</a>
                                <div class="btn-group" role="group">
                                    <button id="btndownloadqr" type="button" class="btn btn-primary dropdown-toggle"
                                        data-bs-toggle="dropdown" aria-expanded="false">PNG</button>
                                    <ul class="dropdown-menu" aria-labelledby="btndownloadqr">
                                        <li><a class="dropdown-item" href="#">PDF</a></li>
                                        <li><a class="dropdown-item" href="#">SVG</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="mt-2">
                            <div class="form-group">
                                <label for="short" class="form-label">Short Link</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="modal-input" name="shortlink"
                                        value="">
                                    <div class="input-group-text bg-white">
                                        <button id="modelCopy" class="btn btn-primary copy"
                                            data-clipboard-text="">Copy</button>
                                    </div>
                                </div>
                            </div>
                            {{-- <div class="mt-3" id="modal-share">
                          <?php echo \Helpers\App::share('--url--'); ?>
                      </div> --}}
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-bs-dismiss="modal">Done</button>
                </div>
            </div>
        </div>
    </div>

    @php
        // Read the baseUrl from the config located at config/config.php, it is used in the js script below
        $baseUrl = config('config.BaseUrl');
        // dd($baseUrl);
    @endphp


    {{-- <script>
        $(document).ready(function () {
            // Assuming you have a button or link to trigger the action
            $('#submitButton').click(function () {
                console.log("button clicked");
                // Perform an AJAX request to execute the action
                $.post('/shortener/shorten/sub', function (data) {
                    console.log(data);
                    // Check if the action was completed successfully
                    if (data.message === 'Links have been shortened.') {
                        console.log("data matched");
                        // Show the modal when the action is completed
                        $('#successModal').modal('show');
                    } else {
                        // Handle any errors here
                        alert('Action failed');
                    }
                });
            });
        });
    </script> --}}

    <script>
        //         $(document).ready(function() {
        //             $('#TheForm').submit(function(event) {
        //                 event.preventDefault(); // Prevent the form from submitting normally

        //                 // Perform an AJAX POST request to the form's action
        //                 $.post($(this).attr('action'), $(this).serialize(), function(data) {
        //                     console.log(data);
        //                     if (data.success) {
        //                         $('#modal-input').val("http://127.0.0.1:8000/shorty"+"/"+data.alias);

        //                         // Replace 'YOUR_BASE_URL' with your actual base URL
        //     const baseUrl = 'http://127.0.0.1:8000/admin/blog/shortener';

        // // Replace 'YOUR_LINK' with the dynamic link you want to generate a QR code for
        // const link = 'www.google.com';

        // // Fetch the QR code image dynamically
        // fetch(`${baseUrl}/qr-code/${link}`)
        //     .then(response => response.blob())
        //     .then(blob => {
        //         console.log(blob);
        //         const imageUrl = URL.createObjectURL(blob);
        //         console.log(imageUrl);
        //         document.getElementById('qrCodeImage').src = imageUrl;
        //         // If the controller logic was successful, show the modal
        //         $('#successModal').modal('show');
        //     });
        //                     } else {
        //                         // Handle any errors here, if needed
        //                         alert('An error occurred.');
        //                     }
        //                 }, 'json');
        //             });
        //         });
        // $(document).ready(function() {
        //     $('#TheForm').submit(function(event) {
        //         event.preventDefault(); // Prevent the form from submitting normally

        //         console.log(event);
        //         // Change the class of the span element
        //         $('#shortenText').removeClass('d-sm-block').addClass('d-none');
        //         $('#loader').css('display', 'block');


        //     });
        // });

        $(document).ready(function() {
            $('#TheForm').submit(function(event) {
                event.preventDefault(); // Prevent the form from submitting normally

                // Change the class of the span element
                $('#shortenText').removeClass('d-sm-block').addClass('d-none');
                $('#loader').css('display', 'block');

                // Perform an AJAX POST request to the form's action
                $.post($(this).attr('action'), $(this).serialize(), function(data) {
                    console.log('Response from server:', data);

                    if (data.success) {
                        // Handle success
                        $('#modal-input').val(data.domain + "/" + data.alias);

                        const base_Url = '{{ $baseUrl }}';
                        console.log("base_Url = " + base_Url);
                        let link = data.domain + "/" + data
                            .alias;
                        console.log("link = " + link);

                        // Encode the URL before appending it to the route
                        let encodedLink = encodeURIComponent(link);
                        console.log("enodedLink = " + encodedLink);

                        console.log('base = ' + base_Url);
                        let qrLink = `/admin/blog/shortener/qr-code?link=${encodedLink}`;
                        console.log("qrLink = " + qrLink);
                        fetch(qrLink)
                            .then(response => response.json())
                            .then(data => {
                                console.log(data.image_name);


                                // Set the image path to the 'src' attribute of the 'img' element
                                document.getElementById('qrCodeImage').src = "/storage/" + data
                                    .image_name;

                                // Set the download link href
                                document.getElementById('downloadPNG').href = "/storage/" + data
                                    .image_name;
                                document.getElementById('downloadPNG').download = data
                                    .image_name;

                                // If the controller logic was successful, show the modal
                                $('#successModal').modal('show');

                                // Disable the spinner, and show the "shorten tedt"
                                $('#shortenText').removeClass('d-none').addClass('d-sm-block');
                                $('#loader').css('display', 'none');
                            })
                            .catch(error => console.error('Error:', error));
                    } else {
                        // Handle errors
                        console.error('An error occurred in the server response:', data);
                    }
                }, 'json').fail(function(jqXHR, textStatus, errorThrown) {
                    // console.error('AJAX request failed:', textStatus, errorThrown);
                }).always(function() {
                    // Hide the loader and show text in both success and error cases
                    $('#shortenText').removeClass('d-none').addClass('d-sm-block');
                    $('#loader').css('display', 'none');
                });
            });
        });
    </script>


@endsection


@stop
