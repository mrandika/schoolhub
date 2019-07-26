<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BlogPostMeta extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'blog_post_metas';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id_post';
}
