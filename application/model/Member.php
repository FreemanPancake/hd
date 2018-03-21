<?php


namespace app\model;


use think\Model;

class Member extends Model
{
    public function user()
    {
        return $this->belongsTo('User');
    }
}