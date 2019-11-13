<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\UserTodayPage;

class TodayController extends Controller
{
    public function create()
    {
        return view('today_create');
    }

    public function store(Request $request) 
    {
        $id_user = Auth::id();
        $heading = $request->post('heading');
        $subheading = $request->post('subheading');
        $content = $request->post('content');

        $page = new UserTodayPage;
        $page->id_user = $id_user;
        $page->heading = $heading;
        $page->subheading = $subheading;
        $page->content = $content;
        $page->save();

        return view('today');
    }

    public function edit($id)
    {
        $page = UserTodayPage::find($id);
        return view('today_edit')->with([
            'page' => $page
        ]);
    }

    public function update(Request $request)
    {
        $id_user = Auth::id();
        $heading = $request->post('heading');
        $subheading = $request->post('subheading');
        $content = $request->post('content');

        $page = UserTodayPage::find($id_user);
        $page->id_user = $id_user;
        $page->heading = $heading;
        $page->subheading = $subheading;
        $page->content = $content;
        $page->save();

        return view('today');
    }
}
