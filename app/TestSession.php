<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TestSession extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'test_sessions';

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
        'id_student', 
        'id_token', 
        'progress', 
        'score',
        'is_ongoing', 
        'is_finished'
    ];
}
