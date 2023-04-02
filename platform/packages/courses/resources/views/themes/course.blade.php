<div class="container">
    <h3 class="page-intro__title">{{ $course->name }}</h3>
    {!! Theme::breadcrumb()->render() !!}
</div>
<div>
    {!! apply_filters(COURSE_FILTER_FRONT_COURSE_CONTENT, BaseHelper::clean($course->content), $course) !!}
</div>
