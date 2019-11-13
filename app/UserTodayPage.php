<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserTodayPage extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_today_pages';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id_user';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id_user', 'heading', 'subheading', 'content',
    ];
}
