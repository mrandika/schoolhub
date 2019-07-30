<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserSession extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'users_session';

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
        'id_user', 'is_mobile', 'phone', 'imei',
    ];
}
