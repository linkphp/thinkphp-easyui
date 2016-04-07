<?php
/**
 * 个人信息管理
 * @author Link <612012@qq.com>
 */
 
namespace Admin\Controller;
use Think\Controller;
class PersonController extends BaseController {

	/**
	 * 个人资料
	 */
    public function MyProfiles(){
    	$sess_Uid = session('uid');
    	$table_User = D("User")->field("pass",true)->relation(true)->find($sess_Uid);
    	foreach($table_User['groups'] as $v){
    		$groups[] = $v['title'];
    	}
    	$this->Groups = implode(',',$groups);
    	$this->User = $table_User;
        $this->display();
    }

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
			$sess_Uid = session('uid');
			$where['LoginLog.uid'] = $sess_Uid;
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
	 * 删除上月的log数据
	 */
	public function delLoginLog(){
		if(IS_POST && I("id") == 'lastMonth'){
			$where['unix_timestamp(date)'] = array("between",array(strtotime(date('Y-m-01', strtotime('-1 month'))),strtotime(date('Y-m-t 23:59:59', strtotime('-1 month')))));
			$sess_Uid = session('uid');
			$where['uid'] = $sess_Uid;
			$status = M("LoginLog")->where($where)->delete();
			$msg = doReturn("数据成功删除","数据删除失败，请联系管理员",$status);
			$this->ajaxReturn($msg);
			exit;
		}
	}

    /**
	 * 删除所有的日志
	 */
    public  function delAllLoginLog(){
        if(IS_POST && I("id") == 'AllMonth'){
            $sess_Uid = session('uid');
            $where['uid'] = $sess_Uid;
            $status = M("LoginLog")->where($where)->delete();
            $msg = doReturn("数据成功删除","数据删除失败，请联系管理员",$status);
            $this->ajaxReturn($msg);
            exit;
        }
    }

	/**
	 * 修改密码
	 */
    public function EditPass(){
    	if(IS_POST && I("EditPass")){
			if(C("SHOW_PAGE_TRACE") == 'true'){
				$msg = doReturn("","调试模式下不允许进行密码修改",false);
				$this->ajaxReturn($msg);
			}
    		$sess_Uid = session('uid');
    		$table_User = M('User')->find($sess_Uid);
    		if($table_User['pass'] != md5(I('oldpass'))){
    			$msg = doReturn("","修改密码失败，当前密码输入错误！",false);
				$this->ajaxReturn($msg);
    		}
    		if(md5(I('pass2')) != md5(I('pass'))){
    			$msg = doReturn("","修改密码失败，两次密码输入不正确！",false);
				$this->ajaxReturn($msg);
    		}
    		$data['pass'] = md5(I('pass'));
    		$data['uid'] = $sess_Uid;
    		$status = M("User")->save($data);
    		$msg = doReturn("密码修改成功，请牢记你的新密码：".I('pass'),"密码修改失败，请联系管理员",$status);
			$this->ajaxReturn($msg);
    		exit;
    	}
        $this->display();
    }

}