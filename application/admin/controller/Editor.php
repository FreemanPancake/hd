<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-18
 * Time: 下午2:48
 */

namespace app\admin\controller;


class Editor extends MyController
{
    public static $status =[
        0=>"未审核",
        1=>"已审核",
        2=>"审核不通过"
    ];
    public function index()
    {
        $userModel = new \app\model\User();
        $users = $userModel->where('role',2)->paginate(10);

        foreach ($users as $user){
            $user->role_status_name = self::$status[$user->role_status];
        }

        return $this->fetch('index',['editors'=>$users]);
    }

    public function pass()
    {
        $id = $this->request->param('id');
        $status = $this->request->param('status');
        $user = \app\model\User::get($id);
        $user->role_status = $status;
        $user->save();
        $this->redirect(url('admin/editor/index'));
    }

}