@php Theme::layout('no-breadcrumbs') @endphp

<style>
    .filter-container {
        /* text-align: center; */
        margin-top: 30px;
    }

    .main-container {
        padding: 20px;
        display: flex;
        flex-wrap: wrap;
    }

    .code-container {
        padding: 20px;
    }

    .code-heading {
        margin: 0px 20px;
        text-align: center;
        font-size: 25px;
        font-family: Suisse, Apercu, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif;
        color: gray;
    }

    /* HEADING */

    .heading {
        text-align: center;
    }

    .heading__title {
        font-weight: 600;
    }

    .heading__credits {
        margin: 10px 0px;
        color: #888888;
        font-size: 25px;
        transition: all 0.5s;
    }

    .heading__link {
        text-decoration: none;
    }

    .heading__credits .heading__link {
        color: inherit;
    }

    /* CARDS */

    .cards {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .card {
        margin: 15px;
        padding: 20px;
        width: 500px;
        min-height: 150px;
        display: grid;
        /* grid-template-rows: 20px 50px 1fr 50px; */
        border-radius: 10px;
        box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.25);
        transition: all 0.2s;
    }

    .card:hover {
        box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.4);
        transform: scale(1.01);
    }

    .card__link,
    .card__exit,
    .card__icon {
        position: relative;
        text-decoration: none;
        color: rgba(255, 255, 255, 0.9);
    }

    .card__link::after {
        position: absolute;
        top: 25px;
        left: 0;
        content: "";
        width: 0%;
        height: 3px;
        background-color: rgba(255, 255, 255, 0.6);
        transition: all 0.5s;
    }

    .card__link:hover::after {
        width: 100%;
    }

    .card__exit {
        grid-row: 1/2;
        justify-self: end;
    }

    .card__icon {
        /* grid-row: 2/3; */
        font-size: 15px;
    }

    .card__title {
        grid-row: 3/4;
        font-weight: 400;
        color: #ffffff;
        font-size: 1.5rem;
    }

    .card__apply {
        grid-row: 4/5;
        align-self: center;
    }

    .last__updated {
        color: white;
        float: right;
    }

    /* CARD BACKGROUNDS */

    .cards:nth-child(1n) .card {
        background: radial-gradient(#fbc1cc, #fa99b2);
    }

    .cards:nth-child(2n) .card {
        background: radial-gradient(#1fe4f5, #3fbafe);
    }

    .cards:nth-child(3n) .card {
        background: radial-gradient(#60efbc, #58d5c9);
    }

    .cards:nth-child(4n) .card {
        background: radial-gradient(#76b2fe, #b69efe);
    }

    .cards:nth-child(5n) .card {
        background: radial-gradient(#f588d8, #c0a3e5);
    }

    /* .card-1 {
        background: radial-gradient(#1fe4f5, #3fbafe);
    }

    .card-2 {
        background: radial-gradient(#fbc1cc, #fa99b2);
    }

    .card-3 {
        background: radial-gradient(#76b2fe, #b69efe);
    }

    .card-4 {
        background: radial-gradient(#60efbc, #58d5c9);
    }

    .card-5 {
        background: radial-gradient(#f588d8, #c0a3e5);
    } */

    /* RESPONSIVE */

    @media (max-width: 1600px) {
        .cards {
            justify-content: center;
            width: 50%;
        }
    }

    @media (max-width: 900px) {
        .cards {
            justify-content: center;
            width: 50%;
        }
    }

    @media (max-width: 600px) {
        .cards {
            justify-content: center;
            width: auto;
        }

        .main-container {
            display: block;
        }
    }

    .gamut-dum0bf-Badge {
        float: right;
        /* margin-top: 3px; */
        margin-left: 0.25rem;
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        /* font-family: Suisse, Apercu, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif; */
        font-weight: 400;
        white-space: nowrap;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
        display: flex;
        width: min-content;
        border-radius: 40px;
        color: #10162F;
        background-color: yellow;
        font-size: 15px;
        height: 20px;
    }

    .pagination-container {
        text-align: center;
        display: block ruby;
    }


    .filter-form {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .filter-input,
    .filter-select {
        padding: 8px;
        margin-right: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    .filter-button {
        padding: 8px 16px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
    }

    .filter-button:hover {
        background-color: #0056b3;
    }
</style>
<div class="filter-container">


    <form class="filter-form"
        action="{{ route('code_post_list', ['prefix' => SlugHelper::getPrefix(CodePost::class), 'slug' => $slug]) }}"
        method="GET">
        <!-- Filter inputs -->
        {{-- <input class="filter-input" type="text" name="keyword" placeholder="Search keyword"> --}}
        <select class="filter-select" name="difficulty">
            <option value="">Select Difficulty</option>
            <option value="all">All</option>
            <option value="easy">Easy</option>
            <option value="medium">Medium</option>
            <option value="hard">Hard</option>
        </select>
        <select class="filter-select" name="orderBy">
            <option value="">Order By</option>
            <option value="updated_at">Updated Time</option>
            <option value="created_at">Created Time</option>
            <option value="order">Order Id</option>
        </select>

        <select class="filter-select" name="order">
            <option value="">Order</option>
            <option value="asc">Ascending</option>
            <option value="desc">Descending</option>
        </select>

        <button class="filter-button" type="submit">Apply Filters</button>
    </form>

</div>

<div class="code-container">
    <div class='code-heading'>
        {{ strtoupper($difficulty) }}
    </div>
    <div class="main-container">
        {{-- <div class="code-container"> --}}
        @foreach ($codePosts as $codePost)
            <div class="cards">
                <div class="card">
                    <div class="card__icon"><i class="fas fa-bolt"></i>
                        <div class="gamut-dum0bf-Badge emeh29k0">{{ $codePost->difficulty }}</div>
                    </div>
                    {{-- <p class="card__exit"><i class="fas fa-times"></i></p> --}}
                    <h2 class="card__title">{{ $codePost->name }}</h2>
                    <p class="card__apply">
                        <a class="card__link" href="{{ get_external_link($codePost) }}">Check it out <i
                                class="fas fa-arrow-right"></i></a>
                        <span class="last__updated">Last Updated: {{ $codePost->updated_at->format('M d, Y') }}</span>
                    </p>
                </div>
            </div>
            {{-- <div> --}}
        @endforeach
    </div>
    <div class="pagination-container">
        <div class="pagination">
            {{ $codePosts->links() }}
        </div>
    </div>
</div>


{{-- <a href="{{ get_external_link($codePost) }}">
                <div class="course-item">
                    <img class="course-image"
                        src="{{ RvMedia::getImageUrl($codePost->image, 'medium', false, RvMedia::getDefaultImage()) }}"
                        alt="Course 1 Image">
                    <div class="course-details">
                        <div class="course-title">{{ $codePost->name }}</div>
                        <div class="course-description">{{ $codePost->description }}</div>
                        <div class="last-updated">Last Updated: {{ $codePost->updated_at->format('M d, Y') }}</div>
                        <div class="course-link">Learn More</div>
                    </div>
                </div>
            </a> --}}
