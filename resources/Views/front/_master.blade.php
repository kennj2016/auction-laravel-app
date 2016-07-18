
<!DOCTYPE html>
<!--[if IE 8]>
<html lang="{{ $currentLanguageCode or 'en' }}" class="ie8 no-js {{ ($showHeaderAdminBar) ? 'show-admin-bar' : '' }}"> <![endif]-->
<!--[if IE 9]>
<html lang="{{ $currentLanguageCode or 'en' }}" class="ie9 no-js {{ ($showHeaderAdminBar) ? 'show-admin-bar' : '' }}"> <![endif]-->
<!--[if !IE]><!-->
<html lang="{{ $currentLanguageCode or 'en' }}" class="{{ ($showHeaderAdminBar) ? 'show-admin-bar' : '' }}">
<!--<![endif]-->
<head>
    @include('front/_shared/_metas')

    <!-- GLOBAL PLUGINS -->
    {{--<link rel="stylesheet" href="/fonts/Open-Sans/font.css">--}}
    <!-- GLOBAL PLUGINS -->

    <!-- OTHER PLUGINS -->
    @yield('css')
    <!-- END OTHER PLUGINS -->

    <!-- BEGIN THEME LAYOUT STYLES -->
    <link href="{{ asset('templates/css/bootstrap.css') }}" rel="stylesheet" type="text/css" media="all" />
    <!-- pignose css -->
    <link href="{{ asset('templates/css/pignose.layerslider.css') }}" rel="stylesheet" type="text/css" media="all" />
    <link href="{{ asset('alertifyjs/css/alertify.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('templates/css/style.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('css/custom.css') }}" rel="stylesheet" type="text/css"/>
    <!-- END THEME LAYOUT STYLES -->

    @if($showHeaderAdminBar)
        <link rel="stylesheet" href="/admin/css/admin-bar.css">
    @endif

    <link rel="shortcut icon" href="/images/logo/favicon.png"/>

    {!! $CMSSettings['google_analytics'] or '' !!}
</head>

<body class="on-loading {{ $bodyClass or '' }}">

@if($showHeaderAdminBar)
    @include('admin/_shared/_admin-bar')
@endif
@include('front/_shared/_header')

@yield('content')

@include('front/_shared/_footer')

<!--Modals-->
@include('front/_shared/_modals')

<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<script src="{{ asset('templates/js/jquery-2.1.4.min.js') }}"></script>

<script src="{{ asset('templates/js/simpleCart.min.js') }}"></script>

<script src="{{ asset('templates/js/bootstrap-3.1.1.min.js') }}"></script>
<script src="{{ asset('templates/js/jquery.easing.min.js') }}"></script>
<script src="{{ asset('alertifyjs/alertify.min.js') }}"></script>
<script src="{{ asset('js/parallax.min.js') }}"></script>
<script src="{{ asset('js/jquery.countdown.min.js') }}"></script>
<script src="{{ asset('js/app.js') }}"></script>
@yield('js')

<!-- JS INIT -->
@yield('js-init')
<!-- JS INIT -->

@include('front/_shared/_flash-messages')
</body>

</html>