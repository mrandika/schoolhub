<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use JWTAuth;

use App\AttendanceData;

use App\User;

class TodayController extends Controller
{
    public function __construct()
    {
        $this->middleware('jwt.verify');
    }
    
    public function index()
    {
        $token = JWTAuth::getToken();
        $user = JWTAuth::toUser($token);

        $isPresenced = 0;

        $date = date("Y-m-d");
        $attendanceData = AttendanceData::where('created_at', 'like', '%'.$date.'%')->where('id_students', $user->id)->first();

        if ($attendanceData) {
            $isPresenced = 1;
        }

        $balance = User::find($user->id)->balance;

        $data = array();
        $data['id_user'] = $user->id;
        $data['is_presenced'] = $isPresenced;
        $data['balance'] = $balance;

        return response()->json([
            'code' => 200,
            'message' => 'success',
            'data' => [$data]
        ]);
    }
}
