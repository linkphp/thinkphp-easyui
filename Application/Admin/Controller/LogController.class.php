<?php
/**
 * 日志管理
 * @author Link <612012@qq.com>
 */
 
namespace Admin\Controller;
use Think\Controller;
class LogController extends AuthController{
	
	/**
	 * 登录日志
	 */
	public function LoginLog(){
		if(IS_POST){
			$search = I('search');
			if(trim($search['name'],' ') != ''){
				$where['User.name'] = trim($search['name'],' ');
			}
			if($search['date_begin'] != '' && $search['date_end'] != ''){
				$where['unix_timestamp(LoginLog.date)'] = array("between",array(strtotime($search['date_begin']),strtotime($search['date_end'])));
			}
			$table_LoginLog = D('LoginLogView')->where($where)->order("LoginLog.id desc")->page(I('page'),I('rows'))->select();
			$data = array(
				"total" => D('LoginLogView')->where($where)->count(),
				"rows" => $table_LoginLog
			);
			$this->ajaxReturn($data);
			exit;
		}
		$this->display();
	}

	/**
	 * 删除登录日志
	 */
	public function delLoginLog(){
		if(IS_POST && I("id") == 'lastMonth'){
			$where['unix_timestamp(date)'] = array("between",array(strtotime(date('Y-m-01', strtotime('-1 month'))),strtotime(date('Y-m-t 23:59:59', strtotime('-1 month')))));
			$status = M("LoginLog")->where($where)->delete();
			$msg = doReturn("数据成功删除","数据删除失败，请联系管理员",$status);
			$this->ajaxReturn($msg);
			exit;
		}
	}

	/**
	 * 行为日志
	 */
	public function BehaviorLog(){
		if(IS_POST){
			$search = I('search');
			if(trim($search['name'],' ') != ''){
				$where['User.name'] = trim($search['name'],' ');
			}
			if($search['date_begin'] != '' && $search['date_end'] != ''){
				$where['unix_timestamp(BehaviorLog.date)'] = array("between",array(strtotime($search['date_begin']),strtotime($search['date_end'])));
			}
			$table_BehaviorLog = D('BehaviorLogView')->where($where)->order("BehaviorLog.id desc")->page(I('page'),I('rows'))->select();
			$data = array(
				"total" => D('BehaviorLogView')->where($where)->count(),
				"rows" => $table_BehaviorLog
			);
			$this->ajaxReturn($data);
			exit;
		}
		$this->display();
	}

	/**
	 * 删除行为日志
	 */
	public function delBehaviorLog(){
		if(IS_POST && I("id") == 'lastMonth'){
			$where['unix_timestamp(date)'] = array("between",array(strtotime(date('Y-m-01', strtotime('-1 month'))),strtotime(date('Y-m-t 23:59:59', strtotime('-1 month')))));
			$status = M("BehaviorLog")->where($where)->delete();
			$msg = doReturn("数据成功删除","数据删除失败，请联系管理员",$status);
			$this->ajaxReturn($msg);
			exit;
		}
	}
	
}