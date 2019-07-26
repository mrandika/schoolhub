<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SarprasBorrower extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'sarpras_borrower';

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
        'id_user', 'id_inventory', 'id_room', 'status'
    ];
}
