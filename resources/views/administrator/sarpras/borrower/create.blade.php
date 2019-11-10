@extends('layouts.dashboard')

@section('title')
Register Borrower &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('SarprasBorrowerController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('SarprasBorrowerController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('borrowDataActive')
active
@endsection

@section('content')
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <div class="section-header-back">
                <a href="{{ action('SarprasBorrowerController@index') }}" class="btn btn-icon"><i
                        class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Buat Peminjam</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Sarpras</a></div>
                <div class="breadcrumb-item"><a href="#">Peminjam</a></div>
                <div class="breadcrumb-item">Buat Peminjam</div>
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
                    <form action="{{ action('SarprasBorrowerController@store') }}" method="post"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="card">
                            <div class="card-header">
                                <h4>Masukan Data Peminjam</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    @if (Auth::user()->role != 7)
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Nama
                                        Peminjam</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="id_user" required>
                                            <option>Pilih Peminjam</option>
                                            @foreach ($users as $user)
                                            <option value="{{ $user->id_user }}">{{ $user->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    @else
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">ID Peminjam</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="number" class="form-control" name="id_user" value="{{ Auth::id() }}" readonly>
                                    </div>
                                    @endif
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Nama
                                        Barang</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="id_inventory" required>
                                            <option>Pilih Barang</option>
                                            @foreach ($inventories as $inventory)
                                            <option value="{{ $inventory->id }}">{{ $inventory->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Ruangan</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="id_room" required>
                                            <option>Pilih Ruangan</option>
                                            @foreach ($rooms as $room)
                                            <option value="{{ $room->id }}">{{ $room->alias }}</option>
                                            @endforeach
                                        </select>
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
                                        <button class="btn btn-primary">Buat Peminjam Baru</button>
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