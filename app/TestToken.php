<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TestToken extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'test_tokens';

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
        'id_question', 'id_student', 'token', 
    ];
}
