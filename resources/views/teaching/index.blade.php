@extends('layouts.dashboard')

@section('title')
Teaching &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('TeachingController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('TeachingController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('teachingActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Pengajar</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Pengajar</a></div>
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
                                <a href="{{ action('TeachingController@create') }}" class="btn btn-primary"><i
                                        class="fas fa-plus"></i> Add</a>
                            </div>

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>Guru</th>
                                            <th>Mapel</th>
                                            <th>Kelas</th>
                                            <th>Hari</th>
                                            <th>Ruangan</th>
                                            <th>Jam Masuk</th>
                                            <th>Jam Keluar</th>
                                        </tr>
                                        @foreach ($teachings as $teaching)
                                        <tr id="teaching_{{ $teaching->id }}">
                                            <td>{{ $teaching->teacher }}
                                            </td>
                                            <td>
                                                {{ $teaching->subject }}
                                                <div class="table-links">
                                                    <a
                                                        href="{{ action('TeachingController@show', $teaching->id) }}">View</a>
                                                    <div class="bullet"></div>
                                                    <a
                                                        href="{{ action('TeachingController@edit', $teaching->id) }}">Edit</a>
                                                    <div class="bullet"></div>
                                                    <a id="deleteTeaching_{{ $teaching->id }}"
                                                        data-id="{{$teaching->id}}" href='javascript:void(0)'
                                                        class="text-danger">Delete</a>
                                                </div>
                                            </td>
                                            <td>
                                                {{ $teaching->class }}
                                            </td>
                                            <td>
                                                {{ $teaching->day }}
                                            </td>
                                            <td>
                                                {{ $teaching->room }}
                                            </td>
                                            <td>
                                                {{ $teaching->time_in }}
                                            </td>
                                            <td>
                                                {{ $teaching->time_out }}
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
@foreach ($teachings as $teaching)
<script>
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#deleteTeaching_{{ $teaching->id }}').on('click', function () {
            var teachingId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah akun pengajar ini dihapus, semua data yang terkait akan terhapus!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('dashboard/teaching')}}" + '/' + teachingId,
                            success: function (data) {
                                $("#teaching_" + teachingId).remove();
                                swal("Sukses!", "Data pengajar telah dihapus.", "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Data pengajar gagal dihapus.", "error");
                                console.log(data)
                            }
                        });
                    }
                });
        });
    });
</script>
@endforeach
@endsection