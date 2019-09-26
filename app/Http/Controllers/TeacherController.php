<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Storage, File, Response;
use DataTables;

use App\Teacher;
use App\ViewTeacher;

use App\User;
use App\UserData;

class TeacherController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('administrator');
        // $this->middleware('admin.kurikulum');
        // $this->middleware('teacher')->only('show');
    }

    /**
     * Menampilkan laman Today
     * 
     * @return \Illuminate\Http\Response
     */
    public function today()
    {
        return view('teacher/today');  
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $teachersCount = ViewTeacher::count();
        $teachers = ViewTeacher::all();
        if ($request->ajax()) {
            return Datatables::of($teachers)
                    ->addIndexColumn()
                    ->make(true);
        }
        return view('teacher/index')
        ->withCounts($teachersCount)
        ->withTeachers($teachers);  
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('teacher/create'); 
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'email' => 'required|unique:users|max:100',
            'username' => 'required|unique:users',
            'nip' => 'required|unique:teachers',
            'password' => 'required',
            'name' => 'required',
            'gender' => 'required',
            'religion' => 'required',
            'birthplace' => 'required',
            'dob' => 'required',
            'address' => 'required',
            'phone' => 'required|unique:users_data',
        ]);

        $id = User::count()+1;
        $role = 6;
        $balance = 0;
        $password = Hash::make($request->get('password'));

        $multiple = $request->has('multiple');

        $image = $request->file('image');
        $imageExtension = $image->getClientOriginalExtension();
        $imageName = $id."_".$request->post('name').'.'.$imageExtension;
        Storage::disk('public_userImage')->put($imageName,  File::get($image));

        $user = new User;
        $user->id = $id;
        $user->image = $imageName;
        $user->email = $request->post('email');
        $user->username = $request->post('username');
        $user->password = $password;
        $user->balance = $balance;
        $user->role = $role;
        $user->save();

        $userData = new UserData;
        $userData->id_user = $id;
        $userData->name = $request->post('name');
        $userData->gender = $request->post('gender');
        $userData->religion = $request->post('religion');
        $userData->birthplace = $request->post('birthplace');
        $userData->dob = $request->post('dob');
        $userData->address = $request->post('address');
        $userData->phone = $request->post('phone');
        $userData->save();

        $teachers = new Teacher;
        $teachers->id_user = $id;
        $teachers->nip = $request->post('nip');
        $teachers->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('dashboard/teacher');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);
        $userData = UserData::find($id);
        $teacher = Teacher::find($id);
        return view('teacher/show')
        ->withUser($user)
        ->withData($userData)
        ->withTeacher($teacher);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::find($id);
        $userData = UserData::find($id);
        $teacher = Teacher::find($id);
        return view('teacher/update')
        ->withUser($user)
        ->withData($userData)
        ->withTeacher($teacher);
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
        $validatedData = $request->validate([
            'image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'email' => 'required|unique:users|max:100',
            'username' => 'required|unique:users',
            'nip' => 'required|unique:teachers',
            'password' => 'required',
            'name' => 'required',
            'gender' => 'required',
            'religion' => 'required',
            'birthplace' => 'required',
            'dob' => 'required',
            'address' => 'required',
            'phone' => 'required|unique:users_data',
        ]);

        if ($request->post('password') != null) {
            $password = Hash::make($request->get('password'));
        }

        $user = User::find($id);
        if ($request->post('image') != null) {
            Storage::disk('public_userImage')->delete($user->image);
            $image = $request->file('image');
            $imageExtension = $image->getClientOriginalExtension();
            $imageName = $id."_".$request->post('name').'.'.$imageExtension;
            Storage::disk('public_userImage')->put($imageName,  File::get($image));
            $user->image = $imageName;
        }
        $user->email = $request->post('email');
        $user->username = $request->post('username');
        if ($request->post('password') != null) {
            $user->password = $password;
        }
        $user->save();

        $userData = UserData::find($id);
        $userData->id_user = $id;
        $userData->name = $request->post('name');
        $userData->gender = $request->post('gender');
        $userData->religion = $request->post('religion');
        $userData->birthplace = $request->post('birthplace');
        $userData->dob = $request->post('dob');
        $userData->address = $request->post('address');
        $userData->phone = $request->post('phone');
        $userData->save();

        $teachers = Teacher::find($id);
        $teachers->nip = $request->post('nip');
        $teachers->save();

        return redirect('dashboard/teacher');
    }

    /**
     * Search the specified resource from storage.
     * 
     * @param  \Illuminate\Http\Request  $request
     */
    public function search(Request $request)
    {
        if ($request->ajax()) {
            $output = "";

            $teachers = UserData::where('name','LIKE','%'.$request->search."%")->get();

            if ($teachers) {
                foreach ($teachers as $key => $teacher) {
                    $output.='<tr id="teacher_".$teacher->id_user>'.
                    '<td>'.$teacher->image.'</td>'.
                    '<td>'.$teacher->name.'</td>'.
                    '<td>'.$teacher->nip.'</td>'.
                    '</tr>';
                }
                return Response($output);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::find($id);
        $userdata = UserData::find($id);
        $teacher = Teacher::find($id);
        if ($user->image != null) {
            Storage::disk('public_userImage')->delete($user->image);
        }
        $teacher->delete();
        $userdata->delete();
        $user->delete();
        return Response::json($user);
    }
}
