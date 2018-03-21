<?php
namespace app\admin\controller;

use app\model\Activity;
use app\model\Apply;
use app\model\Category;
use app\model\Collect;
use app\model\Member;
use app\model\User;
use think\Session;

class Index extends MyController
{

    public function index()
    {
        $acts = Activity::paginate(10);
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

    public function users()
    {
        $users = User::paginate(10);
        foreach ($users as $user){
            $user->roleName = User::$roles[$user->role];
            $user->apply = Apply::get(['user_id'=>$user->id]);
        }
        return $this->fetch('users',['users'=>$users]);
    }

    public function add()
    {
        return $this->fetch('cat');
    }

    public function doAdd()
    {
        $name = $this->request->param('name');
        $cat = new Category();
        $cat->name = $name;
        $cat->save();
        return $this->success("添加成功");
    }

    public function edit()
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
            $clicks = 0;
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
        $status = 1;
        $user_id = Session::get('user_id')?:1;
//        $user_id = 1;
        $comments_count = 0;
        $is_good = 0;
        $arr = ['name','desc','category_id','act_at','user_id','members_limit','comments_count','txt','location','limit'];
        $face?$arr[]= 'face':null;
        isset($clicks)?$arr[] = 'clicks':null;
        foreach ($arr as $item){
            $Act->$item = $$item;
        }
        if(false !== $Act->save()) {
            $this->redirect('admin/index/detail',"id={$Act->id}");
        }else{
            $this->error("发布失败，请稍后重试",url('admin/index/edit',['id'=>$Act->id]));
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

    public function pass()
    {
        $apply = Apply::get($this->request->param('id'));
        $status = $this->request->param('status');
        $apply->status = $status;
        $apply->save();
        if($status == 1){
            $user = User::get($apply->user_id);
            $user->role = 2;
            $user->save();
        }
        $this->redirect(url('admin/index/users'));

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
        $mems = $MemberModel->where('activity_id',$id)->select();

        $post->members = $MemberModel->where('activity_id',$id)->count();

        $comments = \app\model\Comment::where(['activity_id'=>$id])->order(['at desc'])->paginate(10);
        return $this->fetch('detail',['act'=>$post,'comments'=>$comments,'members'=>$mems]);
    }

    public function apply()
    {
        $apply = Apply::get($this->request->param('id'));
        return $this->fetch('apply',['apply'=>$apply]);
    }
}
