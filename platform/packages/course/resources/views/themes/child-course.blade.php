{{-- Child course post view --}}

@php
    $cssStyles = theme_option('child_course_css');
@endphp

<style>
    {{ $cssStyles }}
</style>


<div class="box">
    <div class="wrapper">
        <div class="post-wrapper">
            <main class="main main_width-limit">
                <header class="main__header">
                    <div class="main__header-inner">
                        {{-- <div class="main__header-group">
                            <ol class="breadcrumbs">
                                <li class="breadcrumbs__item breadcrumbs__item_home"><a class="breadcrumbs__link"
                                        href="/">
                                        <span class="breadcrumbs__hidden-text">Tutorial</span></a></li>
                                <li class="breadcrumbs__item" id="breadcrumb-1"><a class="breadcrumbs__link"
                                        href="/js"><span>The JavaScript language</span></a></li>
                                <li class="breadcrumbs__item" id="breadcrumb-2"><a class="breadcrumbs__link"
                                        href="/getting-started"><span>An introduction</span></a></li>
                            </ol>
                            <div class="updated-at" data-tooltip="Last updated on August 8, 2022">
                                <div class="updated-at__content">August 8, 2022</div>
                            </div>
                        </div> --}}
                        <h1 class="main__header-title">{{ $course->name }}</h1>
                    </div>
                </header>
                @php
                    // we want to add class to the below tags specified as key in the array with class
                    // name as value.
                    // $tagClassArray = [
                    //     'li' => 'lili',
                    //     'ol' => 'olli',
                    //     'ul' => 'ulli',
                    //     'h3' => 'course-hTeen',
                    //     'blockquote' => 'the-blockquote',
                    // ];
                    // $course->content = addClassToTags($tagClassArray, $course->content);
                @endphp
                <div id="post-content" class="content">
                    {{-- <article class="formatted" itemscope="" itemtype="http://schema.org/TechArticle">
                        <meta itemprop="name" content="An Introduction to JavaScript">
                        <div itemprop="author" itemscope="" itemtype="http://schema.org/Person">
                            <meta itemprop="email" content="iliakan@gmail.com">
                            <meta itemprop="name" content="Ilya Kantor">
                        </div> --}}
                    {{-- content here --}}
                    {!! $course->content !!}
                    {{-- </article> --}}
                </div>
            </main>
        </div>
        <div class="sidebar_col">
            <div class="sidebar-block content">
                <div class="header-block">
                    <h6 class="header">Table of Contents</h6>
                </div>
                <aside class="toc-container">
                    <div class="toc">
                        <ol id="quick-links" class="toc-list ">

                        </ol>
                    </div>
                </aside>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Get the div element with id "post-content"
            const postContentDiv = document.getElementById('post-content');

            // Get all the h2 elements within the post-content div
            const h3Elements = postContentDiv.querySelectorAll('h3');

            // Below code is for log only.
            // Convert NodeList to an array for easier manipulation
            // const h3Array = Array.from(h3Elements);

            // // Log each h3 element individually
            // h3Array.forEach((h3Element, index) => {
            //     console.log(`h3[${index}] =`, h3Element);
            // });

            // Get all the h4 elements within the post-content div
            const h4Elements = postContentDiv.querySelectorAll('h4');

            // const headings = document.querySelectorAll("h1");
            const quickLinks = document.querySelector("#quick-links");

            // const headings = document.querySelectorAll("h2, h3, h4, h5, h6");

            // headings.forEach((heading, index) => {
            //     const id = "section-" + (index + 1);
            //     heading.id = id;
            // });

            h3Elements.forEach((heading, index) => {
                const id = "section-h3" + (index + 1);
                heading.id = id;
                // console.log("heading = " + heading);
            });
            h4Elements.forEach((heading, index) => {
                const id = "section-h4" + (index + 1);
                heading.id = id;
            });

            // Loop through the selected h2 elements
            h3Elements.forEach((mainHeading, index) => {
                // Create a list item for the h2 element
                const h3LinkItem = document.createElement('li');
                h3LinkItem.classList.add('toc-list-item');
                const h3Link = document.createElement('a');
                h3Link.href = `#section-h3${index + 1}`;
                h3Link.textContent = mainHeading.textContent;
                h3Link.classList.add('h3-link');
                h3LinkItem.appendChild(h3Link);

                // Find associated h4 elements and create a sublist
                const sublinks = [];
                let nextElement = mainHeading.nextElementSibling;
                while (nextElement && nextElement.tagName !== 'H3') {
                    if (nextElement.tagName === 'H4') {
                        sublinks.push(nextElement.textContent);
                    }
                    nextElement = nextElement.nextElementSibling;
                }

                // If there are associated h4 elements, create a sublist for them
                if (sublinks.length > 0) {
                    const sublinksList = document.createElement('ul');
                    sublinks.forEach((sublinkText) => {
                        const sublinkItem = document.createElement('li');
                        const sublink = document.createElement('a');
                        sublink.href = `#section-h4${index + 1}`; //`#${sublinkText}`;

                        sublink.textContent = sublinkText;
                        sublink.classList.add('h4-sublink'); // Apply a class for h4 sublinks
                        sublinkItem.appendChild(sublink);
                        sublinksList.appendChild(sublinkItem);
                        sublinksList.classList.add('h4-ul-block');
                    });
                    h3LinkItem.appendChild(sublinksList);
                }

                // Append the h3LinkItem to the quickLinksList
                quickLinks.appendChild(h3LinkItem);
            });

            // h2Elements.forEach((heading) => {
            //     console.log("heading = " + heading.textContent + " tag = " + heading.tagName);
            //     const sublinks = [];

            //     // Find adjacent h4 elements until the next h2 element or the end of the content
            //     let nextElement = heading.nextElementSibling;
            //     console.log("next element = " + h2Elements.nextElementSibling);
            //     while (nextElement && nextElement.tagName !== 'H2') {
            //         console.log(nextElement.textContent);
            //         if (nextElement.tagName === 'H4') {
            //             sublinks.push(nextElement.textContent);
            //         }
            //         nextElement = nextElement.nextElementSibling;
            //     }
            //     // Create and append a list of sublinks
            //     console.log("length = " + sublinks.length);
            //     if (sublinks.length > 0) {
            //         const sublinksList = document.createElement('ul');
            //         sublinks.forEach((sublinkText) => {
            //             const sublinkItem = document.createElement('li');
            //             sublinkItem.innerHTML = `<a href="#">${sublinkText}</a>`;
            //             sublinksList.appendChild(sublinkItem);
            //         });
            //         quickLinks.appendChild(sublinksList);
            //     }

            //     const link = document.createElement("a");
            //     link.textContent = heading.textContent;
            //     link.href = "#" + heading.id;

            //     const offset = 100; // Adjust this value as needed might be 70


            //     link.addEventListener("click", function(event) {
            //         event.preventDefault(); // Prevent default behavior of anchor link
            //         const target = document.querySelector(link.getAttribute("href"));
            //         const targetPosition = target.getBoundingClientRect().top + window.scrollY -
            //             offset;
            //         if (target) {
            //             // target.scrollIntoView({top: targetPosition, behavior: "smooth" });
            //             window.scrollTo({
            //                 top: targetPosition,
            //                 behavior: "smooth"
            //             });
            //         }
            //     });

            //     const listItem = document.createElement("li");
            //     listItem.appendChild(link);

            //     quickLinks.appendChild(listItem);


            // });
        });

        window.addEventListener('scroll', function() {
//            console.log('Scroll event fired.');
            var links = document.querySelectorAll('.h3-link, .h4-sublink');

            links.forEach(function(link) {
                var section = document.querySelector(link.getAttribute('href'));
                if (section) {
//                    console.log("section = " + section);
                    var rect = section.getBoundingClientRect();

                    if (rect.top <= 100 && rect.bottom >= 100) {
                        link.classList.add('is-active-link');
                    } else {
                        link.classList.remove('is-active-link');
                    }
                }
            });
        });
    </script>

    <style>
        /* These styles are for the tag ol, ul and li which are modified and these class
            is added to them by the function addClassToLists defined in helper class.*/
        .list ul,
        ol {
            margin-top: 16px;
            margin-bottom: 1rem;
            padding: 0px 0px 0px 40px;
        }

        .list li {
            list-style: unset;
            margin: 10px 0px;
        }

        .course-hTeen {
            margin: 24px 0px 12px 0px;
            font-size: 24px;
            line-height: 32px;
        }
    </style>


    <style>
        /*
            <div class="balance">
                anything, the list or whatever.
            </div>
        */
        .balance {
            position: relative;
            margin: 16px 0;
            border: 3px solid var(--borderPrimary);
            border-radius: 6px;
            padding: 20px 35px 30px 20px;
        }



        /*  The structure
            <div class="important">
                <div class="important__header">
                    <div>The text</div>
                </div>
                <div class="important__content">
                </div>
            </div>
        */
        .important {
            margin: 16px 0;
            border: 3px solid var(--borderImportant);
            border-radius: 6px;
        }

        .important__header {
            margin: 0;
            padding: 24px 24px 0;
            border: none;
            font-weight: 700;
            font-size: 16px;
        }

        .important__content {
            margin: 12px 24px 24px;
        }

        .note-tip {
            padding: 16px 24px;
            /* border-radius: 4px; */
            display: block;
            font-size: 18px;
            line-height: 30px;
            color: rgba(37, 38, 94, .7);
            margin-bottom: 16px;
            background: #f8faff;
            border: 1px solid #d3dce6;
            border-left: 4px solid #f655ac;
        }
    </style>

</div>
