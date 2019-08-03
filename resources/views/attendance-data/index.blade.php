@extends('layouts.dashboard')

@section('title')
Attendance &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('PresenceController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('PresenceController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('presenceActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Kehadiran</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Kehadiran</a></div>
            </div>
        </div>
        <div class="section-body">

            <div class="row">
                <div class="col-12">
                    <div class="card mb-0">
                        <div class="card-body">
                            <ul class="nav nav-pills">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">Hari Ini <span
                                            class="badge badge-white">{{ $countsToday }}</span></a>
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
                            @if ($available == 0)
                            <div class="float-left mr-2">
                                <a href="{{ action('PresenceController@showQr') }}" class="btn btn-info"><i
                                        class="fas fa-qrcode"></i> Generate</a>
                            </div>
                            @endif
                            <div class="float-left mr-2">
                                <a href="{{ action('PresenceController@create') }}" class="btn btn-info"><i
                                        class="fas fa-qrcode"></i> View QR</a>
                            </div>
                            <div class="float-left">
                                <a href="{{ action('PresenceController@create') }}" class="btn btn-primary"><i
                                        class="fas fa-plus"></i> Add</a>
                            </div>

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>Nama</th>
                                            <th>Status</th>
                                            <th>Created At</th>
                                            <th>Action</th>
                                        </tr>
                                        @foreach ($attendances as $attendance)
                                        <tr id="attendance_{{ $attendance->id }}">
                                            <td>
                                                {{ \App\UserData::select('name')->where('id_user', $attendance->id_students)->first()->name }}
                                            </td>
                                            <td>
                                                {{ $attendance->status }}
                                            </td>
                                            <td>
                                                {{ $attendance->created_at->diffForHumans() }}
                                            </td>
                                            <td colspan="2">
                                                <a href="{{ action('PresenceController@edit', $attendance->id) }}"
                                                    class="btn btn-warning">Edit</a>
                                                <a id="deleteAttendance_{{ $attendance->id }}" data-id="{{$attendance->id}}"
                                                    href='javascript:void(0)' class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <div class="float-right">
                                <nav>
                                    <ul class="pagination">
                                        {{ $attendances->links() }}
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
@foreach ($attendances as $attendance)
<script>
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#deleteAttendance_{{ $attendance->id }}').on('click', function () {
            var attendanceId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah data kehadiran siswa ini dihapus, semua data yang terkait dengan kehadiran siswa ini akan terhapus!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('dashboard/presence')}}" + '/' + attendanceId,
                            success: function (data) {
                                $("#attendance_" + attendanceId).remove();
                                swal("Sukses!", "Data kehadiran telah dihapus.", "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Data kehadiran gagal dihapus.", "error");
                            }
                        });
                    }
                });
        });
    });
</script>
@endforeach
@endsection