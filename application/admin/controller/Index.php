<?php
namespace app\admin\controller;

use app\model\Course;
use app\model\News;
use think\Controller;

class Index extends MyController
{

    public function index()
    {
        $newModel = new News();
        $postModel  =new \app\model\Post();
        $userModel = new \app\model\User();
        $dateStart = strtotime("Y-m-d 00:00:00");
        $dateEnd = strtotime("Y-m-d 23:59:59");
        $newNum = $newModel->where('post_at','>=',$dateStart)->where('post_at','<=',$dateEnd)->count();
        $postNum = $postModel->where('post_at','>=',$dateStart)->where('post_at','<=',$dateEnd)->count();
        $userNum = $userModel->where('register_at','>=',$dateStart)->where('register_at','<=',$dateEnd)->count();
        return $this->fetch('index',['news'=>$newNum,'posts'=>$postNum,'users'=>$userNum]);
    }
}
