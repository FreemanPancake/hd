<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-19
 * Time: 下午10:03
 */

namespace app\model;


use think\Model;

class Activity extends Model
{
    public function user()
    {
        return $this->belongsTo('User');
    }

    public function cat()
    {
        return $this->belongsTo('Category');
    }
}