<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Response;

use App\Subject;

class SubjectController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('administrator');
        // $this->middleware('admin.kurikulum');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $count = Subject::count();
        $subject = Subject::all();
        return view('subject/index')
        ->withCounts($count)
        ->withSubjects($subject);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('subject/create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'code' => 'required',
            'name' => 'required',
            'type' => 'required',
            'minimum' => 'required',
        ]);
        
        $multiple = $request->has('multiple');

        $subject = new Subject;
        $subject->code = $request->post('code');
        $subject->name = $request->post('name');
        $subject->type = $request->post('type');
        $subject->minimum = $request->post('minimum');
        $subject->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('dashboard/subject');
        } 
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $subject = Subject::find($id);
        return view('subject/update')
        ->withSubject($subject);
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
        $validatedData = $request->validate([
            'code' => 'required',
            'name' => 'required',
            'type' => 'required',
            'minimum' => 'required',
        ]);
        
        $multiple = $request->has('multiple');

        $subject = Subject::find($id);
        $subject->code = $request->post('code');
        $subject->name = $request->post('name');
        $subject->type = $request->post('type');
        $subject->minimum = $request->post('minimum');
        $subject->save();

        return redirect('dashboard/subject');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $subject = Subject::find($id);
        $subject->delete();
        return Response::json($subject);
    }
}
