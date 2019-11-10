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
            <div class="section-header-back">
                <a href="{{ action('KantinSellerController@index') }}" class="btn btn-icon"><i
                        class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Data Penjual</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Seller</a></div>
            </div>
        </div>
        <div class="section-body">

            <div class="row">
                <div class="col-12">
                    <div class="card author-box card-primary">
                        <div class="card-body">
                            <div class="author-box-left">
                                <img alt="image" src="{{url('uploads/userImage/'.$user->image)}}"
                                    class="rounded-circle author-box-picture">
                                <div class="clearfix"></div>
                            </div>
                            <div class="author-box-details">
                                <div class="author-box-name">
                                    <a href="#">{{ $data->name }}</a>
                                </div>
                                <div class="author-box-job">
                                    @isset($shop)
                                    {{ $shop->name }}
                                    @endisset
                                </div>
                                <div class="author-box-description">
                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <th>Field</th>
                                                <th>Data</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Nama
                                                </td>
                                                <td>
                                                    {{ $data->name }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Jenis Kelamin
                                                </td>
                                                <td>
                                                    {{ $data->gender }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Agama
                                                </td>
                                                <td>
                                                    {{ $data->religion }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Tempat, tanggal lahir
                                                </td>
                                                <td>
                                                    {{ $data->birthplace }}, {{ $data->dob }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Alamat
                                                </td>
                                                <td>
                                                    {{ $data->address }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Telepon
                                                </td>
                                                <td>
                                                    {{ $data->phone }}
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="w-100 d-sm-none"></div>
                                <div class="float-right mt-sm-0 mt-3">
                                    <a href="{{ action('KantinSellerController@edit', $user->id) }}" class="btn">Edit
                                        Akun <i class="fas fa-chevron-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                @isset($inventories)
                @foreach ($inventories as $inventory)
                <div class="col-12 col-md-4 col-lg-4">
                    <article class="article article-style-c">
                        <div class="article-header">
                            <img class="article-image" src="{{url('uploads/kantinInventoryImage/'.$inventory->image)}}">
                        </img>
                        </div>
                        <div class="article-details">
                            <div class="article-category"><a href="#">{{ $inventory->name }}</a>
                            </div>
                            <div class="article-title">
                                <h2><a href="#">{{ $inventory->name }}</a></h2>
                            </div>
                            <p>Rp. {{ $inventory->price }} </p>
                            {!! Qr::size(150)->generate("KTN=".Crypt::encryptString($inventory->id)); !!}
                        </div>
                    </article>
                </div>
                @endforeach
                @endisset
            </div>
        </div>
    </section>
</div>
@endsection