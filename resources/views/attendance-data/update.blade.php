@extends('layouts.dashboard')

@section('title')
Update Attendance &mdash; SchoolHUB
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

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <div class="section-header-back">
                <a href="{{ action('PresenceController@index') }}" class="btn btn-icon"><i
                        class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Daftar Kehadiran</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Kehadiran</a></div>
                <div class="breadcrumb-item"><a href="#">Daftar Kehadiran</a></div>
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
                    <form action="{{ action('PresenceController@update', $data->id) }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <input name="_method" type="hidden" value="PATCH">
                        <div class="card">
                            <div class="card-header">
                                <h4>Masukan Data Kehadiran</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Nama
                                        Siswa</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="id_students" required>
                                            <option>Pilih Murid</option>
                                            @foreach ($students as $student)
                                            <option value="{{ $student->id_user }}" @if ($data->id_students ==
                                                    $student->id_user) selected @endif>{{ $student->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Status
                                        Kehadiran</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="status" required>
                                            <option>Pilih Kehadiran</option>
                                            <option value="Hadir" @if ($data->status ==
                                                    "Hadir") selected @endif>Hadir</option>
                                            <option value="Tidak Hadir" @if ($data->status ==
                                                    "Tidak Hadir") selected @endif>Tidak Hadir</option>
                                            <option value="Dispensasi" @if ($data->status ==
                                                    "Dispensasi") selected @endif>Dispensasi</option>
                                            <option value="Izin" @if ($data->status ==
                                                    "Izin") selected @endif>Izin</option>
                                            <option value="Sakit" @if ($data->status ==
                                                    "Sakit") selected @endif>Sakit</option>
                                            <option value="Absen" @if ($data->status ==
                                                    "Absen") selected @endif>Absen</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <button class="btn btn-primary">Perbarui Kehadiran</button>
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