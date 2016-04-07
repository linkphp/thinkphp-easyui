<?php
/**
 * 用户管理
 * @author Link <612012@qq.com>
 */
 
namespace Admin\Controller;
use Think\Controller;
class UserController extends AuthController{
	
	public function index(){
		if(IS_POST){
			//搜索开始
			$search = I('search');
			//搜索医院对应用户
			if(trim($search['hosp_id'],' ') != '' && $search['hosp_id'] > 0){
				$table_Hosp = M("UserHosp")->where(array("hosp_id"=>$search['hosp_id']))->select();
				foreach($table_Hosp as $k => $v){
					$Hosp_Ids[] = $v['uid'];
				}
				$where['uid'] = array("in",$Hosp_Ids);
			}
			//搜索部门对应用户
			if(trim($search['branch_id'],' ') != '' && $search['branch_id'] > 0){
				$where['branch_id'] = trim($search['branch_id'],' ');
			}
			//搜索角色对应用户
			if(trim($search['group_id'],' ') != '' && $search['group_id'] > 0){
				$table_Group = M("AuthGroupAccess")->where(array("group_id"=>$search['group_id']))->select();
				foreach($table_Group as $k => $v){
					$Group_Ids[] = $v['uid'];
				}
				$where['uid'] = array("in",$Group_Ids);
			}
			//搜索对应用户名称
			if(trim($search['name'],' ') != ''){
				$where['_string'] = '(name like "%'.trim($search['name'],' ').'%")  OR ( title like "%'.trim($search['name'],' ').'%")';
			}
			$table_User = D("User")->field('pass',true)->relation(true)->where($where)->order("uid asc")->page(I('page'),I('rows'))->select();
			$data = array(
				"total" => D("User")->where($where)->count(),
				"rows" => $table_User
			);
			$this->ajaxReturn($data);
			exit;
		}
		$this->display();
	}

	public function addUser(){
		if(IS_POST && I("addUser")){
			//当密码都不为空，且不相等时进行验证判断
			if((I('pass') != '' && I('pass2') != '') && I('pass') != I('pass2')){
				$msg = doReturn("","两次密码不相等",$status);
				$this->ajaxReturn($msg);
			}
			$table_User = D("User");
			if(!$table_User->create()){
				$msg = doReturn("",$table_User->getError(),false);
			} else {
				$table_User->groups = I('groups');
				$table_User->create_date = '0000-00-00 00:00:00';
				$status = $table_User->relation(true)->add();
				$msg = doReturn("数据添加成功","数据添加失败,未知原因，请联系管理员",$status);
			}
			$this->ajaxReturn($msg);
			exit;
		}
		$this->display();
	}

	public function editUser(){
		if(I('id') == '1'){
			echo "不允许对超级管理员进行修改";
			exit;
		}
		if(IS_POST && I("editUser")){
			//当密码都不为空，且不相等时进行验证判断
			if((I('pass') != '' && I('pass2') != '') && I('pass') != I('pass2')){
				$msg = doReturn("","两次密码不相等",$status);
				$this->ajaxReturn($msg);
			}
			$table_User = D("User");
			if(!$table_User->create()){
				$msg = doReturn("","数据创建失败，未知原因，请联系管理员",false);
			} else {
				if(I('pass') == '' || I('pass2') == ''){//当没有修改密码时
					unset($table_User->pass);
				}
				$table_User->groups = I('groups');
				$status = $table_User->relation(true)->save();
				$msg = doReturn("数据编辑成功","数据编辑失败,未知原因，请联系管理员",$status);
			}
			$this->ajaxReturn($msg);
			exit;
		}
		$User = D("User")->relation(true)->find(I('id'));
		//组合用户拥有的医院
		foreach($User['hosps'] as $v){
			$tmp_HospIds[] = $v['id'];
		}
		$User['hosps'] = implode(',',$tmp_HospIds);
		//组合用户拥有的角色
		foreach($User['groups'] as $v){
			$tmp_GroupIds[] = $v['id'];
		}
		$User['groups'] = implode(',',$tmp_GroupIds);
		$this->User = $User;
		$this->display();
	}

