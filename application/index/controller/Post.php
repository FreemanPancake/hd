<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-14
 * Time: 下午1:58
 */

namespace app\index\controller;


use app\model\Category;
use app\model\Collect;
use app\model\Tag;
use think\Controller;
use think\Request;
use think\Session;

class Post extends MyController
{
    protected $beforeActionList = [
//        'loginCheck'=>['only'=>'post,doPost']
    ];
    protected $Model;
    public function __construct(Request $request = null)
    {
        $this->Model = new \app\model\Post();
        parent::__construct($request);
    }

    public function index()
    {
        $type = $this->request->param("type",0);
        if($type==0){
            $posts = $this->Model->getIndexList(5);
        }else{
            $posts = $this->Model->getGoodList(5);
        }
        foreach ($posts as $post){
            $post->collect_count = Collect::all(['type'=>2,'ref_id'=>$post->id]);
            if($post->collect_count)
                $post->collect_count = count($post->collect_count);
            else
                $post->collect_count=0;
        }
        return $this->fetch("index1",['posts'=>$posts,'type'=>$type]);
    }

    public function post()
    {
        $cats = Category::all();
        $post = null;
        if($id = $this->request->param('id'));
        $post = \app\model\Post::get($id);
        return $this->fetch('post',['cats'=>$cats,'post'=>$post]);
    }

    public function doPost()
    {
        if($nid = $this->request->param('id')){
            $Post  = \app\model\Post::get($nid);
        }else{
            $Post  = new \app\model\News();
        }
        $title = $this->request->post('title');
        $content = $this->request->post('content');
        $category = $this->request->post('category');
        $post_at = time();
        $click = 0;
        $status = 1;
//        $user_id = Session::get('user_id')?:1;
        $user_id = 1;
        $comments_count = 0;
        $is_good = 0;
        foreach (['title','content','category','post_at','click','user_id','status','comments_count','is_good'] as $item){
            $Post->$item = $$item;
        }
        if($id = $Post->save()) {
            $this->redirect('index/post/detail',"id={$Post->id}");
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