@extends('layouts.dashboard-today')

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('AdminController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('AdminController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('presenceActive')
active
@endsection

@section('title')
Presensi &mdash; SchoolHUB
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Presensi</h1>
        </div>

        <div class="section-body">
            @if ($count)
            <div class="alert alert-primary alert-has-icon">
                <div class="alert-icon"><i class="far fa-lightbulb"></i></div>
                <div class="alert-body">
                    <div class="alert-title">Sudah absen!</div>
                    Kamu absen {{ \Carbon\Carbon::parse($attendances->created_at)->diffForHumans() }}
                </div>
            </div>
            @else
            <div class="alert alert-danger alert-has-icon">
                <div class="alert-icon"><i class="far fa-exclamation-triangle"></i></div>
                <div class="alert-body">
                    <div class="alert-title">Kamu belum absen!</div>
                    Buka aplikasi SchoolHub dan arahkan ke Kode QR.
                </div>
            </div>
            @endif

            <div class="card">
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Tanggal</th>
                                <th scope="col">Kehadiran</th>
                                <th scope="col">Jam Presensi</th>
                                <th scope="col">Jam Pulang</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($history->sortByDesc('id') as $item)
                            <tr>
                                <th scope="row">{{ \Carbon\Carbon::parse($item->created_at)->format('l, d F Y') }}
                                </th>
                                <td>{{ $item->status }}</td>
                                <td>{{ \Carbon\Carbon::parse($item->created_at)->format('H:i') }}</td>
                                <td>{{ \Carbon\Carbon::parse($item->updated_at)->format('H:i') }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection