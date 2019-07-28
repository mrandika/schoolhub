<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class KesiswaanController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('administrator');
        // $this->middleware('admin.kesiswaan');
    }

    /**
     * Menampilkan laman Today
     * 
     * @return \Illuminate\Http\Response
     */
    public function today()
    {
        return view('administrator/kesiswaan/today');  
    }

    /**
     * Menampilkan data acara
     * 
     * @return \Illuminate\Http\Response
     */
    public function indexEvent()
    {
        return view('administrator/kesiswaan/event/index');  
    }

    /**
     * Menampilkan data pelanggaran
     * 
     * @return \Illuminate\Http\Response
     */
    public function indexViolation()
    {
        return view('administrator/kesiswaan/violation/index');  
    }

    /**
     * Menampilkan data pelanggar
     * 
     * @return \Illuminate\Http\Response
     */
    public function violationData()
    {
        return view('administrator/kesiswaan/violation/data');  
    }
}
