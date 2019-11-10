@extends('layouts.dashboard')

@section('title')
Grading &mdash; SchoolHUB
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

@section('gradingActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content" style="min-height: 922px;">
    <section class="section">
        <div class="section-header">
            <h1>Penilaian</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Penilaian</a></div>
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
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Mata Pelajaran</th>
                        <th scope="col">Bab</th>
                        <th scope="col">Nama Bab</th>
                        <th scope="col">KKM</th>
                        <th scope="col">Nilai</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($grades->sortByDesc('id') as $grade)
                    <tr>
                        <th scope="row" width="15%">{{ $grade->id }}</th>
                        <td>{{ $grade->subject }}</td>
                        <td>{{ $grade->section }}</td>
                        <td>{{ $grade->section_name }}</td>
                        <td>{{ $grade->minimum }}</td>
                        <td @if ($grade->score < $grade->minimum)
                            class="text-danger"
                        @endif
                        
                        @if ($grade->score == $grade->minimum)
                        class="text-warning"
                        @endif
                        
                        @if ($grade->score > $grade->minimum)
                        class="text-info"
                        @endif>{{ $grade->score }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </section>
</div>
@endsection