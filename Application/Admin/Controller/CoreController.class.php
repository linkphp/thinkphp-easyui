<?php
/**
 * RBAC菜单权限管理
 * @author Link <612012@qq.com>
 */
 
namespace Admin\Controller;
use Think\Controller;
class CoreController extends AuthController{

	public function Rule(){
		if(IS_POST){
			$table_AuthRule = M("AuthRule")->field("id,title,name,sort,display,cls,rule_id")->order("sort asc")->select();
			foreach($table_AuthRule as $k => $v)
	        {
	            $table_AuthRule[$k]['iconCls'] = $v['cls'];
	        }
			$data = treeRule($table_AuthRule);
			$this->ajaxReturn($data);
			exit;
		}
		$this->display();
	}

	public function addRule(){
		if(IS_POST && I("addRule")){
			$table_AuthRule = M("AuthRule");
			if(!$table_AuthRule->create()){
				$msg = doReturn("","数据创建失败，未知原因，请联系管理员",false);
			} else {
				$status = $table_AuthRule->add();
				$msg = doReturn("数据添加成功","数据添加失败,未知原因，请联系管理员",$status);
			}
			$this->ajaxReturn($msg);
			exit;
		}
		$this->rule_id = I("rule_id");
		$this->display();
	}

	public function editRule(){
		if(IS_POST && I("editRule")){
			$table_AuthRule = M("AuthRule");
			if(!$table_AuthRule->create()){
				$msg = doReturn("","数据创建失败，未知原因，请联系管理员",false);
			} else {
				$status = $table_AuthRule->save();
				$msg = doReturn("数据编辑成功","数据编辑失败,未知原因，请联系管理员",$status);
			}
			$this->ajaxReturn($msg);
			exit;
		}
		$this->Rule = M("AuthRule")->find(I('id'));
		$this->display();
	}

	public function delRule(){
		/**if(IS_POST && I('id') <= 100){
			$msg = doReturn("","不允许删除系统内置规则",false);
			$this->ajaxReturn($msg);
			exit;
		}**/
		if(IS_POST && I('id')){
			$status = M("AuthRule")->delete(I('id'));
			$msg = doReturn("数据成功删除","数据删除失败，请联系管理员",$status);
			$this->ajaxReturn($msg);
			exit;
		}
	}

	public function sortRule(){
		$error_id = "";
		$status = true;
		$sortRule = I("sort");
		foreach($sortRule as $k => $v){
			$data = array(
				"id"=>$k,
				"sort"=>$v
			);
			$status = M("AuthRule")->save($data);
			if ($status === false){
				$error_id = $k;
				break;//当排序失败时，捕获错误ID，结束程序
			}
		}
		if($status !== false){
			$data["status"] = true;
			$data["info"] = "菜单排序成功";
		} else {
			$data["status"] = false;
			$data["info"] = "菜单排序失败<br />发生错误的排序ID：$error_id";
		}
		$this->ajaxReturn($data);
	}

	public function exRule(){
		$type = I('download') ? I('download') : false;
		if($type){
			$table_Rule = M("AuthRule")->select();
			header("Content-type:application/data");
			header("Content-Disposition:attachment;filename='菜单备份.data'");
			exit(base64_encode(serialize($table_Rule)));
		} else {
			$sess_downRule = strtoupper(substr(md5(time().rand(10,10000)),5,10));
			session('downRule',$sess_downRule);
			$data['status'] = true;
			$data['info'] = "菜单导出成功";
			$data['url'] = U("Core/exRule",array("download"=>$sess_downRule));
			$this->ajaxReturn($data);
		}
	}

	public function imRule(){
		if(IS_POST){
			$fileTypes = array('data'); // File extensions
			$fileParts = pathinfo($_FILES['file']['name']);
			if (in_array($fileParts['extension'],$fileTypes)) {
				//获取临时上传文件路径
				$tempFile = $_FILES['file']['tmp_name'];
				$data_Rule = file_get_contents($tempFile);
				$data_Rule = unserialize(base64_decode($data_Rule));
				if(is_array($data_Rule)){
					M("AuthRule")->where("1")->delete();
					$status = M("AuthRule")->addAll($data_Rule);
					if($status > 0){
						$data['status'] = true;
						$data['info'] = '菜单导入成功';
					} else {
						$data['status'] = false;
						$data['info'] = '菜单数据导入失败，请手动恢复你备份的菜单数据';
					}
				} else {
					$data['status'] = false;
					$data['info'] = '非法数据';
				}
				$this->ajaxReturn($data);
			} else {
				echo 'Invalid file type.';
			}
		}
	}


