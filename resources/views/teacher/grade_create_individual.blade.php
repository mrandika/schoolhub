@extends('layouts.dashboard')

@section('title')
Create Grade &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('TeacherController@index_grade')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('TeacherController@index_grade')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('gradeActive')
active
@endsection

@section('content')
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <div class="section-header-back">
                <a href="{{ action('TeacherController@index_grade') }}" class="btn btn-icon"><i
                        class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Buat Penilaian</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Data Nilai</a></div>
                <div class="breadcrumb-item">Buat Penilaian</div>
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
                    <form action="{{ action('TeacherController@store_grade_class') }}" method="post"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="card">
                            <div class="card-header">
                                <h4>Masukan Data Nilai</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Kelas</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="id_teaching" id="id_teaching"
                                            required>
                                            <option>Pilih Data Pengajar</option>
                                            @foreach ($teachings as $teaching)
                                            <option value="{{ $teaching->id }}" data-class="{{ $teaching->id_class }}">
                                                {{ $teaching->day }} /
                                                {{ $teaching->subject }} - {{ $teaching->class }}</option>
                                            @endforeach
                                        </select>
                                        <input type="hidden" name="id_class" value="{{ $teaching->id_class }}" required>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Nomor
                                        Bab</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="section" class="form-control" placeholder="Cth. 3.1"
                                            required>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Nama
                                        Bab</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="section_name" class="form-control"
                                            placeholder="Cth. Pengenalan Lingkungan" required>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <div class="table-responsive ml-5 mr-5">
                                        <table class="table table-striped">
                                            <tbody id="tbody">
                                                <tr>
                                                    <th>ID Siswa</th>
                                                    <th>Nama Siswa</th>
                                                    <th>Nilai Siswa</th>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <button class="btn btn-primary float-right">Simpan Nilai</button>
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
<script>
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#id_teaching').on('change', function () {
            var id = $(this).find(':selected').data('class');

            $.ajax({
                type: 'GET',
                url: "{{ url('dashboard/grade/data/class') }}" + '/' + id,
                success: function (data) {
                    $('#tbody').html("<tr><th>ID Siswa</th><th>Nama Siswa</th><th>Nilai Siswa</th></tr>");
                    data.forEach(student => {
                        $('#tbody').append(`<tr><td>${student.id_user}</td><td>${student.name}</td><td><input class="form-control" type="number" name="grade[]" placeholer="Nilai"></input></td></tr>`)
                    });
                },
                error: function (data) {
                    console.log(data);
                }
            });
        });
    });
</script>
@endsection