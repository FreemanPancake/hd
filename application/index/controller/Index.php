<?php
namespace app\index\controller;

use app\model\Activity;
use app\model\News as NewsModel;
use think\Controller;

class Index extends MyController
{
    public function index()
    {
        $Model = new Activity();
        $acts = $Model->paginate(5);
        return $this->fetch('index',['acts'=>$acts]);
    }

}
