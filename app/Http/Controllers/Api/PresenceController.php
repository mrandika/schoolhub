<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Crypt;
use JWTAuth;

use App\Attendance;
use App\AttendanceData;

class PresenceController extends Controller
{

    public function __construct()
    {
        $this->middleware('jwt.verify');
    }

    public static function response($code, $message, $data = null)
    {
        if (isset($data)) {
            return response()->json([
                'code' => $code,
                'message' => $message,
                'data' => $data
            ], $code);
        }

        return response()->json([
            'code' => $code,
            'message' => $message,
        ], $code);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $date = date("Y-m-d");
        $attendanceData = AttendanceData::where('created_at', 'like', '%'.$date.'%')->get();
        return $this::response(200, 'success', $attendanceData);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $date = date("Y-m-d");

        $id_attendance = str_replace('PRS=', '', Crypt::decryptString($request->post('id_attendance')));

        $token = JWTAuth::getToken();

        $attendanceData = new AttendanceData;
        $attendanceData->id_students = JWTAuth::toUser($token)->id;
        $attendanceData->id_attendance = $id_attendance;
        $attendanceData->status = $request->post('status');
        $attendanceData->save();

        return $this::response(200, 'success');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $attendance = Attendance::find($id);
        return $this::response(200, 'success', $attendanceData);
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
        $attendanceData = AttendanceData::find($id);
        $attendanceData->status = $request->post('status');
        $attendanceData->save();

        return $this::response(200, 'success');
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

        return $this::response(200, 'success');
    }
}
