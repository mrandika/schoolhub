@extends('layouts.dashboard')

@section('title')
Create Post &mdash; Blog
@endsection

@section('sidebarNavigation')
<div class="sidebar-brand">
    <a href="{{action('PostController@index')}}">My Hub</a>
</div>
<div class="sidebar-brand sidebar-brand-sm">
    <a href="{{action('PostController@index')}}">H</a>
</div>
@endsection

@extends('layouts.super-dashboard-navlist')

@section('css')
<link rel="stylesheet" href="{{asset('modules/summernote/summernote-bs4.css')}}">
<link rel="stylesheet" href="{{asset('modules/select2/dist/css/select2.min.css') }}">
@endsection

@section('postActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <div class="section-header">
            <div class="section-header-back">
                <a href="{{action('PostController@index')}}" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Buat Post Baru</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item">Dashboard</a></div>
                <div class="breadcrumb-item">Post</div>
            </div>
        </div>

        <div class="section-body">
            <h2 class="section-title">Buat Post Baru</h2>

            <form method="POST" action="{{action('PostController@store')}}" enctype="multipart/form-data">
                @csrf
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Write Your Post</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Title</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" class="form-control" name="title">
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label
                                        class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Headline</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" class="form-control" name="headline">
                                        <p>Tell us a bit about your post.</p>
                                    </div>
                                </div>
                                {{-- <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Tags</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control select2" required>
                                            @foreach ($tags as $tag)
                                            <option value="{{ $tag->id }}">{{ $tag->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div> --}}
                                <div class="form-group row mb-4">
                                    <label
                                        class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Category</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="id_categories">
                                            @foreach ($categories as $category)
                                            <option value="{{$category->id}}">{{$category->name}}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Content</label>
                                    <div class="col-sm-12 col-md-7">
                                        <textarea class="summernote" name="content"></textarea>
                                    </div>
                                </div>
                                {{-- <div class="form-group row mb-4">
                                    <label
                                        class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Thumbnail</label>
                                    <div class="col-sm-12 col-md-7">
                                        <div id="image-preview" class="image-preview">
                                            <label for="image-upload" id="image-label">Choose File</label>
                                            <input type="file" name="featuredImage" id="image-upload" />
                                        </div>
                                    </div>
                                </div> --}}
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <button class="btn btn-primary">Create Post</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
</div>
@endsection

@section('scripts')
<script src="{{asset('modules/summernote/summernote-bs4.js')}}"></script>
<script src="{{asset('modules/jquery-selectric/jquery.selectric.min.js')}}"></script>
<script src="{{asset('modules/upload-preview/assets/js/jquery.uploadPreview.min.js')}}"></script>
<script src="{{asset('modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js')}}"></script>
<script src="{{asset('js/dashboard/page/features-post-create.js')}}"></script>
<script src="{{asset('modules/select2/dist/js/select2.full.min.js') }}"></script>
@endsection
