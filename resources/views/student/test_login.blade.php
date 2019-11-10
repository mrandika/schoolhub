@extends('layouts.dashboard')

@section('title')
Test Login &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('StudentController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('StudentController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('testActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Ujian</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Ujian</a></div>
            </div>
        </div>
        <div class="section-body">
            <div class="row">
                <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                    <div class="login-brand">
                        <img width="25%" src="{{ url('image/logo.png') }}"></img>
                    </div>

                    <div class="card card-primary">
                        <div class="card-header">
                            <h4>Computer-Based Test</h4>
                        </div>

                        <div class="card-body">
                            @isset($error)
                            <p class="text-center">{{ $message }}</p>
                            @endisset
                            <form method="POST" action="{{route('student.validate.token')}}">
                                @csrf
                                <div class="form-group">
                                    <label for="nisn">NISN</label>
                                    <input id="nisn" type="text"
                                        class="form-control{{ $errors->has('nisn') ? ' is-invalid' : '' }}" name="nisn"
                                        value="{{ $nisn }}" readonly>
                                    @if ($errors->has('nisn'))
                                    <div class="invalid-feedback">
                                        {{$errors->first('nisn')}}
                                    </div>
                                    @endif
                                </div>

                                <div class="form-group">
                                    <div class="d-block">
                                        <label for="token" class="control-label">Token</label>
                                    </div>
                                    <input id="token" type="password"
                                        class="form-control{{ $errors->has('token') ? ' is-invalid' : '' }}"
                                        name="token" tabindex="2" required="">
                                    @if ($errors->has('token'))
                                    <div class="invalid-feedback">
                                        {{$errors->first('token')}}
                                    </div>
                                    @endif
                                </div>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
                                        Login
                                    </button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection