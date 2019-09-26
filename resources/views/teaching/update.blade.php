@extends('layouts.dashboard')

@section('title')
Update Teaching &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('TeachingController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('TeachingController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('teachingActive')
active
@endsection

@section('content')
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <div class="section-header-back">
                <a href="{{ action('TeachingController@index') }}" class="btn btn-icon"><i
                        class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Perbarui Pengajar</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Pengajar</a></div>
                <div class="breadcrumb-item">Perbarui Pengajar</div>
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
                    <form action="{{ action('TeachingController@update', $teaching->id) }}" method="post"
                        enctype="multipart/form-data">
                        @csrf
                        <input name="_method" type="hidden" value="PATCH">
                        <div class="card">
                            <div class="card-header">
                                <h4>Masukan Data Pengajar</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Guru
                                        Pengajar</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="id_teacher" required>
                                            <option>Pilih Guru Pengajar</option>
                                            @foreach ($teachers as $teacher)
                                            <option value="{{ $teacher->id_user }}" @if ($teaching->id_teacher ==
                                                $teacher->id_user) selected @endif>{{ $teacher->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Mata
                                        Pelajaran</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="id_subject" required>
                                            <option>Pilih Mata Pelajaran</option>
                                            @foreach ($subjects as $subject)
                                            <option value="{{ $subject->id }}" @if ($teaching->id_subject ==
                                                $subject->id) selected @endif>{{ $subject->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Kelas</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="id_class" required>
                                            <option>Pilih Kelas</option>
                                            @foreach ($classes as $class)
                                            <option value="{{ $class->id }}" @if ($teaching->id_class ==
                                                $class->id) selected @endif>{{ $class->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Ruangan</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="id_room" required>
                                            <option>Pilih Ruangan</option>
                                            @foreach ($rooms->sortBy('code') as $room)
                                            <option value="{{ $room->id }}" @if ($teaching->id_room ==
                                                $room->id) selected @endif>{{ $room->alias }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Hari
                                        Mengajar</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="day" required>
                                            <option>Pilih Hari Mengajar</option>
                                            <option value="1" @if ($teaching->day == 1) selected @endif>Senin</option>
                                            <option value="2" @if ($teaching->day == 2) selected @endif>Selasa</option>
                                            <option value="3" @if ($teaching->day == 3) selected @endif>Rabu</option>
                                            <option value="4" @if ($teaching->day == 4) selected @endif>Kamis</option>
                                            <option value="5" @if ($teaching->day == 5) selected @endif>Jumat</option>
                                            <option value="6" @if ($teaching->day == 6) selected @endif>Sabtu</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Jam
                                        Masuk</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" placeholder="Mis. 07:00" value="{{ $teaching->time_in }}"
                                            name="time_in" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Jam
                                        Keluar</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" placeholder="Mis. 12:00" value="{{ $teaching->time_out }}"
                                            name="time_out" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <button class="btn btn-primary">Perbarui Data</button>
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