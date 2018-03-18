<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-15
 * Time: 下午6:25
 */

namespace app\admin\controller;


use think\Controller;

class Post extends MyController
{
    protected $beforeActionList = [
        'loginCheck'
    ];
    public function index()
    {
//        $Users = \app\model\Post::get([])->paginate(10);
        $Users = [];
        return $this->fetch('index',['posts'=>$Users]);
    }

    public function delete()
    {
        $id = $this->request->param('id');
        $post = \app\model\Post::get($id);
        if($post->delete()){
            $this->success("删除成功",url('admin/post/index'));
        }
    }

    public function setgood()
    {
        $id = $this->request->param('id');
        $post = \app\model\Post::get($id);
        $post->is_good = 1;
        if($post->save()){
            $this->success("设置成功",url('admin/post/index'));
        }
    }

    public function detail()
    {
        $id =$this->request->param('id');
        $post = \app\model\Post::get($id);
        $comments = \app\model\Comment::where(['type'=>2,'ref_id'=>$id])->order(['at desc'])->select();
        return $this->fetch('detail',['post'=>$post,'comments'=>$comments]);
    }
}