<?php
/**
 * 后台首页版块管理
 * @author Link <612012@qq.com>
 */
 
namespace Admin\Controller;
use Think\Controller;
class PanelController extends AuthController{

	public function index(){
		if(IS_POST){
			$table_Panel = M('Panel')->field("id,title,sort,id as opert_id")->order("sort asc")->page(I('page'),I('rows'))->select();
			$data = array(
				"total" => M('Panel')->count(),
				"rows" => $table_Panel
			);
			$this->ajaxReturn($data);
			exit;
		}
		$this->display();
	}

	public function addPanel(){
		if(IS_POST && I('addPanel')){
			$table_Panel = M("Panel");
			if(!$table_Panel->create()){
				$msg = doReturn("","数据创建失败，未知原因，请联系管理员",false);
			} else {
				$status = $table_Panel->add();
				$msg = doReturn("数据添加成功","数据添加失败,未知原因，请联系管理员",$status);
			}
			$this->ajaxReturn($msg);
			exit;
		}
		$this->display();
	}

	public function editPanel(){
		if(IS_POST && I("editPanel")){
			$table_Panel = M("Panel");
			if(!$table_Panel->create()){
				$msg = doReturn("","数据创建失败，未知原因，请联系管理员",false);
			} else {
				$status = $table_Panel->save();
				$msg = doReturn("数据编辑成功","数据编辑失败,未知原因，请联系管理员",$status);
			}
			$this->ajaxReturn($msg);
			exit;
		}
		$this->Panel = M("Panel")->find(I('id'));
		$this->display();
	}

	public function delPanel(){

		if(IS_POST && I('id')){
			$status = M("Panel")->delete(I('id'));
			$msg = doReturn("数据成功删除","数据删除失败，请联系管理员",$status);
			$this->ajaxReturn($msg);
			exit;
		}
	}

	public function sortPanel(){
		$error_id = "";
		$status = true;
		$sortPanel = I("sort");
		foreach($sortPanel as $k => $v){
			$data = array(
				"id"=>$k,
				"sort"=>$v
			);
			$status = M("Panel")->save($data);
			if ($status === false){
				$error_id = $k;
				break;//当排序失败时，跳出循环
			}
		}
		if($status !== false){
			$data["status"] = true;
			$data["info"] = "版块排序成功";
		} else {
			$data["status"] = false;
			$data["info"] = "版块排序失败<br />发生错误的排序ID：$error_id";
		}
		$this->ajaxReturn($data);
	}
	
}