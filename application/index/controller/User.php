<?php
namespace app\index\controller;

use app\model\Collect;
use think\Controller;
use app\model\User as UserModel;
use think\Session;

class User extends MyController
{

    public static $roleName=[
        1=>"管理员",
        2=>"主编",
        3=>"普通用户"
    ];
    public function index()
    {
        return $this->fetch('index');
    }

    public function login()
    {
        $return_url = $this->request->header('referer');
        return $this->fetch('login',['return_url'=>$return_url]);
    }

    public function doLogin()
    {
        $user =$this->request->post("user");
        $pass = $this->request->post('password');

        if(!$user || !$pass){
            Session::flash("login-error","请输入用户名和密码");
            $this->redirect(url('index/user/login'));
        }

        $return  = $this->request->param('return_url');
        if(!$return)
            $return = url('index/index/index');
        if(preg_match("/\/user\/login/",$return)){
            $return = url('index/index/index');
        }

        $Model = new UserModel();

        if($User = $Model->getByUserAndPass($user,md5($pass))){
            Session::set('user_id',$User->id);
            Session::set('user_name',$User->name);

            Session::set('role',2);

            $this->success("登录成功",'index/index/index',null,2);
        }else{
            $this->error("用户名或密码错误",url('index/user/login'));
        }
    }

    public function register()
    {
        $return_url = $this->request->header('referer');
        return $this->fetch('register',['return_url'=>$return_url]);
    }

    public function doRegister()
    {
        $user = $this->request->param('user');
        $email = $this->request->param('email');
        $pwd = $this->request->param('password');
        $repwd = $this->request->param('repassword');
        $role = 3;
        if(!$user||!$email||!$pwd){
            $this->error("表单信息不完整");
        }
        if($pwd !==$repwd){
            $this->error("两次输入密码不一致");
        }
        $return  = $this->request->param('return_url');
        if(!$return)
            $return = url('index/index/index');
        if(preg_match("/\/user\/register/",$return)){
            $return = url('index/index/index');
        }
        $User = new \app\model\User();
        $User->role = $role;
        $User->name = $user;
        $User->password = md5($pwd);
        $User->email = $email;
        $User->register_at = time();
        if($User->save()){
            Session::set('user_id',$User->id);
            Session::set('user_name',$User->name);
            Session::set('role',3);

            $this->redirect($return);
        }else{
            $this->error("注册失败");
        }
    }

    public function profile()
    {
        $User = \app\model\User::get(Session::get('user_id'));
        if($User){
            $User->roleName = self::$roleName[$User->role];
            return $this->fetch('profile',['user'=>$User]);
        }
    }

    public function updateEmail()
    {
        $id = Session::get('user_id');
        $email = $this->request->param('email');

        if(!$email){
            echo json_encode(['code'=>0,'msg'=>"请填写邮箱"]);
            return ;
        }
        $User = \app\model\User::get($id);
        $User->email = $email;
        $User->save();
        echo json_encode(['code'=>1,'msg'=>"修改成功"]);
        return ;
    }

    public function updatePass()
    {
        $id = Session::get('user_id');
        $old = $this->request->param('old');
        $new = $this->request->param('new');
        $re = $this->request->param('re');

        if(!$old ||!$new || !$re ||$re!==$new){
            echo json_encode(['code'=>0,'msg'=>"请确认修改信息！"]);
            return ;
        }
        $User = \app\model\User::get($id);
        $User->password = md5($new);
        $User->save();
        echo json_encode(['code'=>1,'msg'=>"修改成功"]);
        return ;
    }

    public function myCollect()
    {
        $Collect = new Collect();
        $collects1 = $Collect->alias('c')->join('news n','c.ref_id=n.id')->where('c.user_id',Session::get('user_id'))->where('c.type',1)->field('c.ref_id,n.title,n.post_at,c.id,c.type')->order('c.id desc')->paginate(10);
        $collects2 = $Collect->alias('c')->join('news n','c.ref_id=n.id')->where('c.user_id',Session::get('user_id'))->where('c.type',2)->field('c.ref_id,n.title,n.post_at,c.id,c.type')->order('c.id desc')->paginate(10);

        foreach ($collects1 as $post){
            $post->typeName = $post->type==1?"图文新闻":"视频新闻";
        }

        return $this->fetch('myCollect',['cols'=>$collects1,'posts'=>$collects2]);
    }

    public function myComments()
    {
        $Collect = new \app\model\Comment();
        $collects1 = $Collect->alias('c')->join('post n','c.ref_id=n.id')->where('c.user_id',Session::get('user_id'))->where('c.type',2)->field('c.ref_id,c.content,n.title,c.at,c.id')->order('c.id desc')->paginate(10);

        return $this->fetch('myComments',['cols'=>$collects1]);
    }

    public function myPost()
    {
        $Collect = new \app\model\Post();
        $collects1 = $Collect->where('user_id',Session::get('user_id'))->order('id desc')->paginate(10);

        foreach ($collects1 as $post){
            $post->collect_count = Collect::all(['type'=>2,'ref_id'=>$post->id]);
            if($post->collect_count)
                $post->collect_count = count($post->collect_count);
            else
                $post->collect_count=0;
        }

        return $this->fetch('myPosts',['cols'=>$collects1]);
    }

    public function apply()
    {
        $return_url = $this->request->header('referer');
        return $this->fetch('apply',['return_url'=>$return_url]);
    }

    public function doApply()
    {
        $reason = $this->request->param('reason');

        $role = 3;
        if(!$reason){
            $this->error("请填写申请理由");
        }

        $return  = $this->request->param('return_url');
        if(!$return)
            $return = url('index/index/index');
        if(preg_match("/\/user\/apply/",$return)){
            $return = url('index/index/index');
        }
        $User = \app\model\User::get(Session::get('user_id'));
        $User->role =2;
        $User->role_status = 0;
        $User->role_reason = $reason;
        if($User->save()){
            $this->success("申请成功，请等待审核",$return);
        }else{
            $this->error("申请失败");
        }
    }

    public function logout()
    {
        Session::delete('user_id');
        Session::delete('user_name');
        Session::delete('role');
        $this->redirect(url('index/index/index'));
    }
}
