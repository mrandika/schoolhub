@extends('layouts.dashboard')

@section('title')
Room &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('RoomController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('RoomController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('roomActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Ruangan</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Ruangan</a></div>
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
                                <a href="{{ action('RoomController@create') }}" class="btn btn-primary"><i
                                        class="fas fa-plus"></i> Add</a>
                            </div>

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>Kode</th>
                                            <th>Nama</th>
                                            <th>Action</th>
                                        </tr>
                                        @foreach ($rooms->sortBy('code') as $room)
                                        <tr id="room_{{ $room->id }}">
                                            <td>
                                                {{ $room->code }}
                                            </td>
                                            <td>
                                                {{ $room->alias }}
                                            </td>
                                            <td colspan="2">
                                                <a href="{{ action('RoomController@edit', $room->id) }}"
                                                    class="btn btn-warning">Edit</a>
                                                <a id="deleteRoom_{{ $room->id }}" data-id="{{$room->id}}"
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
<script type="text/javascript">
    $('#search').on('keyup', function () {
        $value = $(this).val();
        $.ajax({
            type: 'get',
            url: '{{URL::to('
            search ')}}',
            data: {
                'search': $value
            },
            success: function (data) {
                $('tbody').html(data);
            }
        });
    })
</script>


@foreach ($rooms as $room)
<script>
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#deleteRoom_{{ $room->id }}').on('click', function () {
            var roomId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah detail ruangan ini dihapus, data yang terkait akan dihapus!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('dashboard/room')}}" + '/' + roomId,
                            success: function (data) {
                                $("#room_" + roomId).remove();
                                swal("Sukses!", "Data ruaangan telah dihapus.",
                                    "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Data ruaangan gagal dihapus.", "error");
                            }
                        });
                    }
                });
        });
    });
</script>
@endforeach
@endsection