	public function delUser(){
		if(I('id') == '1'){
			$msg = doReturn("","不允许删除超级管理员",false);
			$this->ajaxReturn($msg);
			exit;
		}
		if(IS_POST && I('id')){
			$status = D("User")->relation(true)->delete(I('id'));
			$msg = doReturn("数据成功删除","数据删除失败，请联系管理员",$status);
			$this->ajaxReturn($msg);
			exit;
		}
	}

	public function resetUserPass(){
		if(IS_POST && I("id")){
			$pass_text = str_split("abcdefghijklmnopqrstuvwxyz1234567890");
			foreach($pass_text as $k=>$v){
				if($k < 6){
					$pass_rand[] = rand(0,count($pass_text)-1);
				} else {
					break;
				}
			}
			foreach($pass_rand as $v){
				$UserPass[] = $pass_text[$v];
			}
			$data['pass'] = md5(implode('',$UserPass));
			$data['uid'] = I('id');
			$status = M("User")->save($data);
			$msg = doReturn("密码修改成功，请牢记新的登录密码：".implode('',$UserPass),"密码修改失败，请联系管理员",$status);
			$this->ajaxReturn($msg);
		}
	}

    //导出会员excel
    public  function exportExcel(){
        $users_list = M('user')->select();
        //print_r($goods_list);exit;
        $data = array();
        foreach ($users_list as $k=>$users_info){
            $data[$k][uid] = $users_info['uid'];
            $data[$k][name] = $users_info['name'];
            $data[$k][title] = $users_info['title'];
            $data[$k][phone] = $users_info['phone'];
            $data[$k][qq] = $users_info['qq'];
            $data[$k][create_date] = $users_info['create_date'];
        }
        //print_r($goods_list);
        //print_r($data);exit;

        foreach ($data as $field=>$v){
            if($field == 'uid'){
                $headArr[]='用户id';
            }

            if($field == 'name'){
                $headArr[]='用户名';
            }

            if($field == 'title'){
                $headArr[]='名字';
            }

            if($field == 'phone'){
                $headArr[]='手机';
            }

            if($field == 'qq'){
                $headArr[]='QQ';
            }

            if($field == 'create_date'){
                $headArr[]='注册时间';
            }
        }

        $filename="users_list";
        $this->getExcel($filename,$headArr,$data);
        exit;
    }

    private  function getExcel($fileName,$headArr,$data){
        //导入PHPExcel类库，因为PHPExcel没有用命名空间，只能inport导入
        import("Org.Util.PHPExcel");
        import("Org.Util.PHPExcel.Writer.Excel5");
        import("Org.Util.PHPExcel.IOFactory.php");

        $date = date("Y_m_d",time());
        $fileName .= "_{$date}.xls";

        //创建PHPExcel对象，注意，不能少了\
        $objPHPExcel = new \PHPExcel();
        $objProps = $objPHPExcel->getProperties();

        //设置表头
        $key = ord("A");
        //print_r($headArr);exit;
        foreach($headArr as $v){
            $colum = chr($key);
            $objPHPExcel->setActiveSheetIndex(0) ->setCellValue($colum.'1', $v);
            $objPHPExcel->setActiveSheetIndex(0) ->setCellValue($colum.'1', $v);
            $key += 1;
        }

        $column = 2;
        $objActSheet = $objPHPExcel->getActiveSheet();

        //print_r($data);exit;
        foreach($data as $key => $rows){ //行写入
            $span = ord("A");
            foreach($rows as $keyName=>$value){// 列写入
                $j = chr($span);
                $objActSheet->setCellValue($j.$column, $value);
                $span++;
            }
            $column++;
        }

        $fileName = iconv("utf-8", "gb2312", $fileName);
        //重命名表
        //$objPHPExcel->getActiveSheet()->setTitle('test');
        //设置活动单指数到第一个表,所以Excel打开这是第一个表
        $objPHPExcel->setActiveSheetIndex(0);
        header('Content-Type: application/vnd.ms-excel');
        header("Content-Disposition: attachment;filename=\"$fileName\"");
        header('Cache-Control: max-age=0');

        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output'); //文件通过浏览器下载
        exit;
    }
}