<?php
namespace app\model;

use think\Model;

class User extends model
{
    static $roles =[
        1=>"管理员",
        2=>"主编",
        3=>"普通用户",
    ];

    static $statuNames =[
        '0'=>"禁用",
        '1'=>'启用'
    ];
    public function getByUserAndPass($user,$pass)
    {
        return self::where('name',$user)->where('password',$pass)->where('status',1)->find();
    }

    public function roleName()
    {
        return self::$roles[$this->role];
    }

    public function statusName()
    {
        return self::$statuNames[$this->status];
    }
}