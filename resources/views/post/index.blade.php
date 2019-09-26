@extends('layouts.dashboard')

@section('title')
Blog Post &mdash; SchoolHUB
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

@section('postActive')
active
@endsection

@section('content')
<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <div class="section-header">
            <h1>Postingan</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Post</a></div>
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
                                            class="badge badge-white">{{ $count }}</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card">

                        <div class="card-header">
                            <div class="float-left">
                                <a href="{{ action('PostController@create') }}" class="btn btn-primary"><i
                                        class="fas fa-plus"></i> Add</a>
                            </div>
                        </div>

                        <div class="clearfix mb-3"></div>

                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tr>
                                    <th>Title</th>
                                    <th>Category</th>
                                    <th>Author</th>
                                    <th>Created At</th>
                                    <th>Status</th>
                                </tr>
                                @foreach ($posts as $post)
                                <tr id="postId_{{$post->id}}">
                                    <td>{{$post->title}}
                                        <div class="table-links">

                                            <a href="{{action('PostController@show', $post->id)}}">View</a>
                                            <div class="bullet"></div>
                                            <a href="{{action('PostController@edit', $post->id)}}">Edit</a>
                                            <div class="bullet"></div>
                                            <a id="deletePost" data-id="{{$post->id}}" href='javascript:void(0)'
                                                class="text-danger">Remove</a>
                                        </div>
                                    </td>
                                    <td>
                                        <a href="#">{{\App\BlogCategory::where('id',
                                                    $post->id_categories)->first()->name}}</a>
                                    </td>
                                    <td>
                                        <a href="#">
                                            <img alt="image" src="{{asset('image/profile.jpg')}}" class="rounded-circle"
                                                width="35" data-toggle="title" title="">
                                            <div class="d-inline-block ml-1">
                                                {{ \App\UserData::select('name')->where('id_user', $post->id_user)->first()->name }}
                                            </div>
                                        </a>
                                    </td>
                                    <td>{{\Carbon\Carbon::parse($post->created_at)->format('d M Y')}}</td>
                                    <td>
                                        <div class="badge badge-primary">Published</div>
                                    </td>
                                </tr>
                                @endforeach
                            </table>
                        </div>
                        {{ $posts->links() }}
                    </div>
                </div>
            </div>
        </div>
</div>
@endsection