<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Storage, File, Response;

use App\ViewClass;
use App\ViewStudent;
use App\User;
use App\UserData;
use App\Student;
use App\StudentClass;

class StudentController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('administrator');
        // $this->middleware('student');
    }

    /**
     * Menampilkan laman Today
     * 
     * @return \Illuminate\Http\Response
     */
    public function today()
    {
        return view('student/today');  
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $count = ViewStudent::count();
        $student = ViewStudent::all();
        return view('student/index')
        ->withCounts($count)
        ->withStudents($student);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $class = ViewClass::all();
        return view('student/create')
        ->withClasses($class);  
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
            'nisn' => 'required|unique:students',
            'nipd' => 'required|unique:students',
            'class' => 'required',
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
        $role = 7;
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

        $students = new Student;
        $students->id_user = $id;
        $students->nisn = $request->post('nisn');
        $students->nipd = $request->post('nipd');
        $students->id_class = $request->post('class');
        $students->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('dashboard/student');
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
        $student = Student::find($id);
        return view('student/show')
        ->withUser($user)
        ->withData($userData)
        ->withStudent($student);
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
        $class = StudentClass::all();
        $student = Student::find($id);
        return view('student/update')
        ->withUser($user)
        ->withData($userData)
        ->withClasses($class)
        ->withStudent($student);
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

        $students = Student::find($id);
        $students->nisn = $request->post('nisn');
        $students->nipd = $request->post('nipd');
        $students->id_class = $request->post('class');
        $students->save();

        return redirect('dashboard/student');
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
        $student = Student::find($id);
        if ($user->image != null) {
            Storage::disk('public_userImage')->delete($user->image);
        }
        $student->delete();
        $userdata->delete();
        $user->delete();
        return Response::json($user);
    }
}
