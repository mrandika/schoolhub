<?php

namespace App\Http\Controllers;

use App\Imports\TestQuestionItemImport;
use App\Student;
use App\StudentGrade;
use App\Teacher;
use App\TeachingData;
use App\TestQuestion;
use App\TestToken;
use App\User;
use App\UserData;
use App\ViewStudent;
use App\ViewStudentGrade;
use App\ViewTeacher;
use App\ViewTeachingData;
use App\ViewTestQuestion;
use Auth;
use DataTables;
use Faker\Factory as Faker;
use File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Facades\Excel;
use Response;
use Storage;

class TeacherController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('administrator');
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

        $id = User::count() + 1;
        $role = 6;
        $balance = 0;
        $password = Hash::make($request->get('password'));

        $multiple = $request->has('multiple');

        $image = $request->file('image');
        $imageExtension = $image->getClientOriginalExtension();
        $imageName = $id . "_" . $request->post('name') . '.' . $imageExtension;
        Storage::disk('public_userImage')->put($imageName, File::get($image));

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
            $imageName = $id . "_" . $request->post('name') . '.' . $imageExtension;
            Storage::disk('public_userImage')->put($imageName, File::get($image));
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

            $teachers = UserData::where('name', 'LIKE', '%' . $request->search . "%")->get();

            if ($teachers) {
                foreach ($teachers as $key => $teacher) {
                    $output .= '<tr id="teacher_".$teacher->id_user>' .
                    '<td>' . $teacher->image . '</td>' .
                    '<td>' . $teacher->name . '</td>' .
                    '<td>' . $teacher->nip . '</td>' .
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

    public function index_grade()
    {
        $grade = ViewStudentGrade::where('id_teacher', Auth::id())->get();
        return view('teacher/grade_index')->with([
            'grades' => $grade,
        ]);
    }

    public function create_grade_individual()
    {
        $teaching = ViewTeachingData::where('id_teacher', Auth::id())->get();
        return view('teacher/grade_create_individual')->with([
            'teachings' => $teaching,
        ]);
    }

    public function create_grade_class()
    {
        $teaching = ViewTeachingData::where('id_teacher', Auth::id())->get();
        return view('teacher/grade_create_class')->with([
            'teachings' => $teaching,
        ]);
    }

    public function store_grade_class(Request $request)
    {
        $id_teaching = $request->post('id_teaching');
        $id_class = $request->post('id_class');
        $section = $request->post('section');
        $section_name = $request->post('section_name');
        $grade = $request->post('grade');

        $students = Student::where('id_class', $id_class)->get();

        foreach ($students as $key => $student) {
            if ($grade[$key] != null) {
                $studentGrade = new StudentGrade;
                $studentGrade->id_teaching = $id_teaching;
                $studentGrade->id_students = $student->id_user;
                $studentGrade->section = $section;
                $studentGrade->section_name = $section_name;
                $studentGrade->score = $grade[$key];
                $studentGrade->save();
            }
        }

        return redirect(action('TeacherController@index_grade'));
    }

    public function get_class_student($id)
    {
        $student = ViewStudent::where('id_class', $id)->get();

        return response()->json($student);
    }

    public function destroy_grade($id)
    {
        $grade = StudentGrade::find($id);
        $grade->delete();

        return response()->json($grade);
    }

    public function index_test()
    {
        $id_user = Auth::id();
        $tests = ViewTestQuestion::where('id_teacher', $id_user);

        return view('teacher/test_index')->with([
            'counts' => $tests->count(),
            'tests' => $tests->get(),
        ]);
    }

    public function create_test()
    {
        $faker = Faker::create('id_ID');

        $teaching = ViewTeachingData::where('id_teacher', Auth::id())->get();
        $token = $faker->swiftBicNumber;
        return view('teacher/test_create')->with([
            'teachings' => $teaching,
            'token' => $token,
        ]);
    }

    public function store_test(Request $request)
    {
        $id_teaching = $request->post('id_teaching');
        $section = $request->post('section');
        $section_name = $request->post('section_name');
        $token = $request->post('token');
        $file = $request->file('file');
        $multiple = $request->has('multiple');

        $question = new TestQuestion;
        $question->id_teaching = $id_teaching;
        $question->section = $section;
        $question->section_name = $section_name;
        $question->save();

        $teaching = TeachingData::where('id', $id_teaching)->first();
        $students = Student::where('id_class', $teaching->id_class)->get();

        foreach ($students as $student) {
            $testToken = new TestToken;
            $testToken->id_question = $question->id;
            $testToken->id_student = $student->id_user;
            $testToken->token = $student->nisn . "-" . $token;
            $testToken->save();
        }

        $file_name = "soal-ujian_" . $question->id . ".xlsx";
        $file->move('soal', $file_name);
        Excel::import(new TestQuestionItemImport, public_path('/soal/' . $file_name));

        if ($multiple) {
            return back();
        } else {
            return redirect(route('teacher.index.test'));
        }
    }

    public function edit_test($id)
    {
        $faker = Faker::create('id_ID');

        $question = TestQuestion::find($id);

        if ($_GET['mode'] == 'copy') {
            $token = $faker->swiftBicNumber;
        } else {
            $studentToken = TestToken::where('id_question', $id)->first()->token;
            $token = explode('-', $studentToken)[1];
        }

        return view('teacher/test_edit')->with([
            'question' => $question,
            'token' => $token,
        ]);
    }

    public function update_test(Request $request, $id)
    {
        $mode = $_GET['mode'];

        $id_teaching = $request->post('id_teaching');
        $section = $request->post('section');
        $section_name = $request->post('section_name');
        $token = $request->post('token');
        $file = $request->file('file');

        switch ($mode) {
            case 'copy':
                $id_test = $request->post('_id-test');

                $question = new TestQuestion;
                $question->id_teaching = $id_teaching;
                $question->section = $section;
                $question->section_name = $section_name;
                $question->save();

                $teaching = TeachingData::where('id', $id_teaching)->first();
                $students = Student::where('id_class', $teaching->id_class)->get();

                foreach ($students as $student) {
                    $testToken = new TestToken;
                    $testToken->id_question = $question->id;
                    $testToken->id_student = $student->id_user;
                    $testToken->token = $student->nisn . "-" . $token;
                    $testToken->save();
                }

                $file_name = "soal-ujian_" . $question->id . ".xlsx";
                $file->move('soal', $file_name);
                Excel::import(new TestQuestionItemImport, public_path('/soal/' . $file_name));

                return redirect(route('teacher.index.test'));
                break;

            case 'edit':
                $question = TestQuestion::find($id);
                $question->section = $section;
                $question->section_name = $section_name;
                $question->save();

                return redirect(route('teacher.index.test'));
                break;
        }
    }

    public function destroy_test($id)
    {
        $question = TestQuestion::find($id);
        $question->delete();

        return response()->json($question);
    }
}
