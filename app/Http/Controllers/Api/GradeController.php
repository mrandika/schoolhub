<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use JWTAuth;

use App\UserData;
use App\ViewStudentGrade;

class GradeController extends Controller
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
        $id_user = JWTAuth::toUser($token)->id;

        $grade = ViewStudentGrade::where('students', UserData::find($id_user)->name)->get();

        return $this::response(200, 'success', $grade);
    }
}
