@extends('layouts.dashboard')

@section('title')
Register Events &mdash; SchoolHUB
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

@section('content')
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <div class="section-header-back">
                <a href="{{ action('SarprasInventoryController@index') }}" class="btn btn-icon"><i
                        class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Buat Acara</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Kesiswaan</a></div>
                <div class="breadcrumb-item"><a href="#">Event</a></div>
                <div class="breadcrumb-item"><a href="#">Buat Acara</a></div>
            </div>
        </div>

        <div class="section-body">

            <div class="row">
                <div class="col-12">
                    @if ($errors->any())
                    <div class="alert alert-danger" role="alert">
                        <div class="alert alert-danger alert-has-icon">
                            <div class="alert-icon"><i class="fas fa-exclamation-circle"></i></i></div>
                            <div class="alert-body">
                                <div class="alert-title">Error</div>
                                <ol>
                                    @foreach ($errors->all() as $error)
                                    <li>
                                        <p class="mb-0">{{ $error }}</p>
                                    </li>
                                    @endforeach
                                </ol>
                            </div>
                        </div>
                    </div>
                    @endif
                    <form action="{{ action('KesiswaanEventController@store') }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="card">
                            <div class="card-header">
                                <h4>Masukan Data Acara</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Nama</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="name"
                                            class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Deskripsi</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="description"
                                            class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Tanggal Pelaksanaan</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="date" name="date"
                                            class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Add
                                        Another</label>
                                    <div class="col-sm-12 col-md-7">
                                        <label class="custom-switch mt-2">
                                            <input type="checkbox" name="multiple" class="custom-switch-input">
                                            <span class="custom-switch-indicator"></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <button class="btn btn-primary">Buat Acara Baru</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection