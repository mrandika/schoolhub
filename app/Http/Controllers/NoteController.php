<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Response, Auth;

use App\Note;
use App\Student;
use App\StudentClass;

class NoteController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('administrator');
        // $this->middleware('admin.kurikulum');
        // $this->middleware('teacher');
        // $this->middleware('student')->only('show');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(Auth::user()->role == 7) {
            $class = Student::where('id_user', Auth::id());
            $idClass = $class->first()->id_class;
            $count = Note::where('id_class', $idClass)->count();
            $notes = Note::where('id_class', $idClass)->paginate(20);
            return view('note/index')
            ->withCounts($count)
            ->withNotes($notes);
        } else {
            $count = Note::count();
            $notes = Note::paginate(20);
            return view('note/index')
            ->withCounts($count)
            ->withNotes($notes);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $class = StudentClass::all();
        return view('note/create')
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
            'class' => 'required',
            'text' => 'required',
        ]);

        $multiple = $request->has('multiple');

        $note = new Note;
        $note->id_teacher = Auth::user()->id;
        $note->id_class = $request->post('class');
        $note->text = $request->post('text');
        $note->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('dashboard/note');
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
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $class = StudentClass::all();
        $note = Note::find($id);
        return view('note/update')
        ->withClasses($class)
        ->withNote($note);
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
            'class' => 'required',
            'text' => 'required',
        ]);

        $note = Note::find($id);
        $note->id_class = $request->post('class');
        $note->text = $request->post('text');
        $note->save();

        return redirect('dashboard/note');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $note = Note::find($id);
        $note->delete();
        return Response::json($note);
    }
}