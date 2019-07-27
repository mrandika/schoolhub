<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SarprasController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('administrator');
        $this->middleware('admin.sarpras');
    }

    /**
     * Menampilkan laman Today
     * 
     * @return \Illuminate\Http\Response
     */
    public function today()
    {
        return view('administrator/sarpras/today');  
    }

    /**
     * Menampilkan data peminjam
     * 
     * @return \Illuminate\Http\Response
     */
    public function borrowData()
    {
        return view('administrator/sarpras/inventories/borrow/index');  
    }
}
