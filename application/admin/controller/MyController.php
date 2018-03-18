<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-15
 * Time: 下午6:53
 */

namespace app\admin\controller;


use think\Controller;
use think\Session;

class MyController extends Controller
{
    protected $beforeActionList = [
//        'loginCheck'=>['only'=>'index']
        'loginCheck'=>['except'=>'login,doLogin']
    ];
    protected function loginCheck()
    {
        if(!Session::get("admin_id")){
            $this->redirect(url('admin/user/login'));
        }
    }
}