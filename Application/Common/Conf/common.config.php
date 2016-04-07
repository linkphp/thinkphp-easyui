<?php
/**
 * 全局配置文件
 * 格式：'配置项'=>'配置值'
 * @author Link <612012@qq.com>
 */
return array(

	/*应用配置*/
	'DEFAULT_MODULE' => 'Admin',									// 默认模块
	'SITE_URL' => 'http://localhost.thinkphp-easyui.com',			//定义网站域名
	'SHOW_PAGE_TRACE' => true,										//调试模式
	'TMPL_L_DELIM' => '<{',											//模板引擎普通标签开始标记
	'TMPL_R_DELIM' => '}>',											//模板引擎普通标签结束标记
	
	/*SESSION参数*/
	'SESSION_PREFIX' => '',											//session 前缀
	'SESSION_TYPE' => 'Db',											//session hander类型 默认无需设置 除非扩展了session hander驱动
	'SESSION_OPTIONS' => array(),									//session 配置数组 支持type name id path expire domain 等参数
	'SESSION_AUTO_START' => true,									//是否自动开启Session
	
	/*AUTH认证参数*/
	'ADMIN' => 1,													//超级管理员ID
	'AUTH_CONFIG' =>array(
		'AUTH_ON' => true,											//认证开关
		'AUTH_TYPE' => 1,											// 认证方式，1为时时认证；2为登录认证。
		'AUTH_GROUP' => 'think_auth_group',							//用户组数据表名
		'AUTH_GROUP_ACCESS' => 'think_auth_group_access',			//用户组明细表
		'AUTH_RULE' => 'think_auth_rule',							//权限规则表
		'AUTH_USER' => 'think_user'									//用户信息表
	),
	
	/*错误信息参数*/
	'SHOW_ERROR_MSG' =>	false,
	'ERROR_MESSAGE'  =>	'发生错误！',
	
	/*自定义参数*/
	'OA_VERSION' =>	'1.0.160307[开发版]'
);
?>