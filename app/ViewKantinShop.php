<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ViewKantinShop extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'v_kantin_shops';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';
}
