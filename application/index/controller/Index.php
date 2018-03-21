<?php
namespace app\index\controller;

use app\model\Activity;
use app\model\Collect;
use app\model\Member;
use app\model\News as NewsModel;
use think\Controller;
use think\Session;

class Index extends MyController
{
    public function index()
    {
        $Model = new Activity();
        $acts = $Model->paginate(5);

        foreach ($acts as $act){
            $act->is_collected = 0;
            if($user_id = Session::get('user_id')){
                if($collect = Collect::get(['ref_id'=>$act->id,'user_id'=>$user_id])){
                    $act->is_collected = 1;
                }
            }
            $act->is_member = 0;
            if($user_id = Session::get('user_id')){
                if($member = Member::get(['activity_id'=>$act->id,'user_id'=>$user_id])){
                    $act->is_member = 1;
                }
            }
            $MemberModel = new  \app\model\Member();
            $act->members = $MemberModel->where('activity_id',$act->id)->count();
        }
        return $this->fetch('index',['acts'=>$acts]);
    }

}
