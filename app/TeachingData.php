<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TeachingData extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'teaching_data';

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
        'id_teacher', 'day', 'id_class', 'id_subject', 'id_room', 'time_in', 'time_out',
    ];
}
