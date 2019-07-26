<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class KantinShop extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'kantin_shops';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';
}
