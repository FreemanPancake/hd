<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-15
 * Time: 下午6:53
 */

namespace app\admin\controller;


use think\Controller;
use think\Session;

class MyController extends Controller
{
    protected $beforeActionList = [
//        'loginCheck'=>['only'=>'index']
//        'loginCheck'=>['except'=>'login,doLogin']
    ];
    protected function loginCheck()
    {
        if(!Session::get("admin_id")){
            $this->redirect(url('admin/user/login'));
        }
    }

    public function saveFile($name){
        // 获取表单上传文件 例如上传了001.jpg
        $file = $this->request->file($name);

        // 移动到框架应用根目录/public/uploads/ 目录下
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS ."static".DS. 'image');
            if($info){
                return  $info->getSaveName();
            }else{
                // 上传失败获取错误信息
                throw new Exception("上传图片失败");
            }
        }
    }

}