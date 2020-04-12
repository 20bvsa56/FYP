<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Dashboard</title>

    <!-- Fontfaces CSS-->
    <link href="{{ asset('css/font-face.css') }}" rel="stylesheet" media="all">
    <link href="{{ asset('vendor/font-awesome-4.7/css/font-awesome.min.css') }}" rel="stylesheet" media="all">
    <link href="{{ asset('vendor/font-awesome-5/css/fontawesome-all.min.css') }}" rel="stylesheet" media="all">
    <link href="{{ asset('vendor/mdi-font/css/material-design-iconic-font.min.css') }}" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="{{ asset('vendor/bootstrap-4.1/bootstrap.min.css') }}" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="{{ asset('vendor/animsition/animsition.min.css') }}" rel="stylesheet" media="all">
    <link href="{{ asset('vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css') }}" rel="stylesheet" media="all">
    <link href="{{ asset('vendor/wow/animate.css') }}" rel="stylesheet" media="all">
    <link href="{{ asset('vendor/css-hamburgers/hamburgers.min.css') }}" rel="stylesheet" media="all">
    <link href="{{ asset('vendor/slick/slick.css') }}" rel="stylesheet" media="all">
    <link href="{{ asset('vendor/select2/select2.min.css') }}" rel="stylesheet" media="all">
    <link href="{{ asset('vendor/perfect-scrollbar/perfect-scrollbar.css') }}" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="{{asset('css/theme.css')}}" rel="stylesheet" media="all">

</head>

<body>
<div class="animsition">
<div class="page-wrapper">
    <!-- HEADER DESKTOP-->
    <header class="header-desktop3 d-none d-lg-block" >
        <div class="section__content section__content--p35">
            <div class="header3-wrap">
                <div class="header__logo">
                    <a class="js-arrow"  href="#">
                        <img src="images/icon/burger.png" height="40" width="30" />
                        <h2 class="title-1">Tastyorama</h2>
                    </a>

                </div>
                <div class="header__navbar">
                    <ul class="list-unstyled">
                        <li>
                            <a class="js-arrow" href="{{route('home')}}">
                                <i class="fas fa-book"></i>Dashboard</a>
                        </li>
                        <li>
                            <a class="js-arrow" href="{{route('banIndex')}}">
                                <i class="far fa-image"></i>Banner Image</a>
                        </li>
                        <li>
                            <a class="js-arrow" href="{{route('catIndex')}}">
                                <i class="fas fa-list-ol"></i>Menu Category</a>
                        </li>

                        <li>
                            <a class="js-arrow" href="{{route('itemIndex')}}">
                                <i class="fas fa-coffee"></i>Food Item</a>
                        </li>
                        <li>
                            <a class="js-arrow" href="{{route('roleIndex')}}">
                                <i class="far fa-user"></i>Role</a>
                        </li>
                    </ul>
                </div>


                        <div class="account-wrap">
                            <div class="account-item clearfix js-item-menu">
                                                                <div class="content">
                                    <a class="title-1" href="#" style="color: white; ">Account</a>
                                </div>
                                <div class="account-dropdown js-dropdown">

                                    <div class="account-dropdown__body">

                                        <div class="account-dropdown__footer">

                                            <a class="zmdi zmdi-power" href="{{ route('logout') }}"
                                               onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                                {{ __('Logout') }}
                                            </a>

                                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                                @csrf
                                            </form>

                                            <a class="zmdi zmdi-account" href="{{ route('register') }}"
                                               onclick="event.preventDefault();
                                                     document.getElementById('register-form').submit();">


                                                {{ __('Register') }}
                                            </a>

                                            <form id="logout-form" action="{{ route('register') }}" method="POST" style="display: none;">
                                                @csrf
                                            </form>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>

    </header>


    <!-- END HEADER DESKTOP-->
    <!-- MAIN CONTENT-->
    <div class="main-content">
        @yield('content')
    </div>
    <!-- END MAIN CONTENT-->
</div>

</div>
            <!-- COPYRIGHT-->
        <section >



                        <div class="copyright">
                            <p>Copyright © 2020 Tastyorama. All rights reserved.</p>
                        </div>


        </section>
        <!-- END COPYRIGHT-->



<!-- Jquery JS-->
<script src="{{ asset('vendor/jquery-3.2.1.min.js') }}"></script>
<!-- Bootstrap JS-->
<script src="{{ asset('vendor/bootstrap-4.1/popper.min.js') }}"></script>
<script src="{{ asset('vendor/bootstrap-4.1/bootstrap.min.js') }}"></script>
<!-- Vendor JS       -->
<script src="{{ asset('vendor/slick/slick.min.js') }}">
</script>
<script src="{{ asset('vendor/wow/wow.min.js') }}"></script>
<script src="{{ asset('vendor/animsition/animsition.min.js') }}"></script>
<script src="{{ asset('vendor/bootstrap-progressbar/bootstrap-progressbar.min.js') }}">
</script>
<script src="{{ asset('vendor/counter-up/jquery.waypoints.min.js') }}"></script>
<script src="{{ asset('vendor/counter-up/jquery.counterup.min.js') }}">
</script>
<script src="{{ asset('vendor/circle-progress/circle-progress.min.js') }}"></script>
<script src="{{ asset('vendor/perfect-scrollbar/perfect-scrollbar.js') }}"></script>
<script src="{{ asset('vendor/chartjs/Chart.bundle.min.js') }}"></script>
<script src="{{ asset('vendor/select2/select2.min.js') }}">
</script>

<!-- Main JS-->
<script src="{{ asset('js/main.js') }}"></script>

</body>

</html>
<!-- end document-->
