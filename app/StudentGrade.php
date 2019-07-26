<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentGrade extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'student_grade';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id_teaching', 'id_students', 'section', 'section_name', 'score',
    ];
}
