<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ViewNote extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'v_notes';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';
}
