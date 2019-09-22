@extends('layouts.dashboard')

@section('title')
Session &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('SessionController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('SessionController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('sessionActive')
active
@endsection

@section('css')
<link rel="stylesheet" href="{{asset('modules/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css')}}">
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Sesi</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Sesi</a></div>
            </div>
        </div>
        <div class="section-body">

            <div class="row">
                <div class="col-12">
                    <div class="card mb-0">
                        <div class="card-body">
                            <ul class="nav nav-pills">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">Aktif <span
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
                                            <th>Pengguna</th>
                                            <th>Platform</th>
                                            <th>Merk</th>
                                            <th>Action</th>
                                        </tr>
                                        @foreach ($sessions as $session)
                                        <tr id="session_{{ $session->id }}">
                                            <td>{{ $session->name }}
                                            </td>
                                            <td>
                                                {{ $session->is_mobile }}
                                            </td>
                                            <td>
                                                {{ $session->phone }}
                                            </td>
                                            <td>
                                                <a id="deleteSession_{{ $session->id }}" data-id="{{$session->id}}"
                                                    href='javascript:void(0)' class="btn btn-danger">Delete</a>
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
<script src="{{asset('modules/datatables/datatables.min.js')}}"></script>
<script src="{{asset('modules/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('modules/datatables/Select-1.2.4/js/dataTables.select.min.js')}}"></script>

@foreach ($sessions as $session)
<script>
    $(document).ready(function () {
        $('.table').DataTable();

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#deleteSession_{{ $session->id }}').on('click', function () {
            var sessionId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah detail sesi ini dihapus, pengguna akan dapat masuk ke perangkat baru!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('dashboard/session')}}" + '/' + sessionId,
                            success: function (data) {
                                $("#session_" + sessionId).remove();
                                swal("Sukses!", "Detail sesi telah dihapus.",
                                    "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Detail sesi gagal dihapus.", "error");
                            }
                        });
                    }
                });
        });
    });
</script>
@endforeach
@endsection