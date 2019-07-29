@extends('layouts.dashboard')

@section('title')
Register Student &mdash; SchoolHUB
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

@section('studentActive')
active
@endsection

@section('content')
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <div class="section-header-back">
                <a href="{{ action('StudentController@index') }}" class="btn btn-icon"><i
                        class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Perbarui Data Murid</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Murid</a></div>
                <div class="breadcrumb-item">Perbarui Data Murid</div>
            </div>
        </div>

        <div class="section-body">

            <div class="row">
                <div class="col-12">
                    <form action="{{ action('StudentController@update', $student->id_user) }}" method="post"
                        enctype="multipart/form-data">
                        @csrf
                        <input name="_method" type="hidden" value="PATCH">
                        <div class="card">
                            <div class="card-header">
                                <h4>Masukan Data Pribadi</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">NISN</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="nip" class="form-control" value="{{ $student->nisn }}">
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">NIPD</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="nip" class="form-control" value="{{ $student->nipd }}">
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Nama</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="name" class="form-control" value="{{ $data->name }}">
                                    </div>
                                </div>
                                <div class=" form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Jenis
                                        Kelamin</label>
                                    <div class="selectgroup w-100 col-sm-12 col-md-7">
                                        <label class="selectgroup-item">
                                            <input type="radio" name="gender" value="Laki-laki"
                                                class="selectgroup-input" @if($data->gender === "Laki-laki")
                                            checked @endif>
                                            <span class="selectgroup-button">Laki-laki</span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="gender" value="Perempuan"
                                                class="selectgroup-input" @if($data->gender === "Perempuan")
                                            checked @endif>
                                            <span class="selectgroup-button">Perempuan</span>
                                        </label>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Agama</label>
                                    <div class="selectgroup w-100 col-sm-12 col-md-7">
                                        <label class="selectgroup-item">
                                            <input type="radio" name="religion" value="Islam" class="selectgroup-input"
                                                @if($data->religion === "Islam")
                                            checked @endif>
                                            <span class="selectgroup-button">Islam</span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="religion" value="Kristen Protestan"
                                                class="selectgroup-input" @if($data->religion === "Kristen Protestan")
                                            checked @endif>
                                            <span class="selectgroup-button">Kristen Protestan</span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="religion" value="Katolik"
                                                class="selectgroup-input" @if($data->religion === "Katolik")
                                            checked @endif>
                                            <span class="selectgroup-button">Katolik</span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="religion" value="Buddha" class="selectgroup-input"
                                                @if($data->religion === "Buddha")
                                            checked @endif>
                                            <span class="selectgroup-button">Buddha</span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="religion" value="Hindu" class="selectgroup-input"
                                                @if($data->religion === "Hindu")
                                            checked @endif>
                                            <span class="selectgroup-button">Hindu</span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="religion" value="Kong Hu Chu"
                                                class="selectgroup-input" @if($data->religion === "Kong Hu Chu")
                                            checked @endif>
                                            <span class="selectgroup-button">Kong Hu Chu</span>
                                        </label>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Tempat
                                        Lahir</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="birthplace" value="{{ $data->birthplace }}"
                                            class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Tanggal
                                        Lahir</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" placeholder="YYYY-MM-DD" value="{{ $data->dob }}" name="dob"
                                            class="form-control datepicker">
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Alamat</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="address" value="{{ $data->address }}"
                                            class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Nomor
                                        Telepon</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="phone" value="{{ $data->phone }}" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h4>Masukan Data Login</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Gambar</label>
                                    <div class="col-sm-12 col-md-7">
                                        <div id="image-preview" class="image-preview"
                                            style="background-image: url({{ url('uploads/userImage/'.\App\User::select('image')->where('id', $student->id_user)->first()->image) }}); background-size: cover; background-position: center center;">
                                            <label for="image-upload" id="image-label">Change File</label>
                                            <input type="file" name="image" id="image-upload">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                        <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Kelas</label>
                                        <div class="col-sm-12 col-md-7">
                                            <select class="form-control selectric" name="class" required>
                                                <option>Pilih Kelas</option>
                                                @foreach ($classes as $class)
                                                <option value="{{ $class->id }}" @if ($student->id_class ==
                                                        $class->id) selected @endif>{{ $class->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                <div class="form-group row mb-4">
                                    <label
                                        class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Username</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="username" value="{{ $user->username }}"
                                            class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Email</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="email" name="email" value="{{ $user->email }}"
                                            class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label
                                        class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Password</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="password" placeholder="Kosongkan jika tidak diganti"
                                            name="password" class="form-control">
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

@section('scripts')
<script src="{{asset('modules/jquery-selectric/jquery.selectric.min.js')}}"></script>
<script src="{{asset('modules/upload-preview/assets/js/jquery.uploadPreview.min.js')}}"></script>
<script src="{{asset('modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js')}}"></script>
<script src="{{asset('js/dashboard/page/features-post-create.js')}}"></script>
@endsection