@extends('layouts.dashboard')

@section('title')
Grade Page &mdash; SchoolHUB
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
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Data Nilai</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Data Nilai</a></div>
            </div>
        </div>
        <div class="section-body">
            <div class="row">
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
                                {{-- <a href="{{ action('TeacherController@create_grade_individual') }}"
                                class="btn btn-primary"><i class="fas fa-plus"></i> Add One</a> --}}
                                <a href="{{ action('TeacherController@create_grade_class') }}"
                                    class="btn btn-primary"><i class="fas fa-plus"></i> Add {{--By Class--}}</a>
                            </div>

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>ID Pengajar</th>
                                            <th>Nama</th>
                                            <th>Kelas</th>
                                            <th>Mapel</th>
                                            <th>Nilai</th>
                                            <th>Action</th>
                                        </tr>
                                        @foreach ($grades as $grade)
                                        <tr id="row_{{ $grade->id }}">
                                            <td>
                                                {{ $grade->id_teaching }} -
                                                {{ $grade->section }}/{{ $grade->section_name }}
                                            </td>
                                            <td>
                                                {{ $grade->student }}
                                            </td>
                                            <td>
                                                {{ $grade->class_name }}
                                            </td>
                                            <td>
                                                {{ $grade->subject }}
                                            </td>
                                            <td>
                                                <b>{{ $grade->score }}</b>
                                            </td>
                                            <td>
                                                {{-- <a class="btn btn-warning text-white">Edit</a> --}}
                                            <a href="javascript:void(0)" class="btn btn-danger text-white delete_grade" data-id="{{ $grade->id }}">Hapus</a>
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

        $('.delete_grade').on('click', function () {
            var gradeId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah nilai ini dihapus, semua data yang terkait akan terhapus!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('dashboard/grade/delete')}}" + '/' +
                            gradeId,
                            success: function (data) {
                                $("#row_" + gradeId).remove();
                                swal("Sukses!", "Data nilai telah dihapus.", "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Data nilai gagal dihapus.", "error");
                            }
                        });
                    }
                });
        });
    });
</script>
@endsection