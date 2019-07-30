@extends('layouts.dashboard')

@section('title')
Teacher &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('TeacherController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('TeacherController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('teacherActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <div class="section-header-back">
                <a href="{{ action('TeacherController@index') }}" class="btn btn-icon"><i
                        class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Data Guru</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Guru</a></div>
                <div class="breadcrumb-item"><a href="#">{{ $data->name }}</a></div>
            </div>
        </div>
        <div class="section-body">

            <div class="row">
                <div class="col-12">
                    <div class="card author-box card-primary">
                        <div class="card-body">
                            <div class="author-box-left">
                                <img alt="image" src="{{url('uploads/userImage/'.$user->image)}}"
                                    class="rounded-circle author-box-picture">
                                <div class="clearfix"></div>
                            </div>
                            <div class="author-box-details">
                                <div class="author-box-name">
                                    <a href="#">{{ $data->name }}</a>
                                </div>
                                <div class="author-box-job">
                                    NIP: {{ $teacher->nip }}
                                </div>
                                <div class="author-box-description">
                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <th>Field</th>
                                                <th>Data</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Nama
                                                </td>
                                                <td>
                                                    {{ $data->name }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Jenis Kelamin
                                                </td>
                                                <td>
                                                    {{ $data->gender }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Agama
                                                </td>
                                                <td>
                                                    {{ $data->religion }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Tempat, tanggal lahir
                                                </td>
                                                <td>
                                                    {{ $data->birthplace }}, {{ $data->dob }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Alamat
                                                </td>
                                                <td>
                                                    {{ $data->address }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Telepon
                                                </td>
                                                <td>
                                                    {{ $data->phone }}
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="w-100 d-sm-none"></div>
                                <div class="float-right mt-sm-0 mt-3">
                                    <a href="{{ action('TeacherController@edit', $teacher->id_user) }}" class="btn">Edit
                                        Akun <i class="fas fa-chevron-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection