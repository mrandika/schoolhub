@extends('layouts.dashboard')

@section('title')
Inventories &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('SarprasInventoryController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('SarprasInventoryController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('inventoryActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Sarpras &mdash; Inventories</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Sarpras</a></div>
                <div class="breadcrumb-item"><a href="#">Inventories</a></div>
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
                                <li class="nav-item ml-3">
                                    <a class="nav-link active" href="#">Tersedia <span
                                            class="badge badge-white">{{ $available }}</span></a>
                                </li>
                                <li class="nav-item ml-3">
                                    <a class="nav-link active" href="#">Dipinjam <span
                                            class="badge badge-white">{{ $borrowed }}</span></a>
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
                                <a href="{{ action('SarprasInventoryController@create') }}" class="btn btn-primary"><i
                                        class="fas fa-plus"></i> Add</a>
                            </div>

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>ID</th>
                                            <th>Foto</th>
                                            <th>Nama</th>
                                            <th>Status</th>
                                        </tr>
                                        @foreach ($inventories->sortBy('id') as $inventory)
                                        <tr id="inventory_{{ $inventory->id }}">
                                            <td>
                                                {{ $inventory->id }}
                                            </td>
                                            <td>
                                                <img
                                                    src="{{ url('uploads/sarprasInventoryImage/'.$inventory->image) }}">
                                            </td>
                                            <td>
                                                {{ $inventory->name }}
                                                <div class="table-links">
                                                    <a
                                                        href="{{ action('SarprasInventoryController@show', $inventory->id) }}">View</a>
                                                    <div class="bullet"></div>
                                                    <a
                                                        href="{{ action('SarprasInventoryController@edit', $inventory->id) }}">Edit</a>
                                                    <div class="bullet"></div>
                                                    <a id="deleteInventory_{{ $inventory->id }}"
                                                        data-id="{{$inventory->id}}" href='javascript:void(0)'
                                                        class="text-danger">Delete</a>
                                                </div>
                                            </td>
                                            <td>
                                                @if ($inventory->status == "Tersedia")
                                                <div class="badge badge-success">Tersedia</div>
                                                @else
                                                <div class="badge badge-warning">Dipinjam</div>
                                                @endif
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
@foreach ($inventories as $inventory)
<script>
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#deleteInventory_{{ $inventory->id }}').on('click', function () {
            var inventoryId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah detail barang ini dihapus, data yang terkait akan dihapus!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('dashboard/sarpras/inventory')}}" + '/' + inventoryId,
                            success: function (data) {
                                $("#inventory_" + inventoryId).remove();
                                swal("Sukses!", "Data barang telah dihapus.",
                                    "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Data barang gagal dihapus.", "error");
                            }
                        });
                    }
                });
        });
    });
</script>
@endforeach
@endsection