<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-15
 * Time: 上午9:24
 */

namespace app\index\controller;


use app\model\Teacher;
use think\Controller;

class Profile extends MyController
{
    public function add()
    {
        $user_id = $this->request->param('user_id');
        if($user_id){
            return $this->fetch('add',['user_id'=>$user_id]);
        }
    }

    public function save()
    {
        $Teacher = new Teacher();
        $Teacher->truename = $this->request->param('truename');
        $Teacher->user_id = $this->request->param('user_id');
        $thumb = $this->saveFile('thumb');
        $Teacher->desc = $this->request->param('desc');
        $Teacher->status = 0;
        $Teacher->thumb = $thumb;
        $Teacher->save();
        $this->success("申请成功，请等待管理员审核",url('index/index/index'));
    }

}