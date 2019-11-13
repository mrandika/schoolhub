@extends('layouts.dashboard')

@section('title')
Update Test &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('TeacherController@index_test')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('TeacherController@index_test')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('testActive')
active
@endsection

@php
$isCopyMode = $_GET['mode'] == 'copy';
@endphp

@section('content')
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <div class="section-header-back">
                <a href="{{ action('TeacherController@index_test') }}" class="btn btn-icon"><i
                        class="fas fa-arrow-left"></i></a>
            </div>
            @if ($isCopyMode)
            <h1>Salin Ujian</h1>
            @else
            <h1>Perbarui Ujian</h1>
            @endif
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Data Ujian</a></div>
                <div class="breadcrumb-item">
                    @if ($isCopyMode)
                    Salin Ujian
                    @else
                    Perbarui Ujian
                    @endif
                </div>
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

                    <form action="{{ action('TeacherController@update_test', $question->id) }}?mode={{ $_GET['mode'] }}"
                        method="post" enctype="multipart/form-data">
                        @csrf
                        <input name="_method" type="hidden" value="PATCH">
                    <input type="hidden" name="id_question" value="{{ $question->id }}">
                        <div class="card">
                            <div class="card-header">
                                <h4>Perbarui Data Ujian</h4>
                            </div>
                            <div class="card-body">
                                @if ($isCopyMode)
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Kelas</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="id_teaching" required>
                                            <option>Pilih Data Pengajar</option>
                                            @foreach (\App\ViewTeachingData::where('id_teacher', Auth::id())->get() as
                                            $teaching)
                                            <option value="{{ $teaching->id }}" @if ($question->id_teaching ==
                                                $teaching->id)
                                                selected
                                                @endif>{{ $teaching->day }} /
                                                {{ $teaching->subject }} - {{ $teaching->class }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                @endif
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Nomor
                                        Bab</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="section" class="form-control" placeholder="Cth. 3.1"
                                            required value="{{ $question->section }}">
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Nama
                                        Bab</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="section_name" class="form-control"
                                            placeholder="Cth. Pengenalan Lingkungan" required
                                            value="{{ $question->section_name }}">
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Token
                                        Unik</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="token" class="form-control"
                                            placeholder="Cth. NISN-token" value="{{ $token }}" required readonly>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">File
                                        Ujian</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="file" name="file" class="form-control" @if(!$isCopyMode) disabled
                                            readonly @endif>
                                    </div>
                                </div>
                                <input type="hidden" name="_id-test" value="{{ $question->id }}">
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <button class="btn btn-primary">
                                            @if ($isCopyMode)
                                            Salin Ujian
                                            @else
                                            Perbarui Ujian
                                            @endif
                                        </button>
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