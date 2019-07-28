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

@section('classActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Kelas</h1>
            <div class="section-header-button">
                <a href="{{ action('ClassController@create') }}" class="btn btn-primary">Add New</a>
            </div>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Kelas</a></div>
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

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>Nama</th>
                                            <th>Wali Kelas</th>
                                        </tr>
                                        @foreach ($classes as $class)
                                        <tr id="class_{{ $class->id }}">
                                            <td>{{ $class->name }}
                                                <div class="table-links">
                                                    <a href="#">View</a>
                                                    <div class="bullet"></div>
                                                    <a href="{{ action('ClassController@edit', $class->id) }}">Edit</a>
                                                    <div class="bullet"></div>
                                                    <a id="deleteClass_{{ $class->id }}" data-id="{{ $class->id }}"
                                                        href='javascript:void(0)' class="text-danger">Delete</a>
                                                </div>
                                            </td>
                                            <td>
                                                {{ \App\UserData::select('name')->where('id_user', $class->id_teacher)->first()->name }}
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <div class="float-right">
                                <nav>
                                    <ul class="pagination">
                                        {{ $classes->links() }}
                                    </ul>
                                </nav>
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
@foreach ($classes as $class)
<script>
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#deleteClass_{{ $class->id }}').on('click', function () {
            var classId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah data kelas ini dihapus, semua data yang terkait dengan kelas ini (termasuk siswa, nilai dan lain-lain) akan terhapus!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('admin/class/')}}" + '/' + classId,
                            success: function (data) {
                                $("#class_" + classId).remove();
                                swal("Sukses!", "Data kelas telah dihapus.", "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Data kelas gagal dihapus.", "error");
                            }
                        });
                    }
                });
        });
    });
</script>
@endforeach
@endsection