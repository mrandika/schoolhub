@extends('layouts.dashboard-today')

@section('sidebarNavigation')
<div class="sidebar-brand">
  <a href="{{action('HomeController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
  <a href="{{action('HomeController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('todayActive')
active
@endsection

@php
$page = \App\UserTodayPage::find(Auth::id());
@endphp

@section('section-content')
@if ($page != null)
<div class="section-body">
  <h2 class="section-title">{{ $page->heading }}</h2>
  <p class="section-lead">{{ $page->subheading }}</p>
  <div class="card">
    <div class="card-header">
      <h4>Mading Pribadi-ku</h4>
      <a class="btn btn-warning float-right" @if ($page==null) href="{{ action('TodayController@create') }}" @else
          href="{{ action('TodayController@edit', $page->id_user) }}" @endif class="float-left">Sesuaikan
        </a>
    </div>
    <div class="card-body">
      {!! $page->content !!}
    </div>
  </div>
</div>
@else
<div class="section-body">
  <h2 class="section-title">This is Example Page</h2>
  <p class="section-lead">This page is just an example for you to create your own page.</p>
  <div class="card">
    <div class="card-header">
        <h4>Mading Pribadi-ku</h4>
        <a class="btn btn-warning float-right" @if ($page==null) href="{{ action('TodayController@create') }}" @else
          href="{{ action('TodayController@edit', $page->id_user) }}?mode=edit" @endif class="float-left">Sesuaikan
        </a>
    </div>
    <div class="card-body">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    </div>
  </div>
</div>
@endif
@endsection