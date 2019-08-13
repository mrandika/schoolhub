@extends('layouts.dashboard')

@section('title')
{{ $violation->name }} &mdash; SchoolHUB
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('KesiswaanViolationController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('KesiswaanViolationController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('violationActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>{{ $violation->name }}</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Kesiswaan</a></div>
                <div class="breadcrumb-item"><a href="#">Violation</a></div>
                <div class="breadcrumb-item"><a href="#">{{ $violation->name }}</a></div>
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

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>Pelapor</th>
                                            <th>Terlapor</th>
                                            <th>Melanggar</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                        @foreach ($reports->sortByDesc('id') as $report)
                                        <tr id="report_{{ $report->id }}">
                                            <td>
                                                {{ $report->teacher }}
                                            </td>
                                            <td>
                                                {{ $report->student }}
                                            </td>
                                            <td>
                                                {{ $report->violation }}
                                            </td>
                                            <td>
                                                {{ $report->status }}
                                            </td>
                                            <td colspan="2">
                                                <a id="deleteReport_{{ $report->id }}"
                                                    data-id="{{ $report->id }}" href='javascript:void(0)'
                                                    class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <div class="float-right">
                                <nav>
                                    <ul class="pagination">
                                        {{ $reports->links() }}
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection