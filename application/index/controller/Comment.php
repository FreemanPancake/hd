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
        $comment->activity_id = $this->request->param("activity_id");
        if($comment->save()){
            $User = \app\model\User::get($comment->user_id);
            $comment->username = $User->name;
            $comment->at = date("Y-m-d H:i",$comment->at);

            $Course = \app\model\Activity::get($comment->activity_id);
            $Course->comments_count++;
            $Course->save();

            echo json_encode(['code'=>1,'data'=>$comment,'msg'=>"评论成功",'id'=>$comment->id]);
        }
    }


}