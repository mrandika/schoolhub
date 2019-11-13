@extends('layouts.dashboard')

@section('title')
Today &mdash; SchoolHUB
@endsection

@php
$page = \App\UserTodayPage::find(Auth::id());
@endphp

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
  <section class="section">
    <div class="section-header">
      <h1>Today</h1>
    </div>

    @yield('section-content')
  </section>
</div>
@endsection