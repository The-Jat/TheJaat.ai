{{-- @php Theme::layout('no-breadcrumbs') @endphp --}}
{{-- <div class="container"> --}}
    {{-- <h3 class="page-intro__title">{{ $course->name }}</h3>
    {!! Theme::breadcrumb()->render() !!} --}}

  {{-- </div> --}}
{{-- <div>
    {!! apply_filters(COURSE_FILTER_FRONT_COURSE_CONTENT, Html::tag('div', BaseHelper::clean($course->content), ['class' => 'ck-content'])->toHtml(), $course) !!}
</div> --}}
@php
  
@endphp
<style>
  :root {
    --surface-color: #fff;
    --curve: 40;
  }
  
  * {
    box-sizing: border-box;
  }
  
  /* body {
    font-family: 'Noto Sans JP', sans-serif;
    background-color: #fef8f8;
  } */
  
  .cards {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 2rem;
    margin: 4rem 5vw;
    padding: 0;
    list-style-type: none;
  }
  
  .card {
    position: relative;
    display: block;
    height: 100%;  
    /* border-radius: calc(var(--curve) * 1px); */
    overflow: hidden;
    text-decoration: none;
  }
  .card:hover {
    transform: translateY(-2px);
    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  }
  
  .card__image {      
    width: 100%;
    height: auto;
  }
  
  .card__overlay {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    z-index: 1;      
    border-radius: calc(var(--curve) * 1px);    
    background-color: var(--surface-color);      
    transform: translateY(100%);
    transition: .2s ease-in-out;
  }
  
  .card:hover .card__overlay {
    transform: translateY(0);
  }
  
  .card__header {
    position: relative;
    display: flex;
    align-items: center;
    gap: 2em;
    padding: 2em;
    /* border-radius: calc(var(--curve) * 1px) 0 0 0;     */
    background-color: var(--surface-color);
    transform: translateY(-100%);
    transition: .2s ease-in-out;
  }
  
  .card__arc {
    width: 80px;
    height: 80px;
    position: absolute;
    bottom: 100%;
    right: 0;      
    z-index: 1;
  }
  
  .card__arc path {
    fill: var(--surface-color);
    d: path("M 40 80 c 22 0 40 -22 40 -40 v 40 Z");
  }       
  
  .card:hover .card__header {
    transform: translateY(0);
  }
  
  .card__thumb {
    flex-shrink: 0;
    width: 50px;
    height: 50px;      
    border-radius: 50%;      
  }
  
  .card__title {
    font-size: 1em;
    margin: 0 0 .3em;
    color: #6A515E;
  }
  
  .card__tagline {
    display: block;
    margin: 1em 0;
    /* font-family: "MockFlowFont"; */
    font-size: .8em; 
    color: #D7BDCA;  
  }
  
  .card__status {
    font-size: .8em;
    color: #cccccc;
  }
  
  .card__description {
    padding: 0 1.5em 2em;
    margin: 0;
    color: #000;
    /* font-family: "MockFlowFont";    */
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 6;
    overflow: hidden;
  }    
  </style>
  
  
  <ul class="cards">
      {{-- @php --}}
          {{-- you can do debugging here --}}
          {{-- // ddd($course);
          // ddd(getAuthorByUserId(1)); --}}
      {{-- @endphp --}}
      @foreach ($course as $post)
      <li>

        <a href="{{ get_external_link($post) }}" {{ is_external_link_course($post) ? 'target="_blank"' : '' }} class="card">
          <img class="card__image" alt="{{ $post->name }}"
          data-src="{{ RvMedia::getImageUrl($post->image, !empty($imageType) ? $imageType : 'medium', false, RvMedia::getDefaultImage()) }}"
              src="{{ RvMedia::getImageUrl($post->image, !empty($imageType) ? $imageType : 'medium', false, RvMedia::getDefaultImage()) }}" />
          <div class="card__overlay">
            <div class="card__header">
              {{-- <svg class="card__arc" xmlns="http://www.w3.org/2000/svg"><path /></svg>                      --}}
              {{-- <img class="card__thumb" src="{{ Auth::user()->avatar_url }}" alt="" /> --}}
              <img class="card__thumb" src="{{ getAuthorAvatarURLByUserID($post->user_id) }}" alt="" />
              <div class="card__header-text">
                <h3 class="card__title">{{$post->name}}</h3>            
                <span class="card__status">Updated: {{ getLastUpdatedTime($post->id) }}</span>
              </div>
            </div>
            <div>
              {{-- <p class="card__description">{{$post->description}}</p> --}}
            </div>
          </div>
        </a>      
      </li>
      @endforeach