<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ViewTeachingData extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'v_teaching_data';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';
}
