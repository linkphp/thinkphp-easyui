<?php
/**
 * 数据库管理
 * @author Link <612012@qq.com>
 */

namespace Admin\Controller;
use Think\Controller;
class DbController extends AuthController{

	/**
	 * 数据库管理首页
	 */
	public function index(){
		$tables = M()->query("SHOW TABLES");
		if(IS_POST){
			$db_Info = M()->query("SHOW TABLE STATUS FROM `".C("DB_NAME").'`');
			$this->ajaxReturn($db_Info);
		}
		$this->display();
	}

	/**
	 * 优化表
	 */
	public function seoDb(){
		//设置程序不超时
		set_time_limit(0);
		//单个表进行优化
		if(IS_POST && I("type") == 'one'){
			$status = M()->query("OPTIMIZE TABLE ".I("table"));
			$msg = doReturn("成功优化 ".I("table")." 表","优化表 ".I('table')."",$status);
			$this->ajaxReturn($msg);
		}
		//所有表进行优化
		else if(IS_POST && I("type") == 'all'){
			$tables = M()->query("SHOW TABLES");
			$table_status = true;
			foreach($tables as $k=>$v){
				$status = M()->query("OPTIMIZE TABLE ".$v['tables_in_'.C("DB_NAME")]);
				if($status === false){
					$error_table = $v['tables_in_'.C("DB_NAME")];
					$table_status = false;
					break;
				}
			}
			//捕获执行不成功表名输出前台
			if($table_status === false){
				$msg = doReturn('','优化表失败，断点表：'.$error_table,false);
				$this->ajaxReturn($msg);
			}
			$msg = doReturn("成功优化所有表");
			$this->ajaxReturn($msg);
		}
	}

	/**
	 * 修复表
	 */
	public function repairDb(){
		//设置程序不超时
		set_time_limit(0);
		//单个表进行修复
		if(IS_POST && I("type") == 'one'){
			$status = M()->query("REPAIR TABLE ".I("table"));
			$msg = doReturn("成功修复 ".I("table")." 表","修复表 ".I('table')."",$status);
			$this->ajaxReturn($msg);
		}
		//所有表进行修复
		else if(IS_POST && I("type") == 'all'){
			$tables = M()->query("SHOW TABLES");
			$table_status = true;
			foreach($tables as $k=>$v){
				$status = M()->query("REPAIR TABLE ".$v['tables_in_'.C("DB_NAME")]);
				if($status === false){
					$error_table = $v['tables_in_'.C("DB_NAME")];
					$table_status = false;
					break;
				}
			}
			//捕获执行不成功表名输出前台
			if($table_status === false){
				$msg = doReturn('','修复表失败，断点表：'.$error_table,false);
				$this->ajaxReturn($msg);
			}
			$msg = doReturn("成功修复所有表");
			$this->ajaxReturn($msg);
		}
	}

}