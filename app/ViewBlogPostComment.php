<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ViewBlogPostComment extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'v_blog_comment';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';
}
