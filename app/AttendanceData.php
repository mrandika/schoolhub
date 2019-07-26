<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AttendanceData extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'attendance_data';

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
        'id_students', 'id_attendance', 'status',
    ];
}
