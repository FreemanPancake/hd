<?php
/**
 * Created by PhpStorm.
 * User: young
 * Date: 18-3-17
 * Time: 下午12:03
 */

namespace app\model;


use think\Model;

class News extends Model
{
    public function getIndexList($type,$size,$user_id=null)
    {
        $model = new News();
        $query = [];
        if($type){
            $query['type'] = $type;
            $model->where('type',$type);
        }
        if($user_id) {
            $query['user_id'] = $user_id;
            $model->where('user_id', $user_id);
        }
        $newses = $model->paginate($size,false,['query'=>$query]);

        return $newses;
    }

    public function user()
    {
        return $this->belongsTo('User');
    }
}