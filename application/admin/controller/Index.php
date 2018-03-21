<?php
namespace app\admin\controller;

use app\model\Activity;
use app\model\Apply;
use app\model\Course;
use app\model\News;
use app\model\User;
use think\Controller;

class Index extends MyController
{

    public function acts()
    {
        $acts = Activity::paginate(10);
        return $this->fetch('acts',['acts'=>$acts]);
    }

    public function users()
    {
        $users = User::paginate(10);
        return $this->fetch('acts',['users'=>$users]);
    }

    public function edit()
    {

    }

    public function save()
    {

    }

    public function delete()
    {

    }

    public function pass()
    {
        $apply = Apply::get($this->request->param('id'));
        $status = $this->request->param('status');
        if()
    }
}
