<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $role = Auth::user()->role;
        if ($role == 1) {
            /**
             * Is an administrator 
            */
            return view('administrator/today');
        } else if ($role == 2) {
            /**
             * Is an kesiswaan admin 
            */
            return view('kesiswaan/today');
        }  else if ($role == 3) {
            /**
             * Is an kurikulum admin 
            */
            return view('kantin/today');
        } else if ($role == 4) {
            /**
             * Is an sarpras admin 
            */
            return view('sarpras/today');
        } else if ($role == 5) {
            /**
             * Is an kantin admin 
            */
            return view('kantin/today');
        } else if ($role == 6) {
            /**
             * Is an guru
            */
            return view('guru/today');
        } else if ($role == 7) {
            /**
             * Is an siswa
            */
            return view('siswa/today');
        }
    }
}
