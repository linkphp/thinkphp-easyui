<?php
/**
 * 全局自定义函数
 * @author Link <612012@qq.com>
 */

	/**
	 * 登录成功存储用户session
	 */
	function do_LoginSession(){
		$sess_Uid = session('uid');
		$table_User = M('User')->find($sess_Uid);
		$sess_User['info'] = $table_User;
		session('login_time',time());//记录登录时间戳，方便后台判断
		session('user',$sess_User);
	}
	
	/**
	 * [treeLeftMenu 左侧菜单无限级]
	 * @param  [type] $data    [左侧菜单数据]
	 * @param  [type] $rule_id [左侧菜单rule_id]
	 * @return [type]          [description]
	 */
	function treeLeftMenu($data,$rule_id){
		$tree = array();
		foreach($data as $v){
			if($v['rule_id'] == $rule_id){
				$v['children'] = treeLeftMenu($data,$v['id']);
				$tree[] = $v;
			}
		}
		return $tree;
	}
	
	/**
	 * [treeRule 菜单无限极]
	 * @param  [type] $data    [菜单数据]
	 * @param  string $rule_id [菜单rule_id]
	 * @return [type]          [description]
	 */
	function treeRule($data,$rule_id = '0'){
		$tree = array();
		foreach($data as $v){
			if($v['rule_id'] == $rule_id){
				$v['children'] = treeRule($data,$v['id']);
				$tree[] = $v;
			}
		}
		return $tree;
	}
	
	/**
	 * [treeBranch 部门无限极]
	 * @param  [type] $data    [部门数据]
	 * @param  string $branch_id [branch_id]
	 * @return [type]          [description]
	 */
	function treeBranch($data,$branch_id = '0'){
		$tree = array();
		foreach($data as $v){
			if($v['branch_id'] == $branch_id){
				$v['children'] = treeBranch($data,$v['id']);
				$tree[] = $v;
			}
		}
		return $tree;
	}
	
	/**
	 * [upload_mkdir 目录层次上传]
	 * @param  [type] $path [目录路径]
	 * @return [type]       [description]
	 */
	function upload_mkdir($path){
		$dirs = explode("/", $path);
		$current_dir = "";
		foreach($dirs as $dir){
			$current_dir .= $dir."/";
			if(!file_exists($current_dir)){
			    @mkdir($current_dir, 0755);
			}
		}
	}
	
	/**
	 * [doReturn 返回前端ajax处理数据结果]
	 * @param  string $success [成功信息]
	 * @param  string $error   [失败信息]
	 * @param  [type] $status  [处理数据结果]
	 * @return [type]          [description]
	 */
	function doReturn($success = '成功',$error = '失败',$status){
		if($status !== false){
			$msg = array(
				"status" => true,
				"info" => $success
			);
		}else{
			$msg = array(
				"status" => false,
				"info" => $error
			);
		}
		return $msg;
	}
	
	/**
	 * [p 打印函数]
	 * @param  [type] $obj [description]
	 * @return [type]      [description]
	 */
	function p($obj){
		echo "<pre>";
		print_r($obj);
		echo "</pre>";
	}
	
	/**
	 * [treeState 树形数据状态收缩]
	 * @param  [type] $data  [description]
	 * @param  [type] $rules [description]
	 * @return [type]        [description]
	 */
	function treeState($data,$rules){//其实主要用与菜单数据，其他的树形数据也可以通用
		foreach($data as $k=>$v){
			if(is_array($v['children']) && count($v['children']) != 0){
				$data[$k]["state"] = "closed";
				if(isset($rules)){//判断是否让数据具有选中效果
					$data[$k]["children"] = treeState($data[$k]["children"],$rules);
				}else{
					//如果没有规则传入，则进行树形状态收缩，比如菜单管理可以进行收缩
					$data[$k]["children"] = treeState($data[$k]["children"]);
				}
			}else{
				if(isset($rules) && in_array($v['id'],$rules)){//判断是否让数据具有选中效果
					$data[$k]["checked"] = true;
				}
			}
		}
		return $data;
	}
	
	/**
	 * [getUeditor 获取Ueditor编辑器]
	 * @return [type] [description]
	 */
	function getUEditor($id,$width,$height,$type){
		$id = isset($id) ? $id : 'Ueditor';
		$width = isset($width) ? $width : '100%';
		$height = isset($height) ? $height : '300';
		$UEditor = '<script type="text/javascript" charset="utf-8" src="'.__ROOT__.'/Public/Ueditor/ueditor.config.js"></script>
				    <script type="text/javascript" charset="utf-8" src="'.__ROOT__.'/Public/Ueditor/ueditor.all.min.js"> </script>
				    <script type="text/javascript" charset="utf-8" src="'.__ROOT__.'/Public/Ueditor/lang/zh-cn/zh-cn.js"></script>
				    <script id="'.$id.'" type="text/plain" style="width:'.$width.'px;height:'.$height.'px;"></script>';
		if(isset($type) && $type == 'easy'){//加载简洁编辑器
			$UEditor .= '<script>
				window.UEDITOR_CONFIG.toolbars= [["source","undo","redo","insertunorderedlist","insertorderedlist","unlink","link","cleardoc","selectall","drafts","simpleupload","insertimage","music","emotion","insertvideo","attachment","date","time","wordimage","map","spechars","blockquote","pasteplain","insertcode","bold","italic","underline","backcolor","strikethrough","justifyleft","justifycenter","justifyright","justifyjustify","touppercase","tolowercase","directionalityltr","directionalityrtl","indent","removeformat","formatmatch","autotypeset","customstyle","paragraph","rowspacingbottom","rowspacingtop","lineheight","fontfamily","fontsize","imagenone","imageleft","imageright","imagecenter","fontborder","subscript","superscript","forecolor","inserttable","deletetable","mergedown","mergeright","splittorows","splittocols","splittocells","mergecells","insertcol","insertrow","deletecol","deleterow","insertparagraphbeforetable","charts"],[]]
		        </script>';
	    }
		$UEditor .= '<script type="text/javascript">
				    var '.$id.' = UE.getEditor("'.$id.'");
				    </script>';
		echo $UEditor;
	}
	
	/**
	 * [writeLoginLog 记录用户登录日志数据]
	 * @return [type] [description]
	 */
	function writeLoginLog(){
		if(C('LOGIN_LOG') == 'true'){
			$sess_Uid = session('uid');
		    $Ip = new Org\Net\IpLocation('UTFWry.dat'); // 实例化类 参数表示IP地址库文件
		    $area = $Ip->getlocation(get_client_ip()); // 获取某个IP地址所在的位置
			$data = array(
				"uid" => $sess_Uid,
				"ip" => $area['ip'],
				"date" => date('Y-m-d H:i:s',time()),
				"area" => $area['area'] == '' ? '对方在服务器本地登录' : $area['area'],
				"country" => $area['country'],
				"user_agent" => $_SERVER['HTTP_USER_AGENT']
			);
			M('LoginLog')->add($data);
		}
	}
	
	/**
	 * [writeBehaviorLog 记录用户行为日志数据]
	 * @return [type] [description]
	 */
	function writeBehaviorLog(){
		if(C('BEHAVIOR_LOG') == 'true'){
			//用户行为检测动作
			$BehaviorAction = array(
				'add',//添加行为
				'del',//删除行为
				'edit',//编辑行为
				'sort',//排序行为
				'write',//写入文件行为
				'ex',//导出行为
				'im',//导入行为
				'set',//设置行为
				'seo',//优化表行为
				'back',//备份表行为
				'reset',//还原表行为
				'repair',//修复表行为
			);
			if(IS_POST){
				$BehaviorData['POST'] = $_POST;
			}
			if(IS_GET){
				$BehaviorData['GET'] = $_GET;
			}
			$BehaviorData = htmlspecialchars(json_encode($BehaviorData,JSON_UNESCAPED_UNICODE));//记录POST,GET数据信息
			foreach($BehaviorAction as $k => $v){
				if(strpos(ACTION_NAME,$v) !== false){
					$table_AuthRule = M("AuthRule")->where(array('name'=>CONTROLLER_NAME.'/'.ACTION_NAME))->find();
					$sess_Uid = session('uid');
				    $Ip = new Org\Net\IpLocation('UTFWry.dat'); // 实例化类 参数表示IP地址库文件
				    $area = $Ip->getlocation(get_client_ip()); // 获取某个IP地址所在的位置
					$data = array(
						"uid" => $sess_Uid,
						"ip" => $area['ip'],
						"date" => date('Y-m-d H:i:s',time()),
						"area" => $area['area'] == '' ? '对方在服务器本地操作' : $area['area'],
						"country" => $area['country'],
						"user_agent" => $_SERVER['HTTP_USER_AGENT'],
						"controller_name" => "执行 ".$table_AuthRule['title'],
						"controller_action" => CONTROLLER_NAME.'/'.ACTION_NAME,
						"json_data" => $BehaviorData
					);
					M('BehaviorLog')->add($data);
				}
			}
		}
	}
	
	/**
	 * 生成永远唯一的码
	 * @return string
	 */
	function create_guid($namespace = null) {
	    static $guid = '';
	    $uid = uniqid ( "", true );
	    $data = $namespace;
	    $data .= $_SERVER ['REQUEST_TIME'];     // 请求那一刻的时间戳
	    $data .= $_SERVER ['HTTP_USER_AGENT'];  // 获取访问者在用什么操作系统
	    $data .= $_SERVER ['SERVER_ADDR'];      // 服务器IP
	    $data .= $_SERVER ['SERVER_PORT'];      // 端口号
	    $data .= $_SERVER ['REMOTE_ADDR'];      // 远程IP
	    $data .= $_SERVER ['REMOTE_PORT'];      // 端口信息
	    $hash = strtoupper ( hash ( 'ripemd128', $uid . $guid . md5 ( $data ) ) );
	    //$guid = substr ( $hash, 0, 8 ) . '-' . substr ( $hash, 8, 4 ) . '-' . substr ( $hash, 12, 4 ) . '-' . substr ( $hash, 16, 4 ) . '-' . substr ( $hash, 20, 12 );
	    $guid = substr ( $hash, 16, 4 ) . '-' . substr ( $hash, 20, 12 );
	    return $guid;
	}

	/**
	 * CURL的get方法
	 * @return array
	 */
	function curl_get($url){
		$ch = curl_init($url) ;
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_BINARYTRANSFER, true);
		$output = curl_exec($ch);
		$result = json_decode($output,true);
		return $result;
	}

	/**
	 * 	作用：array转xml
	 */
	function arrayToXml($arr){
        $xml = "<xml>";
        foreach ($arr as $key=>$val){
        	 if (is_numeric($val)){
        	 	$xml.="<".$key.">".$val."</".$key.">";
        	 }else{
        	 	$xml.="<".$key."><![CDATA[".$val."]]></".$key.">";
        	}
    	}
        $xml.="</xml>";
        return $xml;
    }

	/**
	 * 	作用：将xml转为array
	 */
	function xmlToArray($xml){
        //将XML转为array
        $array_data = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
		return $array_data;
	}

	/**
	 * 	作用：以post方式提交xml到对应的接口url
	 */
	function postXmlCurl($xml,$url,$second=30){
        //初始化curl
       	$ch = curl_init();
		//设置超时
		curl_setopt($ch, CURLOP_TIMEOUT, $second);
        //这里设置代理，如果有的话
        //curl_setopt($ch,CURLOPT_PROXY, '8.8.8.8');
        //curl_setopt($ch,CURLOPT_PROXYPORT, 8080);
        curl_setopt($ch,CURLOPT_URL, $url);
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,FALSE);
		//设置header
		curl_setopt($ch, CURLOPT_HEADER, FALSE);
		//要求结果为字符串且输出到屏幕上
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
		//post提交方式
		curl_setopt($ch, CURLOPT_POST, TRUE);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
		//运行curl
        $data = curl_exec($ch);
		curl_close($ch);
		//返回结果
		if($data){
			curl_close($ch);
			return $data;
		}else{
			$error = curl_errno($ch);
			echo "curl出错，错误码:$error"."<br>";
			echo "<a href='http://curl.haxx.se/libcurl/c/libcurl-errors.html'>错误原因查询</a></br>";
			curl_close($ch);
			return false;
		}
	}

	/**
	 * 	作用：使用证书，以post方式提交xml到对应的接口url
	 */
	function postXmlSSLCurl($xml,$url,$second=30){
		$ch = curl_init();
		//超时时间
		curl_setopt($ch,CURLOPT_TIMEOUT,$second);
		//这里设置代理，如果有的话
        //curl_setopt($ch,CURLOPT_PROXY, '8.8.8.8');
        //curl_setopt($ch,CURLOPT_PROXYPORT, 8080);
        curl_setopt($ch,CURLOPT_URL, $url);
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,FALSE);
		//设置header
		curl_setopt($ch,CURLOPT_HEADER,FALSE);
		//要求结果为字符串且输出到屏幕上
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,TRUE);
		//设置证书
		//使用证书：cert 与 key 分别属于两个.pem文件
		//默认格式为PEM，可以注释
		curl_setopt($ch,CURLOPT_SSLCERTTYPE,'PEM');
		curl_setopt($ch,CURLOPT_SSLCERT, $this->SSLCERT_PATH);
		//默认格式为PEM，可以注释
		curl_setopt($ch,CURLOPT_SSLKEYTYPE,'PEM');
		curl_setopt($ch,CURLOPT_SSLKEY, $this->SSLKEY_PATH);
		//post提交方式
		curl_setopt($ch,CURLOPT_POST, true);
		curl_setopt($ch,CURLOPT_POSTFIELDS,$xml);
		$data = curl_exec($ch);
		//返回结果
		if($data){
			curl_close($ch);
			return $data;
		}else {
			$error = curl_errno($ch);
			echo "curl出错，错误码:$error"."<br>";
			echo "<a href='http://curl.haxx.se/libcurl/c/libcurl-errors.html'>错误原因查询</a></br>";
			curl_close($ch);
			return false;
		}
	}