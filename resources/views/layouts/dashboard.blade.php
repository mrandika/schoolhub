{{-- TODO: Main Template --}}
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>@yield('title')</title>

    <meta name="csrf-token" content="{{ csrf_token() }}">

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

    <!-- General CSS Files -->
    <link rel="stylesheet" href="{{asset('modules/fontawesome/css/all.min.css')}}">
    @yield('css')

    <!-- CSS Libraries -->
    <link rel="stylesheet" href="{{asset('modules/jquery-selectric/selectric.css')}}">

    <!-- Template CSS -->
    <link rel="stylesheet" href="{{asset('css/admin/style.css')}}">
    <link rel="stylesheet" href="{{asset('css/admin/components.css')}}">

</head>

<body>
    <div id="app">
        <div class="main-wrapper main-wrapper-1">
            <div class="navbar-bg"></div>
            <nav class="navbar navbar-expand-lg main-navbar">
                <form class="form-inline mr-auto">
                    <ul class="navbar-nav mr-3">
                        <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i
                                    class="fas fa-bars"></i></a></li>
                    </ul>
                </form>
                <ul class="navbar-nav navbar-right">
                    <li class="dropdown"><a href="#" data-toggle="dropdown"
                            class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                            <img alt="image" src="{{ url('uploads/users/'.Auth::user()->photo) }}"
                                class="rounded-circle mr-1">
                            <div class="d-sm-none d-lg-inline-block">Hi, {{Auth::user()->name}}</div>
                            <div class="dropdown-menu dropdown-menu-right">
                                <div class="dropdown-title">Logged in 5 min ago</div>
                                <a href="features-profile.html" class="dropdown-item has-icon">
                                    <i class="far fa-user"></i> Profile
                                </a>
                                <a href="features-activities.html" class="dropdown-item has-icon">
                                    <i class="fas fa-bolt"></i> Activities
                                </a>
                                <a href="features-settings.html" class="dropdown-item has-icon">
                                    <i class="fas fa-cog"></i> Settings
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="{{ route('logout') }}" class="text-danger" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                    <i class="fas fa-sign-out-alt"></i>
                                    {{ __('Logout') }}

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                        style="display: none;">
                                        @csrf
                                    </form>
                                </a>
                            </div>
                    </li>
                </ul>
            </nav>
            <div class="main-sidebar sidebar-style-2">
                <aside id="sidebar-wrapper">
                    @yield('sidebarNavigation')
                    <ul class="sidebar-menu">
                        <li class="menu-header">Dashboard</li>
                        @yield('dashboardNavigationList')
                    </ul>
                </aside>
            </div>

            @yield('content')

        </div>
        </section>
    </div>
    <footer class="main-footer">
        <div class="footer-left">
            Copyright &copy; 2018 <div class="bullet"></div> Design By <a href="https://nauval.in/">Muhamad Nauval
                Azhar</a>
        </div>
        <div class="footer-right">

        </div>
    </footer>
    </div>
    </div>

    <!-- General JS Scripts -->
    <script src="{{asset('modules/nicescroll/jquery.nicescroll.min.js')}}"></script>
    <script src="{{asset('modules/moment.min.js')}}"></script>
    <script src="{{asset('js/dashboard/stisla.js')}}"></script>

    <!-- JS Libraies -->
    <script src="{{asset('modules/jquery-selectric/jquery.selectric.min.js')}}"></script>

    <!-- Page Specific JS File -->
    <script src="{{asset('js/dashboard/stisla.js')}}"></script>
    <script src="{{asset('js/dashboard/page/modules-sweetalert.js')}}"></script>

    <!-- Template JS File -->
    <script src="{{asset('js/dashboard/scripts.js')}}"></script>
    <script src="{{asset('js/dashboard/custom.js')}}"></script>

    @yield('scripts')
</body>

</html>