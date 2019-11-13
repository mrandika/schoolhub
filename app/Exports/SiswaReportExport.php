<?php

namespace App\Exports;

use App\ViewKesiswaanReport;
use Maatwebsite\Excel\Concerns\FromCollection;

class SiswaReportExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return ViewKesiswaanReport::select(['id', 'teacher', 'student', 'violation', 'violation_score', 'status', 'created_at'])->where('status', 'Tervalidasi')->get();
    }
}
