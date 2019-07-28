<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Response;

use App\StudentClass;
use App\ViewTeacher;

class ClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $count = StudentClass::count();
        $class = StudentClass::paginate(10);
        return view('class/index')
        ->withCounts($count)
        ->withClasses($class);  
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $teacher = ViewTeacher::all();
        return view('class/create')
        ->withTeachers($teacher);
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
            'name' => 'required|unique:class|max:100',
            'id_teacher' => 'required|unique:class|max:20',
        ]);

        $multiple = $request->has('multiple');

        $class = new StudentClass;
        $class->name = $request->post('name');
        $class->id_teacher = $request->post('id_teacher');
        $class->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('admin/class');
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
        $teacher = ViewTeacher::all();
        $class = StudentClass::find($id);
        return view('class/update')
        ->withTeachers($teacher)
        ->withClass($class);
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
            'name' => 'required|unique:class|max:100',
            'id_teacher' => 'required|max:20',
        ]);

        $class = StudentClass::find($id);
        $class->name = $request->post('name');
        $class->id_teacher = $request->post('id_teacher');
        $class->save();

        return redirect('admin/class');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $class = StudentClass::find($id);
        $class->delete();
        return Response::json($class);
    }
}
