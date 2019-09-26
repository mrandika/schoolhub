@extends('layouts.dashboard')

@section('title')
Attendance &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('PresenceController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('PresenceController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('presenceActive')
active
@endsection

@php
$qrdata = "PRS=".Crypt::encryptString($attendance->id);
$isValid = date('Y-m-d') == $attendance->date
@endphp

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <div class="section-header-back">
                <a href="{{ action('PresenceController@index') }}" class="btn btn-icon"><i
                        class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Kehadiran</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Kehadiran</a></div>
                <div class="breadcrumb-item"><a href="#">{{ $attendance->date }}</a></div>
            </div>
        </div>
        <div class="section-body">
            <div class="card">
                <div class="card-body">
                    <div class="text-center">
                        {!! Qr::size(300)->generate("$qrdata"); !!}
                        @if ($isValid)
                            <h3 class="text-success">VALID</h3>
                        @else
                            <h3 class="text-danger">TIDAK VALID</h3>
                        @endif
                        <p>Valid untuk tanggal {{ $attendance->date }}</p>
                        <p>Absen dibuat pada {{ $attendance->created_at }}</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection