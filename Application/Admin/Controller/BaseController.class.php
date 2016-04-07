<?php
/**
 * Base控制器
 * @author Link
 */
 
namespace Admin\Controller;
use Think\Controller;
class BaseController extends Controller{
	
	//用户登陆信息检测
	public function _initialize(){
		$sess_User = session('user');
		if(!is_array($sess_User)){
			//$this->error('您还未登录 '.C('TITLE'),U('Login/index'));
			header("content-type:text/html; charset=utf-8");
			$this->redirect('Login/index', '', 0, '您还未登录 '.C('TITLE').' ,页面跳转中！');
		}
		session('login_time',time()); //更新用户登录生存周期
	}
	
	public function treeRule(){
		if(IS_POST){
			$Rule = M("AuthRule")->field("id,title as text,rule_id")->order("sort asc")->select();
			$treeRule[0] = array(
				'id' => 0,
				'text' => '顶级菜单',
				'children' => treeRule($Rule)
			);
			$this->ajaxReturn($treeRule);
			exit;
		}
	}
	
	public function iconsCls(){
		if(IS_POST){
			$iconsCls = file_get_contents("./Public/Css/icons.css");
			$iconsCls = explode('}', $iconsCls);
			$tmp_iconsCls = array();
			foreach($iconsCls as $k => $v){
				if(preg_match("/\.(.+?){/", $v,$m)){
					$tmp_iconsCls[] = $m[1];
				}
			}
			$this->ajaxReturn($tmp_iconsCls);
		}
	}
	
	public function checkAddRule(){
		//验证是否已存在规则
		if(IS_POST && I('name')){
			$count = M("AuthRule")->where(array("name"=>I("name")))->count();;
			if(!$count){
				echo 'true';
			} else {
				echo 'false';
			}
			exit;
		}
	}
	
	public function checkEditRule(){
		//验证是否已存在规则
		if(IS_POST && I('name')){
			$where = array(
				'id' => array('neq',I("get.id")),
				'name' => I("name")
			);
			$AuthRule = M("AuthRule");
			$count = $AuthRule->where($where)->count();;
			if(!$count){
				echo 'true';
			} else {
				echo 'false';
			}
			exit;
		}
	}
	
	public function treeListBranch(){
		if(IS_POST){
			$table_Branch = M("Branch")->field("id,title as text,sort,branch_id")->order("sort asc")->select();
			$treeBranch[0] = array(
				'id' => 0,
				'text' => '顶级部门',
				'children' => treeBranch($table_Branch)
			);
			$this->ajaxReturn($treeBranch);
			exit;
		}
	}

	public function listGroup(){
		$table_AuthGroup = M("AuthGroup")->order('sort asc')->select();
		if(IS_POST && I("get.type") == "all"){
			array_unshift($table_AuthGroup,array("id"=>"0","title"=>"全部角色","selected"=>true));
		}
		$this->ajaxReturn($table_AuthGroup);
		exit;
	}

	public function listBranch(){
		$table_Branch = M("Branch")->order('sort asc')->select();
		if(IS_POST && I("get.type") == "all"){
			array_unshift($table_Branch,array("id"=>"0","title"=>"全部部门","selected"=>true));
		}
		$this->ajaxReturn($table_Branch);
		exit;
	}
	
	public function listJob(){
		$table_Job = M("Job")->order("sort asc")->select();
		array_shift($table_Job);
		if(IS_POST && I("get.type") == "all"){
			array_unshift($table_Job,array("id"=>"0","title"=>"全部职务","selected"=>true));
		}
		$this->ajaxReturn($table_Job);
		exit;
	}
}