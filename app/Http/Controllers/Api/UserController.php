<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;

use App\User;

class UserController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        try {
            if (! $token = JWTAuth::attempt($credentials)) {
                return response()->json([
                    'code' => 400,
                    'message' => 'invalid credentials',
                ], 400);
            }
        } catch (JWTException $e) {
            return response()->json([
                'code' => 400,
                'message' => 'token could not created',
            ], 400);
        }

        return response()->json(compact('token'));
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);

        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }

        $user = User::create([
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'password' => Hash::make($request->get('password')),
        ]);

        $token = JWTAuth::fromUser($user);

        return response()->json(compact('user','token'),201);
    }

    public function getUser()
    {
        try {
            $token = JWTAuth::getToken();
            $user = JWTAuth::toUser($token);
        } catch (TokenExpiredException $e) {
            return response()->json([
                'code' => 419,
                'message' => 'token expired',
            ], 419);
        } catch (TokenInvalidException $e) {
            return response()->json([
                'code' => 404,
                'message' => 'token invalid',
            ], 404);
        } catch (JWTException $e) {
            return response()->json([
                'code' => 400,
                'message' => 'token absent',
            ], 400);
        }

        return response()->json([
            'code' => 200,
            'message' => 'success',
            'data' => [$user]
        ], 200);
    }
}
