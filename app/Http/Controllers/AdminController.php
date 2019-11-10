<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AdminController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('administrator');
    }

    /**
     * Menampilkan laman Today
     * 
     * @return \Illuminate\Http\Response
     */
    public function today()
    {
        return view('administrator/today');  
    }

    /**
     * Menampilkan laman data pengguna
     * 
     * @return \Illuminate\Http\Response
     */
    public function indexUser()
    {
        return view('administrator/user/create');  
    }

    /**
     * Menampilkan laman pembuatan pengguna
     * 
     * @return \Illuminate\Http\Response
     */
    public function createUser()
    {
        return view('administrator/user/create');  
    }

    /**
     * Simpan data pengguna yang telah dibuat
     * 
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function saveUser()
    {
        
    }

    /**
     * Menampilkan laman detail pengguna
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showUser($id)
    {

    }

    /**
     * Menampilkan laman edit data pengguna
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function editUser($id)
    {
        return view('administrator/user/edit');  
    }

    /**
     * Perbarui data pengguna
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateUser(Request $request, $id)
    {

    }

    /**
     * Hapus data pengguna
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroyUser($id)
    {

    }
}
