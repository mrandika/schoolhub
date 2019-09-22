<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Response;

use App\TeachingData;
use App\Subject;
use App\StudentClass;
use App\Room;
use App\ViewTeachingData;
use App\ViewTeacher;

class TeachingController extends Controller
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
        // $this->middleware('teacher')->only('show');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $count = ViewTeachingData::count();
        $teachings = ViewTeachingData::all();
        return view('teaching/index')
        ->withCounts($count)
        ->withTeachings($teachings);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $teacher = ViewTeacher::all();
        $subject = Subject::all();
        $class = StudentClass::all();
        $room = Room::all();
        return view('teaching/create')
        ->withTeachers($teacher)
        ->withSubjects($subject)
        ->withClasses($class)
        ->withRooms($room);
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
            'id_teacher' => 'required',
            'id_subject' => 'required',
            'id_class' => 'required',
            'id_room' => 'required',
            'day' => 'required',
            'time_in' => 'required',
            'time_out' => 'required',
        ]);

        $multiple = $request->has('multiple');

        $teaching = new TeachingData;
        $teaching->id_teacher = $request->post('id_teacher');
        $teaching->id_subject = $request->post('id_subject');
        $teaching->id_class = $request->post('id_class');
        $teaching->id_room = $request->post('id_room');
        $teaching->day = $request->post('day');
        $teaching->time_in = $request->post('time_in');
        $teaching->time_out = $request->post('time_out');
        $teaching->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('dashboard/teaching');
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
        $subject = Subject::all();
        $class = StudentClass::all();
        $room = Room::all();
        $teaching = TeachingData::find($id);
        return view('teaching/update')
        ->withTeachers($teacher)
        ->withSubjects($subject)
        ->withClasses($class)
        ->withRooms($room)
        ->withTeaching($teaching);
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
            'id_teacher' => 'required',
            'id_subject' => 'required',
            'id_class' => 'required',
            'id_room' => 'required',
            'day' => 'required',
            'time_in' => 'required',
            'time_out' => 'required',
        ]);

        $teaching = TeachingData::find($id);
        $teaching->id_teacher = $request->post('id_teacher');
        $teaching->id_subject = $request->post('id_subject');
        $teaching->id_class = $request->post('id_class');
        $teaching->id_room = $request->post('id_room');
        $teaching->day = $request->post('day');
        $teaching->time_in = $request->post('time_in');
        $teaching->time_out = $request->post('time_out');
        $teaching->save();

        return redirect('dashboard/teaching');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $teaching = TeachingData::find($id);
        $teaching->delete();
        return Response::json($teaching);
    }
}
