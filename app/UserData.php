<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserData extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'users_data';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id_user';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id_user', 'name', 'gender', 'religion', 'birthplace', 'dob', 'address', 'phone',
    ];
}
