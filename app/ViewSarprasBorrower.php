<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ViewSarprasBorrower extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'v_sarpras_borrower';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';
}
