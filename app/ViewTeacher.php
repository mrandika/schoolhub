<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ViewTeacher extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'v_teachers';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id_user';
}
