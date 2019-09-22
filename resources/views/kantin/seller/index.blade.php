@extends('layouts.dashboard')

@section('title')
Seller &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('KantinSellerController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('KantinSellerController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('sellerActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Penjual</h1>
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
                                <a href="{{ action('ClassController@create') }}" class="btn btn-primary"><i
                                        class="fas fa-plus"></i> Add</a>
                            </div> --}}

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>Nama</th>
                                            <th>Nama Warung</th>
                                            <th>Action</th>
                                        </tr>
                                        @foreach ($sellers as $seller)
                                        <tr id="seller_{{ $seller->id }}">
                                            <td>{{ \App\UserData::select('name')->where('id_user', $seller->id)->first()->name }}
                                            </td>
                                            <td>
                                                {{ \App\KantinShop::select('name')->where('id_owner', $seller->id)->first()->name }}
                                            </td>
                                            <td colspan="2">
                                                <a href="{{ action('KantinSellerController@edit', $seller->id) }}"
                                                    class="btn btn-warning">Edit</a>
                                                <a id="deleteSeller_{{ $seller->id }}" data-id="{{$seller->id}}"
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
@foreach ($sellers as $seller)
<script>
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#deleteSeller_{{ $seller->id }}').on('click', function () {
            var sellerId = $(this).data("id");
            swal({
                    title: "Anda yakin?",
                    text: "Setelah data penjual ini dihapus, semua data yang terkait dengan kelas ini (termasuk data warung, riwayat pembelian dan lain-lain) akan terhapus!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((confirm) => {
                    if (confirm) {
                        $.ajax({
                            type: "DELETE",
                            url: "{{ url('dashboard/kantin/seller')}}" + '/' + sellerId,
                            success: function (data) {
                                $("#seller_" + sellerId).remove();
                                swal("Sukses!", "Data penjual telah dihapus.", "success");
                            },
                            error: function (data) {
                                swal("Gagal!", "Data penjual gagal dihapus.", "error");
                            }
                        });
                    }
                });
        });
    });
</script>
@endforeach
@endsection