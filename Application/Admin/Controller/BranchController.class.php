<?php
/**
 * 部门管理
 * @author Link <612012@qq.com>
 */
 
namespace Admin\Controller;
use Think\Controller;
class BranchController extends AuthController{
	
	public function index(){
		if(IS_POST){
			$table_Branch = M("Branch")->field("id,title,sort,branch_id")->order("sort asc")->select();
			$data = treeBranch($table_Branch);
			$this->ajaxReturn($data);
			exit;
		}
		$this->display();
	}

	public function addBranch(){
		if(IS_POST && I("addBranch")){
			$table_Branch = M("Branch");
			if(!$table_Branch->create()){
				$msg = doReturn("","数据创建失败，未知原因，请联系管理员",false);
			} else {
				$status = $table_Branch->add();
				$msg = doReturn("数据添加成功","数据添加失败,未知原因，请联系管理员",$status);
			}
			$this->ajaxReturn($msg);
			exit;
		}
		$this->branch_id = I("branch_id");
		$this->display();
	}

	public function editBranch(){
		if(IS_POST && I("editBranch")){
			$table_Branch = M("Branch");
			if(!$table_Branch->create()){
				$msg = doReturn("","数据创建失败，未知原因，请联系管理员",false);
			} else {
				$status = $table_Branch->save();
				$msg = doReturn("数据编辑成功","数据编辑失败,未知原因，请联系管理员",$status);
			}
			$this->ajaxReturn($msg);
			exit;
		}
		$this->Branch = M("Branch")->find(I('id'));
		$this->display();
	}

	public function delBranch(){
		if(IS_POST && I('id')){
			$status = M("Branch")->delete(I('id'));
			$msg = doReturn("数据成功删除","数据删除失败，请联系管理员",$status);
			$this->ajaxReturn($msg);
			exit;
		}
	}

	public function sortBranch(){
		$error_id = "";
		$status = true;
		$sortBranch = I("sort");
		foreach($sortBranch as $k => $v){
			$data = array(
				"id"=>$k,
				"sort"=>$v
			);
			$status = M("Branch")->save($data);
			if ($status === false){
				$error_id = $k;
				break;//当排序失败时，捕获错误ID，结束程序
			}
		}
		if($status !== false){
			$data["status"] = true;
			$data["info"] = "部门排序成功";
		} else {
			$data["status"] = false;
			$data["info"] = "部门排序失败<br />发生错误的排序ID：$error_id";
		}
		$this->ajaxReturn($data);
	}
}