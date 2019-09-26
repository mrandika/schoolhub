@extends('layouts.dashboard')

@section('title')
Class &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('ClassController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('ClassController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('classActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <div class="section-header-back">
                <a href="{{ action('ClassController@index') }}" class="btn btn-icon"><i
                        class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Kelas {{ $classes }}</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Kelas</a></div>
                <div class="breadcrumb-item"><a href="#">{{ $classes }}</a></div>
            </div>
        </div>
        <div class="section-body">

            <div class="row">
                <div class="col-12">
                    <div class="clearfix mb-3"></div>
                    <div class="card mb-0">
                        <div class="card-body">
                            <ul class="nav nav-pills">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">Murid <span
                                            class="badge badge-white">{{ $counts }}</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="float-right">
                                <form>
                                    <div class="input-group">
                                        <input type="text" id="search" class="form-control" placeholder="Search">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>Foto</th>
                                            <th>Nama</th>
                                            <th>NIPD</th>
                                            <th>NISN</th>
                                        </tr>
                                        @foreach ($students as $student)
                                        <tr id="student_{{ $student->id_user }}">
                                            <td>
                                                <a href="#">
                                                    <img alt="image"
                                                        src="{{url('uploads/userImage/'.\App\User::select('image')->where('id', $student->id_user)->first()->image)}}"
                                                        class="rounded-circle" width="35" data-toggle="title" title="">
                                                </a>
                                            </td>
                                            <td>{{ \App\UserData::select('name')->where('id_user', $student->id_user)->first()->name }}
                                                <div class="table-links">
                                                    <a href="#">View</a>
                                                    <div class="bullet"></div>
                                                    <a
                                                        href="{{ action('StudentController@edit', $student->id_user) }}">Edit</a>
                                                    <div class="bullet"></div>
                                                    <a id="deleteStudent_{{ $student->id_user }}"
                                                        data-id="{{$student->id_user}}" href='javascript:void(0)'
                                                        class="text-danger">Delete</a>
                                                </div>
                                            </td>
                                            <td>
                                                {{ $student->nipd }}
                                            </td>
                                            <td>
                                                {{ $student->nisn }}
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection

@section('scripts')
@foreach ($students as $student)
<script>
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#deleteStudent_{{ $student->id_user }}').on('click', function () {
            var studentId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah akun murid ini dihapus, semua data yang terkait akan terhapus!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('student/')}}" + '/' + studentId,
                            success: function (data) {
                                $("#student_" + studentId).remove();
                                swal("Sukses!", "Akun murid telah dihapus.", "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Akun murid gagal dihapus.", "error");
                            }
                        });
                    }
                });
        });
    });
</script>
@endforeach
@endsection