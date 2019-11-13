@extends('layouts.dashboard-today')

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('HomeController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('HomeController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('todayActive')
active
@endsection

@section('css')
<link rel="stylesheet" href="{{asset('modules/summernote/summernote-bs4.css')}}">
@endsection

@section('section-content')
<div class="section-body">
<form action="{{ route('today.store') }}" method="post">
    @csrf
    <input type="text" name="heading" class="form-control mb-3" placeholder="Heading" required>
    <input type="text" name="subheading" class="form-control mb-3" placeholder="Sub-Heading" required>
    <div class="card">
        <div class="card-header">
            <h4>Mading Pribadi-ku</h4>
        </div>
        <div class="card-body">
            <textarea class="summernote" name="content"></textarea>
        </div>
        <div class="card-header">
                <button type="submit" class="btn btn-info float-left">Simpan</button>
        </div>
    </div>
</form>
</div>

@endsection

@section('scripts')
<script src="{{asset('modules/summernote/summernote-bs4.js')}}"></script>
@endsection