<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class KesiswaanReport extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'kesiswaan_reports';

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
        'id_teacher', 'id_student', 'id_violation', 'status',
    ];
}
