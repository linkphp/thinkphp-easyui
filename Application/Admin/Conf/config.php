<?php
/**
 * 后台配置
 * @author Link <612012@qq.com>
 */
return array(

	/*URL配置*/
    'URL_CASE_INSENSITIVE' => true,				// 默认false 表示URL区分大小写 true则表示不区分大小写
    'URL_MODEL' => 2,							// 0 (普通模式); 1 (PATHINFO 模式); 2 (REWRITE  模式); 3 (兼容模式)
    'ACTION_SUFFIX' => '',						//操作方法后缀
    'URL_PATHINFO_DEPR' => '/',					// PATHINFO模式下，各参数之间的分割符号
    'URL_HTML_SUFFIX' => '',				// URL伪静态后缀,U方法生成后缀
    'URL_DENY_SUFFIX' => 'ico|png|gif|jpg',		// URL禁止访问的后缀设置
    
    /*微信配置*/
	'AppID' =>	'',								//AppID(应用ID)
	'AppSecret' =>	'',							//AppSecret(应用密钥)
	'Token' =>	'',								//微信后台填写的TOKEN
	'EncodingAESKey' =>	'',						//消息加密KEY（EncodingAESKey）
	'MCHID' =>	'',								//微信支付商户id
	'KEY' =>	'',								//微信支付key
);