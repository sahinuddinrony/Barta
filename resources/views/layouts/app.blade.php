<!DOCTYPE html>
<html>

@include('barta.partials.head')

<body class="bg-gray-100">
    <header>
       @include('barta.partials.nav')
    </header>

    @yield('main_content')
    @yield('view_sigle_profile')
    @yield('view_sigle_post')
    @yield('profile')
    @yield('edit_profile')
    @yield('edit_post')
    @yield('edit_comment')

    @include('barta.partials.footer')


</body>

</html>
