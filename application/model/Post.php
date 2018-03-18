<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-14
 * Time: 下午1:54
 */

namespace app\model;


use think\Model;

class Post extends Model
{
    protected $table='activity';
    public function getIndexList($size)
    {
        return self::paginate($size);
    }

    public function user()
    {
        return $this->belongsTo('User');
    }

    public function category()
    {
        return $this->belongsTo('Category');
    }
}