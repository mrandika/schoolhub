<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TeachingAttendance extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'teaching_attendance';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';
}
