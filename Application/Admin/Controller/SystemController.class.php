<?php
/**
 * 系统设置
 * @author Link <612012@qq.com>
 */
 
namespace Admin\Controller;
use Think\Controller;
class SystemController extends AuthController{

	public function Setting(){
		if(IS_POST){
			$table_Config = D('ConfigView')->select();
			$this->ajaxReturn($table_Config);
			exit;
		}
		$this->display();
	}

	public function editSetting(){
		if(IS_POST){
			$array_Config = I('data');
			if(is_array($array_Config)){
				foreach($array_Config as $k=>$v){
					$status = M("Config")->where(array("key"=>$v['key']))->save(array("value"=>$v['value']));
					if($status === false) {
						$false_key = $v['key'];
						break;
					}
				}
				$msg = doReturn("配置成功更新","配置更新被中止，可能更新错误KEY：$false_key",$status);
			} else {
				$msg = doReturn("","当前配置没有被更改",false);
			}
			$this->ajaxReturn($msg);
		}
	}

	public function writeSetting(){
		if(IS_POST){
			//读取数据库配置
			$config = D("ConfigCate")->relation(true)->select();
			$config_php = "<?php \r\nreturn array(";
			foreach($config as $k=>$v){
				$config_php .= "\r\n\t/*".$v['title']."*/\r\n";
				foreach($v['configs'] as $k2 => $v2){
					//判断是否有引号
					$v2['value'] = htmlspecialchars_decode($v2['value']);
					if(preg_match("/\'/",$v2['value']) || preg_match('/\"/',$v2['value'])){
						$config_php .= "\r\n\t'".$v2['key']."' => ".$v2['value'].",/*".$v2['name']."*/\r\n";
					}
					else{
						$config_php .= "\r\n\t'".$v2['key']."' => '".$v2['value']."',/*".$v2['name']."*/\r\n";
					}
				}
			}
			$config_php .= "\r\n);";
			$status = file_put_contents(APP_PATH."Common/Conf/system.config.php",$config_php);
			$msg = doReturn("配置文件成功生成","配置文件生成失败，请联系管理员",$status);
			$this->ajaxReturn($msg);
			exit;
		}
		echo "确定要生成新的配置文件吗？";
	}
	
}