<?php
namespace app\admin\controller;

use app\model\Apply;
use app\model\User as UserModel;
use think\Session;

class User extends MyController
{


    public static $roleName=[
        1=>"管理员",
        2=>"认证用户",
        3=>"普通用户"
    ];

    public function login()
    {
        $return_url = $this->request->header('referer');
        return $this->fetch('login',['return_url'=>$return_url]);
    }

    public function doLogin()
    {
        $user =$this->request->post("user");
        $pass = $this->request->post('password');

        if(!$user || !$pass){
            $this->error("请输入用户名和密码");
        }

        $Model = new UserModel();

        if($User = $Model->getByUserAndPass($user,md5($pass),true)){
            Session::set('admin_id',$User->id);
            Session::set('user_id',$User->id);
            Session::set('admin_name',$User->name);

            Session::set('role',$User->role);

            $this->success("登录成功",'admin/index/index',null,2);
        }else{
            $this->error("用户名或密码错误",url('admin/user/login'));
        }
    }

    public function profile()
    {
        $User = \app\model\User::get(Session::get('user_id'));
        if($User){
            $User->roleName = self::$roleName[$User->role];
            return $this->fetch('profile',['user'=>$User]);
        }
    }

    public function logout()
    {
        Session::delete('user_id');
        Session::delete('user_name');
        Session::delete('role');
        $this->redirect(url('index/index/index'));
    }
}
