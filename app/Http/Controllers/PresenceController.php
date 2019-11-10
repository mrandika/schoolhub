<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Response, Auth;

use App\Attendance;
use App\AttendanceData;
use App\ViewStudent;

class PresenceController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('administrator');
        // $this->middleware('teacher');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $date = date("Y-m-d");

        if(Auth::user()->role == 7) {
            $attendanceData = AttendanceData::where('created_at', 'like', '%'.$date.'%')->where('id_students', Auth::id());
            $attendanceHistory = AttendanceData::where('id_students', Auth::id())->get();
            $count = $attendanceData->count();
            
            return view('student/presence')
            ->withCount($count)
            ->withAttendances($attendanceData->first())
            ->withHistory($attendanceHistory);
        }

        $attendanceData = AttendanceData::where('created_at', 'like', '%'.$date.'%');
        $count = $attendanceData->count();

        $status = Attendance::select('id')->where('created_at', 'like', '%'.$date.'%')->count();
        return view('attendance-data/index')
        ->withCountsToday($count)
        ->withAttendances($attendanceData->get())
        ->withAvailable($status);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $student = ViewStudent::all();
        return view('attendance-data/create')
        ->withStudents($student);
    }

    /**
     * Show the form for creating a new data.
     *
     * @return \Illuminate\Http\Response
     */
    public function createdata() 
    {
        return view('attendance-data/createdata');
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
            'id_students' => 'required',
            'status' => 'required',
        ]);

        $multiple = $request->has('multiple');

        $date = date("Y-m-d");

        $attendanceData = new AttendanceData;
        $attendanceData->id_students = $request->post('id_students');
        $attendanceData->id_attendance = Attendance::select('id')->where('created_at', 'like', '%'.$date.'%')->first()->id;
        $attendanceData->status = $request->post('status');
        $attendanceData->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('dashboard/presence');
        }
    }

    /**
     * Store a newly created data in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storedata(Request $request)
    {
        $validatedData = $request->validate([
            'uid' => 'required',
            'password' => 'required',
        ]);

        $date = date("Y-m-d");

        $attendance = new Attendance;
        $attendance->uid = $request->post('uid');
        $attendance->password = $request->post('password');
        $attendance->date = $date;
        $attendance->save();

        return redirect('dashboard/presence');
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
     * Display the specified data.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showdata($id)
    {
        $attendance = Attendance::find($id);
        return view('attendance-data/showdata')
        ->withAttendance($attendance);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $student = ViewStudent::all();
        $data = AttendanceData::find($id);
        return view('attendance-data/update')
        ->withData($data)
        ->withStudents($student);
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
            'id_students' => 'required',
            'status' => 'required',
        ]);

        $date = date("Y-m-d");

        $attendanceData = AttendanceData::find($id);
        $attendanceData->id_students = $request->post('id_students');
        $attendanceData->id_attendance = Attendance::select('id')->where('created_at', 'like', '%'.$date.'%')->first()->id;
        $attendanceData->status = $request->post('status');
        $attendanceData->save();

        return redirect('dashboard/presence');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $attendanceData = AttendanceData::find($id);
        $attendanceData->delete();
        return Response::json($attendanceData);
    }
}