    <style>
        .post-title{
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-weight: 600;
            margin-top: 0;
            text-transform: none;
        }
        h2 {
            font-size: 24px;
            line-height: 1.25;
            margin-bottom: 28px;
            margin-top: 30px;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-style: normal;
            font-weight: 600;
            margin-top: 0;
            text-transform: none;
        }
        h3{
            font-family: Arimo, sans-serif;
            font-style: normal;
            font-weight: 600;
            margin-top: 0;
            text-transform: none;
        }
        p {
            font-family: Roboto, sans-serif;
            font-size: 15px;
            line-height: 1.75;
            font-weight: 400;
            margin-bottom: 15px;
        }
    </style>

{{-- <div>{{ $id }}</div> --}}

<h1 class="post-title" style="background: rgb(180, 180, 180);">
    <a style="text-decoration:none; color:black" href="{{ $url}}">
        {{ $name }}
    </a>
</h1>

<p>{{ $description }}</p>

<br>

<div>
    {!! $content !!}
</div>

