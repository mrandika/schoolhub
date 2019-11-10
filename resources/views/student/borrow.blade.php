@extends('layouts.dashboard')

@section('title')
Borrower &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('SarprasBorrowerController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('SarprasBorrowerController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('borrowDataActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Sarpras &mdash; Peminjam</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Sarpras</a></div>
                <div class="breadcrumb-item"><a href="#">Peminjam</a></div>
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
                                    <a class="nav-link active" href="#">Dikembalikan <span
                                            class="badge badge-white">{{ $available }}</span></a>
                                </li>
                                <li class="nav-item ml-3">
                                    <a class="nav-link active" href="#">Belum Dikembalikan <span
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
                                <a href="{{ action('SarprasBorrowerController@create') }}" class="btn btn-primary"><i
                                        class="fas fa-plus"></i> Add</a>
                            </div>

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nama Peminjam</th>
                                            <th>Barang Dipinjam</th>
                                            <th>Ruangan</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                        @foreach ($borrowers->sortBy('id') as $borrower)
                                        <tr id="borrower_{{ $borrower->id }}">
                                            <td>
                                                {{ $borrower->id }}
                                            </td>
                                            <td>
                                                {{ $borrower->user }}
                                            </td>
                                            <td>
                                                {{ $borrower->item }}
                                            </td>
                                            <td>
                                                {{ $borrower->room }}
                                            </td>
                                            <td>
                                                @if ($borrower->status == "Dikembalikan")
                                                <div class="badge badge-success">Dikembalikan</div>
                                                @else
                                                <div class="badge badge-warning">Belum Dikembalikan</div>
                                                @endif
                                            </td>
                                            <td>
                                                @if ($borrower->status == "Belum Dikembalikan")
                                                <a href="{{ action('SarprasBorrowerController@edit', $borrower->id) }}"
                                                    class="btn btn-warning">Kembalikan</a>
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