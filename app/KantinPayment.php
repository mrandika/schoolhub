<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class KantinPayment extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'kantin_payments';

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
        'id_seller', 'id_buyer', 'id_inventory', 'qty', 'total',
    ];
}
