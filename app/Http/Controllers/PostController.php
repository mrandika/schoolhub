<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Auth;

use App\BlogPost;
use App\BlogCategory;
use App\BlogTag;

class PostController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('admin');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $post = BlogPost::paginate(10);
        $count = BlogPost::count();
        return view('post/index')
        ->withPosts($post)
        ->withCount($count);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $tag = BlogTag::where('id_user', Auth::user()->id)->get();
        $category = BlogCategory::where('id_user', Auth::user()->id)->get();
        return view('post/create')
        ->withTags($tag)
        ->withCategories($category);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $post = new BlogPost;
        $post->id_categories = $request->post('id_categories');
        $post->id_user = Auth::user()->id;
        $post->has_meta = 0;
        $post->title = $request->post('title');
        $post->headline = $request->post('headline');
        $post->content = $request->post('content');
        $post->save();

        return redirect('dashboard/blog/posts');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $post = BlogPost::find($id);
        return view('post/show')
        ->withPost($post);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
