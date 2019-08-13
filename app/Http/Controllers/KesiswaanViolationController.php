<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Response;

use App\KesiswaanViolation;

use App\ViewKesiswaanReport;

class KesiswaanViolationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $count = KesiswaanViolation::count();
        $violation = KesiswaanViolation::paginate(20);
        return view('administrator/kesiswaan/violation/index')
        ->withCounts($count)
        ->withViolations($violation);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('administrator/kesiswaan/violation/create');
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
            'name' => 'required',
            'score' => 'required',
        ]);

        $multiple = $request->has('multiple');

        $violation = new KesiswaanViolation;
        $violation->name = $request->post('name');
        $violation->score = $request->post('score');
        $violation->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('dashboard/kesiswaan/violations');
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
        $count = ViewKesiswaanReport::where('violation', KesiswaanViolation::select('name')->where('id', $id)->first()->name)->count();
        $violation = KesiswaanViolation::find($id);
        $report = ViewKesiswaanReport::where('violation', KesiswaanViolation::select('name')->where('id', $id)->first()->name)->paginate(20);
        return view('administrator/kesiswaan/violation/show')
        ->withCounts($count)
        ->withViolation($violation)
        ->withReports($report);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $violation = KesiswaanViolation::find($id);
        return view('administrator/kesiswaan/violation/update')
        ->withViolation($violation);
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
        $violation = KesiswaanViolation::find($id);
        $violation->name = $request->post('name');
        $violation->score = $request->post('score');
        $violation->save();

        return redirect('dashboard/kesiswaan/violations');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $violation = KesiswaanViolation::find($id);
        $violation->delete();
        return Response::json($violation);
    }
}
