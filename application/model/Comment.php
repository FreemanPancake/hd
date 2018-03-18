<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-14
 * Time: 下午1:55
 */

namespace app\model;


use think\Model;

class Comment extends Model
{

    public function user()
    {
        return $this->belongsTo('User');
    }

}