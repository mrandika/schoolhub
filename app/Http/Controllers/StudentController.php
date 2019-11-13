<?php

namespace App\Http\Controllers;

use App\Student;
use App\StudentClass;
use App\StudentGrade;
use App\TestQuestion;
use App\TestQuestionItem;
use App\TestSession;
use App\TestToken;
use App\User;
use App\UserData;
use App\ViewClass;
use App\ViewKesiswaanReport;
use App\ViewStudent;
use App\ViewStudentGrade;
use Auth;
use File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;
use Response;
use Storage;
use App\Exports\SiswaGradeExport;
use Maatwebsite\Excel\Facades\Excel;

class StudentController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('administrator');
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

        $id = User::count() + 1;
        $role = 7;
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

    public function grading()
    {
        $grade = ViewStudentGrade::where('id_students', Auth::id());
        $count = $grade->count();

        return view('student/grade')->with([
            'counts' => $count,
            'grades' => $grade->get(),
        ]);
    }

    public function violation()
    {
        $violation = ViewKesiswaanReport::where('id_student', Auth::id());
        $sum = $violation->sum('violation_score');
        $count = $violation->count();

        return view('student/violation')->with([
            'counts' => $count,
            'sum' => $sum,
            'violations' => $violation->get(),
        ]);
    }

    public function show_testing()
    {
        $nisn = Student::where('id_user', Auth::id())->first()->nisn;
        return view('student/test_login')->with([
            'nisn' => $nisn
        ]);
    }

    public function validate_token(Request $request)
    {
        $nisn = $request->post('nisn');
        $token = $request->post('token');

        $isNisnValid = Student::where('nisn', $nisn)->first();

        if ($isNisnValid) {
            $isTokenValid = TestToken::where(['id_student' => $isNisnValid->id_user, 'token' => $nisn."-".$token])->first();

            if ($isTokenValid) {
                $isSessionFinished = TestSession::where([
                    'id_student' => $isNisnValid->id_user,
                    'id_token' => TestToken::where('token', $nisn."-".$token)->first()->id,
                    'is_finished' => 1,
                ])->first();

                if (!$isSessionFinished) {
                    $session = TestSession::where(['id_student' => $isNisnValid->id_user, 'id_token' => $isTokenValid->id])->first();
                    if ($session) {
                        TestSession::updateOrCreate(
                            ['id_student' => $isNisnValid->id_user, 'id_token' => $isTokenValid->id],
                            [
                                'id_student' => $isNisnValid->id_user,
                                'id_token' => $isTokenValid->id,
                                'is_ongoing' => 1,
                                'is_finished' => 0,
                            ]);
                    } else {
                        TestSession::updateOrCreate(
                            ['id_student' => $isNisnValid->id_user, 'id_token' => $isTokenValid->id],
                            [
                                'id_student' => $isNisnValid->id_user,
                                'id_token' => $isTokenValid->id,
                                'score' => 0,
                                'is_ongoing' => 1,
                                'is_finished' => 0,
                            ]);
                    }

                    return redirect(route('student.test', ['token' => Crypt::encryptString($isTokenValid->token)]));
                } else {
                    return view('student/test_login')->with([
                        'nisn' => $nisn,
                        'error' => true,
                        'code' => 403,
                        'message' => 'Sesi anda telah selesai.',
                    ]);
                }

            } else {
                return view('student/test_login')->with([
                    'nisn' => $nisn,
                    'error' => true,
                    'code' => 403,
                    'message' => 'Token tidak valid.',
                ]);
            }
        } else {
            return view('student/test_login')->with([
                'nisn' => $nisn,
                'error' => true,
                'code' => 403,
                'message' => 'NISN tidak ditemukan.',
            ]);
        }
    }

    public function start_test()
    {
        $tokenCrypt = $_GET['token'];
        $token = Crypt::decryptString($tokenCrypt);
        $idUser = Auth::id();

        $isSessionFinished = TestSession::where([
            'id_student' => $idUser,
            'id_token' => TestToken::where('token', $token)->first()->id,
            'is_finished' => 1,
        ])->first();

        if (!$isSessionFinished) {

            $tokenData = TestToken::where('token', $token)->first();
            $question = TestQuestion::where('id', $tokenData->id_question)->first();
            $items = TestQuestionItem::where('id_question', $tokenData->id_question);
            $saved_session = TestSession::where(['id_student' => Auth::id(), 'id_token' => $tokenData->id])->first();

            //dd(json_decode($saved_session->progress, 1));

            $maxGrade = 100;
            $numOfTest = $items->count();
            $scorePerTest = $maxGrade / $numOfTest;

            return view('student/test_page')->with([
                'question' => $question,
                'items' => $items->get(),
                'score' => $scorePerTest,
                'saved' => json_decode($saved_session->progress, 1)['jawaban']
            ]);

        } else {
            return redirect(route('student.grading'));
        }
    }

    public function save_progress(Request $request)
    {
        $tokenCrypt = $_GET['token'];
        $token = Crypt::decryptString($tokenCrypt);
        $idUser = Auth::id();

        $isSessionFinished = TestSession::where([
            'id_student' => $idUser,
            'id_token' => TestToken::where('token', $token)->first()->id,
            'is_finished' => 1,
        ])->first();

        if (!$isSessionFinished) {
            if ($request->ajax()) {

                $tokenData = TestToken::where('token', $token)->first();
                $items = TestQuestionItem::where('id_question', $tokenData->id_question);

                $json = array();
                $json['jawaban'] = array();

                for ($i = 1; $i <= intval($items->count()); $i++) {
                    $json['jawaban'][$i] = $request->post("jawaban_$i");
                }

                $maxGrade = 100;
                $numOfTest = $items->count();
                $scorePerTest = $maxGrade / $numOfTest;
                $finalScore = 0;

                $answers = $json['jawaban'];

                $isCorrect = $items->get();

                foreach ($answers as $key => $answer) {
                    if ($answer == $isCorrect[$key - 1]->is_correct) {
                        $finalScore += $scorePerTest;
                    };
                }

                TestSession::updateOrCreate(
                    ['id_student' => $idUser, 'id_token' => $tokenData->id],
                    [
                        'id_student' => $idUser,
                        'id_token' => $tokenData->id,
                        'progress' => json_encode($json),
                        'score' => $finalScore,
                        'is_ongoing' => 1,
                        'is_finished' => 0,
                    ]);

                return response()->json([
                    'code' => 200,
                    'message' => 'Answer saved.',
                ]);
            }
        } else {
            return response()->json(['error' => 'Invalid Session.'], 403);
        }
    }

    public function finish_test(Request $request)
    {
        $tokenCrypt = $_GET['token'];
        $token = Crypt::decryptString($tokenCrypt);
        $idUser = Auth::id();

        $isSessionFinished = TestSession::where([
            'id_student' => $idUser,
            'id_token' => TestToken::where('token', $token)->first()->id,
            'is_finished' => 1,
        ])->first();

        if (!$isSessionFinished) {

            $tokenData = TestToken::where('token', $token)->first();
            $items = TestQuestionItem::where('id_question', $tokenData->id_question);

            $json = array();
            $json['jawaban'] = array();

            for ($i = 1; $i <= intval($items->count()); $i++) {
                $json['jawaban'][$i] = $request->post("jawaban_$i");
            }

            $maxGrade = 100;
            $numOfTest = $items->count();
            $scorePerTest = $maxGrade / $numOfTest;
            $finalScore = 0;

            $answers = $json['jawaban'];

            $isCorrect = $items->get();

            foreach ($answers as $key => $answer) {
                if ($answer == $isCorrect[$key - 1]->is_correct) {
                    $finalScore += $scorePerTest;
                };
            }

            TestSession::updateOrCreate(['id_student' => $idUser, 'id_token' => $tokenData->id], [
                'id_student' => $idUser,
                'id_token' => $tokenData->id,
                'progress' => json_encode($json),
                'score' => $finalScore,
                'is_ongoing' => 0,
                'is_finished' => 1,
            ]);

            $question = TestQuestion::where('id', $tokenData->id_question)->first();

            $grade = StudentGrade::create([
                'id_teaching' => $question->id_teaching,
                'id_students' => $idUser,
                'section' => $question->section,
                'section_name' => $question->section_name,
                'score' => $finalScore,
            ]);
            return redirect(route('student.grading', ['id' => $grade->id]));
        } else {
            return redirect(route('student.grading'));
        }
    }

    public function export_excel_grade()
    {
        $studentName = UserData::where('id_user', Auth::id())->first()->name;
        return Excel::download(new SiswaGradeExport, '[GRADE] '.$studentName.'.xlsx');
    }
}
