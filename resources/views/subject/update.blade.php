@extends('layouts.dashboard')

@section('title')
Update Subject &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('SubjectController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('SubjectController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('subjectActive')
active
@endsection

@section('content')
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <div class="section-header-back">
                <a href="{{ action('SubjectController@index') }}" class="btn btn-icon"><i
                        class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Perbarui Mata Pelajaran</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Mata Pelajaran</a></div>
                <div class="breadcrumb-item">Perbarui Mata Pelajaran</div>
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
                    <form action="{{ action('SubjectController@update', $subject->id) }}" method="post"
                        enctype="multipart/form-data">
                        @csrf
                        <input name="_method" type="hidden" value="PATCH">
                        <div class="card">
                            <div class="card-header">
                                <h4>Masukan Data Pelajaran</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Kode</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="code" value="{{ $subject->code }}" class="form-control"
                                            required>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Nama</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="name" value="{{ $subject->name }}" class="form-control"
                                            required>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Jenis
                                        Mapel</label>
                                    <div class="selectgroup w-100 col-sm-12 col-md-7">
                                        <label class="selectgroup-item">
                                            <input type="radio" name="type" value="C1" class="selectgroup-input"
                                                @if($subject->type === "C1")
                                            checked @endif>
                                            <span class="selectgroup-button">C1</span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="gender" value="C2" class="selectgroup-input"
                                                @if($subject->type === "C2")
                                            checked @endif>
                                            <span class="selectgroup-button">C2</span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="gender" value="C3" class="selectgroup-input"
                                                @if($subject->type === "C3")
                                            checked @endif>
                                            <span class="selectgroup-button">C3</span>
                                        </label>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Kriteria
                                        Ketuntasan</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="numberDecimal" name="minimum" value="{{ $subject->minimum }}"
                                            class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <button class="btn btn-primary">Perbarui Pelajaran</button>
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

@section('scripts')
<script src="{{asset('modules/jquery-selectric/jquery.selectric.min.js')}}"></script>
<script src="{{asset('modules/upload-preview/assets/js/jquery.uploadPreview.min.js')}}"></script>
<script src="{{asset('modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js')}}"></script>
<script src="{{asset('js/dashboard/page/features-post-create.js')}}"></script>
@endsection