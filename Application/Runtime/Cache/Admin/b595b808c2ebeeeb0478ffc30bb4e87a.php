<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo (C("TITLE")); ?></title>
<script src="/Public/Framework/Easyui/jquery.min.js"></script>
<script src="/Public/Framework/Easyui/jquery.easyui.min.js"></script>
<script src="/Public/Framework/Easyui/plugins/jquery.portal.js"></script>
<script src="/Public/Framework/Easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="/Public/Framework/Easyui/themes/bootstrap/easyui.css" id="theme">
<link rel="stylesheet" href="/Public/Framework/Easyui/themes/icon.css">
<link rel="stylesheet" href="/Public/Css/icons.css">
<script src="/Public/Js/jQuery.cookie.js"></script>
<script src="/Public/Js/jQuery.oa.js"></script>
<script src="/Public/Js/easyui.rules.js"></script>
<!--实例化百度编辑器所在位置-->
<script>window.UEDITOR_HOME_URL = "/Public/Ueditor/";</script>
<link rel="stylesheet" href="/Public/Css/main.css">
<!--Uploadify上传控件-->
<link rel="stylesheet" type="text/css" href="/Public/Framework/Uploadify/Huploadify.css"/>
<script type="text/javascript" src="/Public/Framework/Uploadify/jquery.Huploadify.js"></script>
<!--Uploadify上传控件-->
</head>

<body class="easyui-layout">

    <!--头部-->
    <div id="north" data-options="region: 'north'" style="height:80px;overflow:hidden;">
        <ul class="link-north-head">
            <li class="pull-left"><h1><?php echo (C("TITLE")); ?>_<?php echo (C("OA_VERSION")); ?></h1></li>
            <li class="pull-right">
            	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#oa-user-menu',iconCls:'icons-user-user'">快捷操作</a>
            </li>
        </ul>
        <div class="link-north-navbar">
			<ul>
				<?php if(is_array($table_AuthRule)): $i = 0; $__LIST__ = $table_AuthRule;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$table_AuthRule): $mod = ($i % 2 );++$i;?><li><a href="javascript:void(0);" class="link-navbar-button" data-url="<?php echo U('Index/getLeftMenu',array('id'=>$table_AuthRule[id]));?>"><?php echo ($table_AuthRule["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                
			</ul>
        </div>
    </div>
    
    <!--Left-->
    <div id="west" data-options="region: 'west'" style="width:200px;">
        <div id="left" class="easyui-accordion" data-options="fit:false,border:false"></div>
    </div>
    
    <!--Center-->
    <div id="center" data-options="region:'center',fit:false,border:false">
        <div id="oa-tabs">
            <div title="后台首页" href="<?php echo U('Index/main');?>" data-options="cache:true,tools:[{iconCls:'icon-mini-refresh',handler:function(){var tab = $('#oa-tabs').tabs('getSelected');tab.panel('refresh',tab[0]['baseUrl']);}}]"></div>
        </div>
    </div>
    
    <!--有时会需要两个dialog框-->
    <div id="oa-dialog-1"></div>
    <div id="oa-dialog-2"></div>

    <script type="text/javascript">
        //检测是否登录
        setInterval('$.Oa.sess_verify(\"<?php echo U("Login/session_timeout");?>\",\"<?php echo U("Login/logout");?>\")',10000);
    </script>
    <script src="/Public/Js/main.js"></script>
    
    <!--顶部下拉-->
    <div id="oa-user-menu">
        <div>
            <span>切换主题</span>
            <div id="toparea-help-theme-box">
                <div onclick="$.Oa.theme('default')">Easyui</div>
                <div onclick="$.Oa.theme('bootstrap')">Bootstrap</div>
                <div onclick="$.Oa.theme('gray')">Gray</div>
                <div onclick="$.Oa.theme('metro')">Metro</div>
                <div onclick="$.Oa.theme('black')">Black</div>
            </div>
        </div>
        <div data-options="iconCls:'icons-user-user_go'"><a style="text-decoration: none;color:#333;" href="<?php echo U('Login/logout');?>">退出登录</a></div>
    </div>
    
</body>
</html>