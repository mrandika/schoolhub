<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use JWTAuth;

use App\UserData;
use App\ViewTeachingData;
use App\Student;
use App\StudentClass;

class TeachingController extends Controller
{
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

    public function index() 
    {
        $token = JWTAuth::getToken();
        $id_student = JWTAuth::toUser($token)->id;

        $class = Student::where('id_user', $id_student)->first()->id_class;

        $teachingData = ViewTeachingData::where('class', StudentClass::find($class)->name)->get();
        
        return $this::response(200, 'success', $teachingData);
    }
}
