<?php
namespace app\index\controller;

use app\model\News as NewsModel;
use think\Controller;

class Index extends MyController
{
    public function index()
    {

//        $acts =
        return $this->fetch('index',[]);
    }

}
