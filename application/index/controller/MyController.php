<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-15
 * Time: 下午6:53
 */

namespace app\index\controller;


use think\Controller;
use think\Exception;
use think\Session;

class MyController extends Controller
{
    protected function loginCheck()
    {
        if(!Session::get("user_id")){
            $this->redirect(url('index/user/login'));
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


    public function saveFiles($name){
        // 获取表单上传文件 例如上传了001.jpg
        $files = $this->request->file($name);

        // 移动到框架应用根目录/public/uploads/ 目录下
        $arr = [];
        foreach((array)$files as $file){
            if($file){
                $info = $file->move(ROOT_PATH . 'public' . DS ."static".DS. 'image');
                if($info){
                    $arr[] = $info->getSaveName();
                }else{
                    // 上传失败获取错误信息
                    throw new Exception("上传图片失败");
                }
            }
        }
        return $arr;
    }
}