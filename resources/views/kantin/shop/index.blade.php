@extends('layouts.dashboard')

@section('title')
Shop &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('KantinShopController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('KantinShopController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('shopActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <div class="section-header">
            <h1>Warung</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Kantin</a></div>
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
                            {{-- <div class="float-left">
                                <a href="{{ action('SarprasInventoryController@create') }}" class="btn btn-primary"><i
                                        class="fas fa-plus"></i> Add</a>
                            </div> --}}

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>Foto</th>
                                            <th>Nama</th>
                                            <th>Pemilik</th>
                                        </tr>
                                        @foreach ($shops as $shop)
                                        <tr id="shop_{{ $shop->id }}">
                                            <td>
                                                <img
                                                    src="{{ url('uploads/kantinShopImage/'.$shop->image) }}">
                                            </td>
                                            <td>
                                                {{ $shop->name }}
                                                <div class="table-links">
                                                    <a
                                                        href="{{ action('KantinShopController@show', $shop->id) }}">Edit</a>
                                                    <div class="bullet"></div>
                                                    <a id="deleteShop_{{ $shop->id }}"
                                                        data-id="{{$shop->id}}" href='javascript:void(0)'
                                                        class="text-danger">Delete</a>
                                                </div>
                                            </td>
                                            <td>
                                                {{ \App\UserData::select('name')->where('id_user', $shop->id_owner)->first()->name }}
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
@foreach ($shops as $shop)
<script>
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#deleteShop_{{ $shop->id }}').on('click', function () {
            var shopId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah detail warung ini dihapus, data yang terkait akan dihapus!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('dashboard/kantin/shop')}}" + '/' + shopId,
                            success: function (data) {
                                $("#shop_" + shopId).remove();
                                swal("Sukses!", "Data warung telah dihapus.",
                                    "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Data warung gagal dihapus.", "error");
                            }
                        });
                    }
                });
        });
    });
</script>
@endforeach
@endsection