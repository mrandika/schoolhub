<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class KantinInventory extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'kantin_inventories';

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
        'id_shop', 'name', 'image', 'price', 'stock',
    ];
}
