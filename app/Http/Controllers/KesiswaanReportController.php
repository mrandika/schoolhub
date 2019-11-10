<?php

namespace App\Http\Controllers;

use App\Exports\SiswaReportExport;
use App\KesiswaanReport;
use App\KesiswaanViolation;
use App\ViewKesiswaanReport;
use App\ViewStudent;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

use Auth;

class KesiswaanReportController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (Auth::user()->role == 6) {
            $cond = ['id_teacher' => Auth::id()];
            $counts = ViewKesiswaanReport::where($cond)->count();
            $report = ViewKesiswaanReport::where($cond)->get();
            return view('administrator/kesiswaan/report/index')
                ->withCounts($counts)
                ->withReports($report);
        } else {
            $counts = ViewKesiswaanReport::count();
            $report = ViewKesiswaanReport::all();
            return view('administrator/kesiswaan/report/index')
                ->withCounts($counts)
                ->withReports($report);
        }
    }

    public function export_excel()
    {
        return Excel::download(new SiswaReportExport, 'Kesiswaan-report-validated.xlsx');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $student = ViewStudent::all();
        $violation = KesiswaanViolation::all();
        return view('administrator/kesiswaan/report/create')
            ->withStudents($student)
            ->withViolations($violation);
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
            'id_teacher' => 'required',
            'id_student' => 'required',
            'id_violation' => 'required',
        ]);

        $multiple = $request->has('multiple');

        $report = new KesiswaanReport;
        $report->id_teacher = $request->post('id_teacher');
        $report->id_student = $request->post('id_student');
        $report->id_violation = $request->post('id_violation');

        if (Auth::user()->role == 1) {
            $report->status = 'Tervalidasi';
        } else {
            $report->status = 'Belum Tervalidasi';
        }

        $report->save();

        if ($multiple) {
            return back();
        } else {
            return redirect('dashboard/kesiswaan/reports');
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
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
