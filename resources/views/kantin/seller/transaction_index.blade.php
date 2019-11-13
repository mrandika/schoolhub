@extends('layouts.dashboard')

@section('title')
Transaction History &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('HomeController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('HomeController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('historyActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Riwayat Penjualan</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Kantin</a></div>
                <div class="breadcrumb-item"><a href="#">Riwayat Penjualan</a></div>
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

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>Pembeli</th>
                                            <th>Membeli</th>
                                            <th>Sebanyak</th>
                                            <th>Total</th>
                                        </tr>
                                        @foreach ($payments as $payment)
                                        <tr>
                                        <td>{{ $payment->customer }}</td>
                                        <td>{{ $payment->item }}</td>
                                        <td>{{ $payment->qty }}</td>
                                        <td>{{ $payment->total }}</td>
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