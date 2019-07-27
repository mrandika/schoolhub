@extends('layouts.dashboard')

@section('title')
Teacher &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
  <a href="{{action('TeacherController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
  <a href="{{action('TeacherController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('todayActive')
    active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
      <div class="section-header">
        <h1>Default Layout</h1>
        <div class="section-header-breadcrumb">
          <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
          <div class="breadcrumb-item"><a href="#">Layout</a></div>
          <div class="breadcrumb-item">Default Layout</div>
        </div>
      </div>

      @yield('section-content')
    </section>
  </div>
@endsection