@extends('layouts.dashboard')

@section('title')
Test Page &mdash; SchoolHUB
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

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Data Ujian</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Data Ujian</a></div>
            </div>
        </div>
        <div class="section-body">

            <div class="row">
                <div class="col-12">
                    <div class="card mb-0">
                        <div class="card-body">
                            <ul class="nav nav-pills">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">All <span
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
                            <div class="float-left">
                                <a href="{{ action('TeacherController@create_test') }}" class="btn btn-primary"><i
                                        class="fas fa-plus"></i> Add</a>
                            </div>

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>Nama</th>
                                            <th>Mapel</th>
                                            <th>Kelas</th>
                                            <th>Action</th>
                                            <th>Delete</th>
                                        </tr>
                                        @foreach ($tests->sortByDesc('id') as $test)
                                        <tr id="row_{{ $test->id }}">
                                            <td>
                                                {{ $test->section }} - {{ $test->section_name }}
                                            </td>
                                            <td>{{ $test->subject_name }}
                                            </td>
                                            <td>
                                                {{ $test->class_name }}
                                            </td>
                                            <td>
                                                <a class="btn btn-info text-white" href="{{ route('teacher.edit.test', $test->id) }}?mode=copy">Salin</a>
                                            <a class="btn btn-warning text-white" href="{{ route('teacher.edit.test', $test->id) }}?mode=edit">Edit</a>
                                            </td>
                                            <td>
                                                <a class="btn btn-danger text-white delete_test"
                                                    href="javascript:void(0)" data-id="{{ $test->id }}">Hapus</a>
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
<script>
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('.delete_test').on('click', function () {
            var testId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah ujian ini dihapus, semua data yang terkait akan terhapus!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('dashboard/test/teacher/delete/')}}" + '/' +
                                testId,
                            success: function (data) {
                                $("#row_" + testId).remove();
                                swal("Sukses!", "Data ujian telah dihapus.", "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Data ujian gagal dihapus.", "error");
                            }
                        });
                    }
                });
        });
    });
</script>
@endsection