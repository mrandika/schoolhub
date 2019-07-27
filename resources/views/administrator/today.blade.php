@extends('layouts.dashboard-today')

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('AdministratorController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('AdministratorController@index')}}">H</a>
</div>
@endsection

@section('dashboardNavigationList')
<li class=@yield('todayActive')><a class="nav-link"><i class="fas fa-pen"></i>
        <span>Today</span></a></li>
@endsection

@section('section-content')
<div class="section-body">
  <h2 class="section-title">This is Example Page</h2>
  <p class="section-lead">This page is just an example for you to create your own page.</p>
  <div class="card">
    <div class="card-header">
      <h4>Example Card</h4>
    </div>
    <div class="card-body">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
      cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
      proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    </div>
    <div class="card-footer bg-whitesmoke">
      This is card footer
    </div>
  </div>
</div>
@endsection