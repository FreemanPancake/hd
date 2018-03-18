<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-14
 * Time: 下午5:34
 */

namespace app\index\controller;

use think\Session;

class Comment extends MyController
{
    public function comment()
    {
        if(!Session::get('user_id')){
            echo json_encode(['code'=>0,'msg'=>"请先登录"]);
            return ;
        }
        $content = $this->request->param('content');
        $comment = new \app\model\Comment();
        $comment->content = $content;
        $comment->at = time();
        $comment->user_id = Session::get('user_id');
        $comment->type = $this->request->param("type");
        $comment->ref_id = $this->request->param("ref_id");
        if($comment->save()){
            $User = \app\model\User::get($comment->user_id);
            $comment->username = $User->name;
            $comment->at = date("Y-m-d H:i",$comment->at);
            if($comment->type==1){
                $Course = \app\model\Course::get($comment->ref_id);
                $Course->comments_count++;
                $Course->save();
            }else{
                $Course = \app\model\Post::get($comment->ref_id);
                $Course->comments_count++;
                $Course->last_reply = time();
                $Course->save();
            }
            echo json_encode(['code'=>1,'data'=>$comment,'msg'=>"评论成功",'id'=>$comment->id]);
        }
    }

    public function delete()
    {
        $id = $this->request->param('id');
        if(Session::get('role')!=2){
            echo json_encode(['code'=>0,'msg'=>"您没有该权限"]);
            return ;
        }
        if($Comment = \app\model\Comment::get($id)){
            $post = \app\model\Post::get($Comment->ref_id);
            $post->comments_count--;
            $post->save();
            $Comment->delete();
            echo json_encode(['code'=>1,'msg'=>"删除成功"]);
        }
    }

}