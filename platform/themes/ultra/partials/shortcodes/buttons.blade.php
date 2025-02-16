@php
    // dd($shortcode);
@endphp

<style>
    .button-wrapper {
        margin: 15px;
        display: flex;
        justify-content: center;
    }
</style>

@if ($shortcode->style == 1)
    <style>
        .button-55 {
            align-self: center;
            background-color: #fff;
            background-image: none;
            background-position: 0 90%;
            background-repeat: repeat no-repeat;
            background-size: 4px 3px;
            border: 2px solid #41403e;
            border-radius: 15px 225px 255px 15px 15px 255px 225px 15px;
            border-style: solid;
            border-width: 2px;
            box-shadow: rgba(0, 0, 0, .2) 15px 28px 25px -18px;
            box-sizing: border-box;
            color: #41403e;
            cursor: pointer;
            display: inline-block;
            font-family: Neucha, sans-serif;
            font-size: 1rem;
            line-height: 23px;
            outline: none;
            padding: .75rem;
            text-decoration: none;
            transition: all 235ms ease-in-out;
            border-bottom-left-radius: 15px 255px;
            border-bottom-right-radius: 225px 15px;
            border-top-left-radius: 255px 15px;
            border-top-right-radius: 15px 225px;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
        }
        .button-55:hover {
            box-shadow: rgba(0, 0, 0, .3) 2px 8px 8px -5px;
            transform: translate3d(0, 2px, 0);
        }
        .button-55:focus {
            box-shadow: rgba(0, 0, 0, .3) 2px 8px 4px -6px;
        }
    </style>
    <div class="button-wrapper">
        <button class="button-55" role="button"
            onclick="openWebsite('{{ $shortcode->link }}','{{ $shortcode->target }}')">{{ $shortcode->button_text }}</button>
    </div>
@elseif ($shortcode->style == 2)
    <div class="button-wrapper">
        <button class="button-30" role="button"
            onclick="openWebsite('{{ $shortcode->link }}','{{ $shortcode->target }}')">{{ $shortcode->button_text }}</button>
    </div>
    {{-- CSS --}}
    <style>
        .button-30 {
            align-items: center;
            appearance: none;
            background-color: #FCFCFD;
            border-radius: 4px;
            border-width: 0;
            box-shadow: rgba(45, 35, 66, 0.4) 0 2px 4px, rgba(45, 35, 66, 0.3) 0 7px 13px -3px, #D6D6E7 0 -3px 0 inset;
            box-sizing: border-box;
            color: #36395A;
            cursor: pointer;
            display: inline-flex;
            font-family: "JetBrains Mono", monospace;
            height: 48px;
            justify-content: center;
            line-height: 1;
            list-style: none;
            overflow: hidden;
            padding-left: 16px;
            padding-right: 16px;
            position: relative;
            text-align: left;
            text-decoration: none;
            transition: box-shadow .15s, transform .15s;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            white-space: nowrap;
            will-change: box-shadow, transform;
            font-size: 18px;
        }
        .button-30:focus {
            box-shadow: #D6D6E7 0 0 0 1.5px inset, rgba(45, 35, 66, 0.4) 0 2px 4px, rgba(45, 35, 66, 0.3) 0 7px 13px -3px, #D6D6E7 0 -3px 0 inset;
        }
        .button-30:hover {
            box-shadow: rgba(45, 35, 66, 0.4) 0 4px 8px, rgba(45, 35, 66, 0.3) 0 7px 13px -3px, #D6D6E7 0 -3px 0 inset;
            transform: translateY(-2px);
        }
        .button-30:active {
            box-shadow: #D6D6E7 0 3px 7px inset;
            transform: translateY(2px);
        }
    </style>
@elseif ($shortcode->style == 3)
    <div class="button-wrapper">
        <button class="button-52" role="button"
            onclick="openWebsite('{{ $shortcode->link }}','{{ $shortcode->target }}')">{{ $shortcode->button_text }}</button>
    </div>
    <style>
        .button-52 {
            font-size: 16px;
            font-weight: 200;
            letter-spacing: 1px;
            padding: 13px 20px 13px;
            outline: 0;
            border: 1px solid black;
            cursor: pointer;
            position: relative;
            background-color: rgba(0, 0, 0, 0);
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
        }
        .button-52:after {
            content: "";
            background-color: #ffe54c;
            width: 100%;
            z-index: -1;
            position: absolute;
            height: 100%;
            top: 7px;
            left: 7px;
            transition: 0.2s;
        }
        .button-52:hover:after {
            top: 0px;
            left: 0px;
        }
        @media (min-width: 768px) {
            .button-52 {
                padding: 13px 50px 13px;
            }
        }
    </style>
@elseif ($shortcode->style == 4)
    <div class="button-wrapper">
        <button class="button-53" role="button"
            onclick="openWebsite('{{ $shortcode->link }}','{{ $shortcode->target }}')">{{ $shortcode->button_text }}</button>
    </div>

    <style>
        .button-53 {
            background-color: #3DD1E7;
            border: 0 solid #E5E7EB;
            box-sizing: border-box;
            color: #000000;
            display: flex;
            font-family: ui-sans-serif, system-ui, -apple-system, system-ui, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
            font-size: 1rem;
            font-weight: 700;
            justify-content: center;
            line-height: 1.75rem;
            padding: .75rem 1.65rem;
            position: relative;
            text-align: center;
            text-decoration: none #000000 solid;
            text-decoration-thickness: auto;
            /* width: 100%; */
            max-width: 460px;
            position: relative;
            cursor: pointer;
            transform: rotate(-2deg);
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
        }
        .button-53:focus {
            outline: 0;
        }
        .button-53:after {
            content: '';
            position: absolute;
            border: 1px solid #000000;
            bottom: 4px;
            left: 4px;
            width: calc(100% - 1px);
            height: calc(100% - 1px);
        }
        .button-53:hover:after {
            bottom: 2px;
            left: 2px;
        }
        @media (min-width: 768px) {
            .button-53 {
                padding: .75rem 3rem;
                font-size: 1.25rem;
            }
        }
    </style>
@endif


<script>
    function openWebsite(url, target) {
        // Check if the URL starts with http:// or https://
        if (!url.startsWith('http://') && !url.startsWith('https://')) {
            // If not, add https:// as the default prefix
            url = 'https://' + url;
        }
        // console.log(url);
        if (target == 1) {
            window.location.href = url;
        } else if (target == 2) {
            window.open(url, '_blank');
        }
    }
</script>