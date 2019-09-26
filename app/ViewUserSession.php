<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ViewUserSession extends Model
{
     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'v_users_session';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';
}
