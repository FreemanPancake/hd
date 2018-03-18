<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-18
 * Time: 下午1:37
 */

namespace app\index\controller;


use think\Session;

class Category extends MyController
{

    public function index()
    {
        $cats =(new \app\model\Category)->paginate(10);

        return $this->fetch('index',['cats'=>$cats]);
    }

    public function add()
    {
        if(Session::get('role')!=2){
            echo json_encode(['code'=>0,'msg'=>"没有权限"]);
            return ;
        }
        $name = $this->request->param('name');
        $cat = new \app\model\Category();
        $cat->name = $name;
        $cat->save();
        echo json_encode(['code'=>1,'msg'=>'','data'=>$cat]);
    }
}