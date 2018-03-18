<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-15
 * Time: 下午6:06
 */

namespace app\admin\controller;


use think\Controller;
use app\model\User as UserModel;
use think\Session;

class User extends MyController
{
    protected $beforeActionList = [
        'loginCheck'=>['only'=>'index']
//        'loginCheck'=>['except'=>'login,doLogin']
    ];

    public function index()
    {
        $Users = \app\model\User::get([])->paginate(10);
        foreach ($Users as $user){
            $user->roleName = $user->roleName();
            $user->statusName = $user->statusName();
        }
        return $this->fetch('index',['users'=>$Users]);
    }

    public function login()
    {
        return $this->fetch("login");
    }

    public function doLogin()
    {
        $user =$this->request->post("user");
        $pass = $this->request->post('password');

        if(!$user || !$pass){
            Session::flash("login-error","请输入用户名和密码");
            $this->redirect(url('admin/user/login'));
        }

        $Model = new UserModel();
        $User = $Model->getByUserAndPass($user,md5($pass));

        if($User = $Model->getByUserAndPass($user,md5($pass))){
            if($User->role==1){
                Session::set('admin_id',$User->id);
                Session::set('admin_name',$User->name);
                $this->success("登录成功",'admin/index/index',null,2);
            }
        }
        Session::flash("login-error","用户名和密码错误");
        $this->redirect(url('admin/user/login'));
    }

    public function enable()
    {
        $id = $this->request->param('id');
        $user = \app\model\User::get($id);
        $user->status = 1;
        $user->save();
        $this->success("启用成功",url('admin/user/index'));
    }

    public function disable()
    {
        $id = $this->request->param('id');
        $user = \app\model\User::get($id);
        $user->status = 0;
        $user->save();
        $this->success("禁用成功",url('admin/user/index'));
    }

    public function logout()
    {
        Session::delete('admin_id');
        Session::delete('admin_name');
        $this->redirect(url('index/index/index'));
    }
}