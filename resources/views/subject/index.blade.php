@extends('layouts.dashboard')

@section('title')
Subject &mdash; SchoolHUB
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
            <h1>Mata Pelajaran</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Mata Pelajaran</a></div>
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
                                <a href="{{ action('SubjectController@create') }}" class="btn btn-primary"><i
                                        class="fas fa-plus"></i> Add</a>
                            </div>

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>Code</th>
                                            <th>Nama</th>
                                            <th>Tipe</th>
                                            <th>Kriteria Kelulusan</th>
                                        </tr>
                                        @foreach ($subjects as $subject)
                                        <tr id="subject_{{ $subject->id }}">
                                            <td>
                                                {{ $subject->code }}
                                            </td>
                                            <td>{{ $subject->name }}
                                                <div class="table-links">
                                                    <a
                                                        href="{{ action('SubjectController@edit', $subject->id) }}">Edit</a>
                                                    <div class="bullet"></div>
                                                    <a id="deleteSubject_{{ $subject->id }}" data-id="{{$subject->id}}"
                                                        href='javascript:void(0)' class="text-danger">Delete</a>
                                                </div>
                                            </td>
                                            <td>
                                                {{ $subject->type }}
                                            </td>
                                            <td>
                                                {{ $subject->minimum }}
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
@foreach ($subjects as $subject)
<script>
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#deleteSubject_{{ $subject->id }}').on('click', function () {
            var subjectId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah data mata pelajaran ini dihapus, semua data yang terkait akan terhapus!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('dashboard/subject')}}" + '/' + subjectId,
                            success: function (data) {
                                $("#subject_" + subjectId).remove();
                                swal("Sukses!", "Data mata pelajaran telah dihapus.",
                                    "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Data mata pelajaran gagal dihapus.",
                                    "error");
                            }
                        });
                    }
                });
        });
    });
</script>
@endforeach
@endsection