	/**
	 * [Group 角色管理开始]
	 */

	public function Group(){
		if(IS_POST){
			$table_AuthGroup = M('AuthGroup')->field("id,title,status,sort,id as opert_id")->order("sort asc")->page(I('page'),I('rows'))->select();
			$data = array(
				"total" => M('AuthGroup')->count(),
				"rows" => $table_AuthGroup
			);
			$this->ajaxReturn($data);
			exit;
		}
		$this->display();
	}

	public function sortGroup(){
		$error_id = "";
		$status = true;
		$sortGroup = I("sort");
		foreach($sortGroup as $k => $v){
			$data = array(
				"id"=>$k,
				"sort"=>$v
			);
			$status = M("AuthGroup")->save($data);
			if ($status === false){
				$error_id = $k;
				break;//当排序失败时，跳出循环
			}
		}
		if($status !== false){
			$data["status"] = true;
			$data["info"] = "角色排序成功";
		} else {
			$data["status"] = false;
			$data["info"] = "角色排序失败<br />发生错误的排序ID：$error_id";
		}
		$this->ajaxReturn($data);
	}

	public function addGroup(){
		if(IS_POST && I('addGroup')){
			$table_AuthGroup = M("AuthGroup");
			if(!$table_AuthGroup->create()){
				$msg = doReturn("","数据创建失败，未知原因，请联系管理员",false);
			} else {
				$status = $table_AuthGroup->add();
				$msg = doReturn("数据添加成功","数据添加失败,未知原因，请联系管理员",$status);
			}
			$this->ajaxReturn($msg);
			exit;
		}
		$this->display();
	}

	public function setGroup(){
		//配置权限操作
		if(IS_POST && I('setGroup') == 'setGroup'){
			$RuleIds = implode(",",array_unique(explode(',',I('setGroupRule'))));
			$data = array(
				'id' => I('id','0','int'),
				'rules' => $RuleIds
			);
			$status = M("AuthGroup")->save($data);
			$msg = doReturn("配置权限成功","配置权限失败,未知原因，请联系管理员",$status);
			$this->ajaxReturn($msg);
			exit;
		}
		//加载角色节点权限数据
		if(IS_POST){
			$table_AuthRule = M("AuthRule")->field("id,title as text,rule_id")->select();
			$table_AuthGroup = M("AuthGroup")->find(I('id'));
			$RuleIds = explode(",",$table_AuthGroup['rules']);
			$data = treeRule($table_AuthRule);
			$data = treeState($data,$RuleIds);
			$this->ajaxReturn($data);
		}
		if(I('id') == '1'){
			echo "不允许对超级管理员配置";
			exit;
		}
		$this->id = I('id');
		$this->display();
	}

	public function editGroup(){
		if(IS_POST && I("editGroup")){
			$table_AuthGroup = M("AuthGroup");
			if(!$table_AuthGroup->create()){
				$msg = doReturn("","数据创建失败，未知原因，请联系管理员",false);
			} else {
				$status = $table_AuthGroup->save();
				$msg = doReturn("数据编辑成功","数据编辑失败,未知原因，请联系管理员",$status);
			}
			$this->ajaxReturn($msg);
			exit;
		}
		if(I('id') == '1'){
			echo "不允许对超级管理员编辑";
			exit;
		}
		$this->Group = M("AuthGroup")->find(I('id'));
		$this->display();
	}

	public function delGroup(){
		if(I('id') == '1'){
			$msg = doReturn("","不允许删除超级管理员",false);
			exit;
		}
		if(IS_POST && I('id')){
			$status = M("AuthGroup")->delete(I('id'));
			$msg = doReturn("数据成功删除","数据删除失败，请联系管理员",$status);
			$this->ajaxReturn($msg);
			exit;
		}
	}

}