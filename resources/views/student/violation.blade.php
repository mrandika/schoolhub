@extends('layouts.dashboard')

@section('title')
Violation &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('StudentController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('StudentController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('reportActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Pelanggaran</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Pelanggaran</a></div>
            </div>
        </div>
        <div class="section-body">
            <div class="card mb-4">
                <div class="card-body">
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">All <span
                                    class="badge badge-white">{{ $counts }}</span></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="alert alert-warning alert-has-icon">
                <div class="alert-icon"><i class="far fa-lightbulb"></i></div>
                <div class="alert-body">
                    <div class="alert-title">Total Poin</div>
                    <h4><u>{{ $sum }}</u> Poin Pelanggaran.</h4>
                </div>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Melanggar</th>
                        <th scope="col">Score</th>
                        <th scope="col">Dilaporkan Pada</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($violations->sortByDesc('id') as $violation)
                    <tr>
                        <th scope="row" width="15%">{{ $violation->id }}</th>
                        <td>{{ $violation->violation }}</td>
                        <td>{{ $violation->violation_score }}</td>
                        <td>{{ \Carbon\Carbon::parse($violation->created_at)->format('l, d M Y') }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </section>
</div>
@endsection