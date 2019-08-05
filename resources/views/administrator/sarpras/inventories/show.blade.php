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

@php
$qrdata = $qrdata = "SRP=".Crypt::encryptString($inventory->id);
@endphp

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <div class="section-header-back">
                <a href="{{ action('SarprasInventoryController@index') }}" class="btn btn-icon"><i
                        class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Data Inventori</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Inventories</a></div>
                <div class="breadcrumb-item"><a href="#">{{ $inventory->name }}</a></div>
            </div>
        </div>
        <div class="section-body">

            <div class="row">
                <div class="col-12">
                    <div class="card author-box card-primary">
                        <div class="card-body">
                            <div class="author-box-left">
                                <img alt="image" src="{{ url('uploads/sarprasInventoryImage/'.$inventory->image) }}"
                                    class="rounded-circle author-box-picture">
                                <div class="clearfix"></div>
                            </div>
                            <div class="author-box-details">
                                <div class="author-box-name">
                                    <a href="#">{{ $inventory->name }}</a>
                                </div>
                                <div class="author-box-job">
                                    {{ $inventory->code }}
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
                                                    ID
                                                </td>
                                                <td>
                                                    {{ $inventory->id }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Nama
                                                </td>
                                                <td>
                                                    {{ $inventory->name }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Status
                                                </td>
                                                <td>
                                                    @if ($inventory->status == "Tersedia")
                                                    <div class="badge badge-success">Tersedia</div>
                                                    @else
                                                    <div class="badge badge-warning">Dipinjam</div>
                                                    @endif
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="w-100 d-sm-none"></div>
                                <div class="float-right mt-sm-0 mt-3">
                                    <a href="{{ action('SarprasInventoryController@edit', $inventory->id) }}"
                                        class="btn">Edit
                                        Data <i class="fas fa-chevron-right"></i></a>
                                </div>
                                @if ($inventory->status == "Tersedia")
                                {!! Qr::size(300)->generate("$qrdata"); !!},
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection