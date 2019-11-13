<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Student;
use App\StudentClass;
use App\ViewTeachingData;
use JWTAuth;

class TeachingController extends Controller
{
    public static function response($code, $message, $data = null)
    {
        if (isset($data)) {
            return response()->json([
                'code' => $code,
                'message' => $message,
                'data' => $data,
            ], $code);
        }

        return response()->json([
            'code' => $code,
            'message' => $message,
        ], $code);
    }

    public function index()
    {
        $token = JWTAuth::getToken();
        $id_student = JWTAuth::toUser($token)->id;

        $todayDate = date('N', strtotime(date('l')));
        $myClass = Student::where('id_user', $id_student)->first()->id_class;

        $cond = ['day' => $todayDate, 'class' => StudentClass::find($myClass)->name];

        $teachingData = ViewTeachingData::where($cond)->get();

        return $this::response(200, 'success', $teachingData);
    }
}
