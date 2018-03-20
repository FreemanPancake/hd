<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-18
 * Time: 下午10:27
 */

namespace app\index\controller;


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
        foreach (['name','desc','category_id','act_at','clicks','user_id','members_limit','face','comments_count','txt','location'] as $item){
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
        // if($user_id = Session::get('user_id')){
        //     if($collect = Collect::get(['ref_id'=>$post->id,'user_id'=>$user_id])){
        //         $post->is_collected = 1;
        //     }
        // }
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
        $Collect->type=2;
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
        $Collect = Collect::get(['user_id'=>$user_id,'ref_id'=>$id,'type'=>2]);
        if($Collect){
            if($Collect->delete()){
                echo json_encode(['code'=>1,'msg'=>"取消收藏成功"]);
                return;
            }
        }
    }
}