<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ViewStudentGrade extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'v_student_grade';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';
}
