<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-18
 * Time: 下午10:27
 */

namespace app\index\controller;


use app\model\Activity;
use app\model\Collect;
use app\model\Member;
use think\Session;

class Act extends MyController
{
    protected $beforeActionList = [
//        'loginCheck'=>['only'=>'post,doPost']
    ];

    public function act()
    {
        $cats = \app\model\Category::all();
        $act = null;
        if($id = $this->request->param('id'))
        $act = \app\model\Activity::get($id);
        return $this->fetch('act',['cats'=>$cats,'act'=>$act]);
    }

    public function save()
    {
        if($nid = $this->request->param('id')){
            $Act  = \app\model\Activity::get($nid);
        }else{
            $Act  = new \app\model\Activity();
        }
        $name = $this->request->post('name');
        $desc = $this->request->post('desc');
        $limit = $this->request->post('limit');
        $category_id = $this->request->post('category');
        $location = $this->request->post('location');
        $face = $this->saveFile('face');
        $members_limit = $this->request->post('num');
        $txt = $this->request->post('txt');
        $act_at_date = $this->request->post('act_at_date');
        $act_at_time = $this->request->post('act_at_time');
        $act_at = strtotime($act_at_date." ".$act_at_time);
        $create_at = time();
        $clicks = 0;
        $status = 1;
//        $user_id = Session::get('user_id')?:1;
        $user_id = 1;
        $comments_count = 0;
        $is_good = 0;
        $arr = ['name','desc','category_id','act_at','clicks','user_id','members_limit','comments_count','txt','location','limit'];
        $face?$arr[]= 'face':null;
        foreach ($arr as $item){
            $Act->$item = $$item;
        }
        if($id = $Act->save()) {
            $this->redirect('index/act/detail',"id={$Act->id}");
        }else{
            $this->error("发布失败，请稍后重试",url('index/act/act'));
        }
    }

    public function detail()
    {
        $id = $this->request->param('id');
        $post = \app\model\Activity::get($id);
        $post->clicks = intval($post->clicks)+1;
        $post->save();

        $post->is_collected = 0;
        if($user_id = Session::get('user_id')){
            if($collect = Collect::get(['ref_id'=>$post->id,'user_id'=>$user_id])){
                $post->is_collected = 1;
            }
        }
        $post->is_member = 0;
        if($user_id = Session::get('user_id')){
            if($member = Member::get(['activity_id'=>$post->id,'user_id'=>$user_id])){
                $post->is_member = 1;
            }
        }
        $MemberModel = new  \app\model\Member();
        $post->members = $MemberModel->where('activity_id',$id)->count();

        $comments = \app\model\Comment::where(['activity_id'=>$id])->order(['at desc'])->paginate(10);
        return $this->fetch('detail',['act'=>$post,'comments'=>$comments]);
    }

    public function collect()
    {
        $id = $this->request->param('id');
        $user_id = Session::get('user_id');
        if(!$user_id){
            echo json_encode(['code'=>0,'msg'=>"请先登录"]);
            return;
        }
        $Collect = new Collect();
        $Collect->user_id = $user_id;
        $Collect->ref_id = $id;
        if($Collect->save()){
            echo json_encode(['code'=>1,'msg'=>"收藏成功"]);
            return;
        }
    }

    public function dis_collect()
    {
        $id = $this->request->param('id');
        $user_id = Session::get('user_id');
        if(!$user_id){
            echo json_encode(['code'=>0,'msg'=>"请先登录"]);
            return;
        }
        $Collect = Collect::get(['user_id'=>$user_id,'ref_id'=>$id]);
        if($Collect){
            if($Collect->delete()){
                echo json_encode(['code'=>1,'msg'=>"取消收藏成功"]);
                return;
            }
        }
    }

    public function delete()
    {
        $id = $this->request->param('id');
        $act = Activity::get($id);
        if($act->delete()){
            $this->success("删除成功",url('index/index/index'));
        }else{
            $this->error("删除失败");
        }
    }

    public function signup()
    {
        $id = $this->request->param('id');
        $user_id = Session::get('user_id');
        if(!$user_id){
            echo json_encode(['code'=>0,'msg'=>"请先登录"]);
            return;
        }
        $activity = Activity::get($id);
        $Collect = new Member();
        if($member = Member::get(['user_id'=>$user_id,'activity_id'=>$id])){
            echo json_encode(['code'=>0,'msg'=>"对不起不能重复报名"]);
            return;
        }
        $MemberModel = new  \app\model\Member();
        $members = $MemberModel->where('activity_id',$id)->count();
        if($members>=$activity->members_limit){
            echo json_encode(['code'=>0,'msg'=>"对不起，该活动已满员"]);
            return;
        }
        $Collect->user_id = $user_id;
        $Collect->activity_id = $id;
        if($Collect){
            if($Collect->save()){
                echo json_encode(['code'=>1,'msg'=>"报名成功"]);
                return;
            }else{
                echo json_encode(['code'=>0,'msg'=>"报名失败"]);
                return;
            }
        }
    }
}