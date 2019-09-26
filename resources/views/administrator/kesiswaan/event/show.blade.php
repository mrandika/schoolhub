@extends('layouts.dashboard')

@section('title')
{{ $event->name }} &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('KesiswaanEventController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('KesiswaanEventController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('eventActive')
active
@endsection