<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Auth;
use App\ViewStudentGrade;

class SiswaGradeExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return ViewStudentGrade::select(['subject', 'section', 'section_name', 'minimum', 'score'])->where('id_students', Auth::id())->get();
    }
}
