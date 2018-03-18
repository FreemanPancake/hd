<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-17
 * Time: 下午12:03
 */

namespace app\index\controller;


use app\model\Category;
use app\model\Collect;
use think\Session;

class News extends MyController
{

    public function index()
    {
        $type = $this->request->param("type");
        $user_id = $this->request->param('user_id');
        $Model = new \app\model\News();

        $posts = $Model->getIndexList($type,5,$user_id);

        if($posts){
            foreach ($posts as $post){
                $post->collect_count = Collect::all(['type'=>2,'ref_id'=>$post->id]);
                if($post->collect_count)
                    $post->collect_count = count($post->collect_count);
                else
                    $post->collect_count=0;
            }
        }
        foreach ($posts as $post){
            $post->typeName = $post->type==1?"图文新闻":"视频新闻";
        }
        return $this->fetch("index",['newses'=>$posts,'type'=>$type]);
    }


    public function news()
    {
        $cats = Category::all();
        return $this->fetch('news',['cats'=>$cats,'news'=>null]);
    }

    public function update()
    {
        $cats = Category::all();
        $news = \app\model\News::get($this->request->param('id'));
        return $this->fetch('news',['cats'=>$cats,'news'=>$news]);
    }

    public function doNews()
    {
        if($nid = $this->request->param('id')){
            $News = \app\model\News::get($nid);
        }else{
            $News = new \app\model\News();
        }
        $title = $this->request->post('title');
        $content = $this->request->post('content');
        $category = $this->request->post('category');
        $txt = $this->request->post('txt');
        $post_at = time();
        $click = 0;
        $status = 1;
//        $user_id = Session::get('user_id')?:1;
        $user_id = 1;
        $comments_count = 0;
        $is_good = 0;
        $video = '';
        $type=1;
        foreach (['title','type','content','category','post_at','click','user_id','status','comments_count','video','txt'] as $item){
            $News->$item = $$item;
        }

        if($id = $News->save()) {
            $this->redirect('index/news/detail',"id={$News->id}");
        }else{
            $this->error("发布新闻失败，请稍后重试",url('index/post/post'));
        }
    }

    public function detail()
    {
        $News = \app\model\News::get($this->request->param('id'));
        if($user_id = Session::get('user_id')){
            if($collect = Collect::get(['type'=>2,'ref_id'=>$News->id,'user_id'=>$user_id])){
                $News->is_collected = 1;
            }else{
                $News->is_collected = 0;
            }
        }else{
            $News->is_collected = 0;
        }

        return $this->fetch('detail',['news'=>$News]);
    }

    public function upload()
    {
        $cats = Category::all();
        return $this->fetch('upload',['cats'=>$cats,'news'=>null]);
    }

    public function doUpload()
    {
        if($nid = $this->request->param('id')){
            $News = \app\model\News::get($nid);
        }else{
            $News = new \app\model\News();
        }
        $title = $this->request->post('title');
        $content = $this->request->post('content');
        $category = $this->request->post('category');
        $video = $this->saveFile('video');
        $face = $this->saveFile('face');
        $txt = '';
        $post_at = time();
        $click = 0;
        $status = 1;
//        $user_id = Session::get('user_id')?:1;
        $user_id = 1;
        $comments_count = 0;
        $is_good = 0;
        $type=2;
        foreach (['title','type','content','category','post_at','click','user_id','status','comments_count','video','txt','face'] as $item){
            $News->$item = $$item;
        }

        if($id = $News->save()) {
            $this->redirect('index/news/detail',"id={$News->id}");
        }else{
            $this->error("发布新闻失败，请稍后重试",url('index/post/post'));
        }
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
        $Collect->type=1;
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
        $Collect = Collect::get(['user_id'=>$user_id,'ref_id'=>$id,'type'=>1]);
        if($Collect){
            if($Collect->delete()){
                echo json_encode(['code'=>1,'msg'=>"取消收藏成功"]);
                return;
            }
        }
    }

}