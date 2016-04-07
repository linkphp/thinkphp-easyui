<?php
/**
 * 职务管理
 * @author Link <612012@qq.com>
 */
 
namespace Admin\Controller;
use Think\Controller;
class JobController extends AuthController{
	
public function index(){
		if(IS_POST){
			$table_Job = M("Job")->order("sort asc")->page(I('page'),I('rows'))->select();
			$data = array(
				"total" => M("Job")->count(),
				"rows" => $table_Job
			);
			$this->ajaxReturn($data);
			exit;
		}
		$this->display();
	}

	public function sortJob(){
		$error_id = "";
		$status = true;
		$sortJob = I("sort");
		foreach($sortJob as $k => $v){
			$data = array(
				"id"=>$k,
				"sort"=>$v
			);
			$status = M("Job")->save($data);
			if ($status === false){
				$error_id = $k;
				break;//当排序失败时，跳出循环
			}
		}
		if($status !== false){
			$data["status"] = true;
			$data["info"] = "职务排序成功";
		} else {
			$data["status"] = false;
			$data["info"] = "职务排序失败<br />发生错误的排序ID：$error_id";
		}
		$this->ajaxReturn($data);
	}

	public function addJob(){
		if(IS_POST && I("addJob")){
			$table_Job = M("Job");
			if(!$table_Job->create()){
				$msg = doReturn("",$table_Job->getError(),false);
			} else {
				$status = $table_Job->add();
				$msg = doReturn("数据添加成功","数据添加失败,未知原因，请联系管理员",$status);
			}
			$this->ajaxReturn($msg);
			exit;
		}
		$this->display();
	}

	public function editJob(){
		if(IS_POST && I("editJob")){
			$table_Job = M("Job");
			if(!$table_Job->create()){
				$msg = doReturn("",$table_Job->getError(),false);
			} else {
				$status = $table_Job->save();
				$msg = doReturn("数据编辑成功","数据编辑失败,未知原因，请联系管理员",$status);
			}
			$this->ajaxReturn($msg);
			exit;
		}
		if(I('id') == '1'){
			echo "不允许对超级管理员编辑";
			exit;
		}
		$this->Job = M("Job")->find(I('id'));
		$this->display();
	}

	public function delJob(){
		if(IS_POST && I('id')){
			if(I('id') == '1'){
				$msg = doReturn("","不允许删除超级管理员",false);
				exit;
			}
			$status = M("Job")->delete(I('id'));
			$msg = doReturn("数据成功删除","数据删除失败，请联系管理员",$status);
			$this->ajaxReturn($msg);
			exit;
		}
	}
}