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

    protected $Model;

    public function __construct(Request $request = null)
    {
        $this->Model = new \app\model\Activity();
        parent::__construct($request);
    }

    public function act()
    {
        $cats = \app\model\Category::all();
        $act = null;
        if($id = $this->request->param('id'));
        $act = \app\model\Activity::get($id);
        return $this->fetch('post',['cats'=>$cats,'cat'=>$act]);
    }

    public function doPost()
    {
        if($nid = $this->request->param('id')){
            $Act  = \app\model\Activity::get($nid);
        }else{
            $Act  = new \app\model\Activity();
        }
        $title = $this->request->post('title');
        $name = $this->request->post('name');
        $desc = $this->request->post('desc');
        $category = $this->request->post('category');
        $members_limit = $this->request->post('members_limit');
        $act_at = $this->request->post('act_at');
        $create_at = time();
        $click = 0;
        $status = 1;
//        $user_id = Session::get('user_id')?:1;
        $user_id = 1;
        $comments_count = 0;
        $is_good = 0;
        foreach (['name','title','desc','category','act_at','click','user_id','members_limit','face','comments_count'] as $item){
            $Act->$item = $$item;
        }
        if($id = $Act->save()) {
            $this->redirect('index/act/detail',"id={$Act->id}");
        }else{
            $this->error("发表文章失败，请稍后重试",url('index/post/post'));
        }
    }

    public function detail()
    {
        $id = $this->request->param('id');
        $post = $this->Model->getById($id);
        $post->click = intval($post->click)+1;
        $post->save();

        if($user_id = Session::get('user_id')){
            if($collect = Collect::get(['type'=>2,'ref_id'=>$post->id,'user_id'=>$user_id])){
                $post->is_collected = 1;
            }else{
                $post->is_collected = 0;
            }
        }else{
            $post->is_collected = 0;
        }

        $comments = \app\model\Comment::where(['type'=>2,'ref_id'=>$id])->order(['at desc'])->paginate(10);
        return $this->fetch('detail',['post'=>$post,'comments'=>$comments]);
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