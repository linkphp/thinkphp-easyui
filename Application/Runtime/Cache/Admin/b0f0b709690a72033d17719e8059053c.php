<?php if (!defined('THINK_PATH')) exit();?><div class="easyui-panel" data-options="fit:true,title:'后台首页',border:false,onResize:function(){$('#oa-main-portal').portal({border:false,fit:true});}" style="overflow-x:hidden;">
	<div id="oa-main-portal">
		<div style="width:50%">
			<div title="我的信息" collapsible="true" style="padding:8px;">
				您好，<?php echo ($sess_User['info']['name']); ?><br />
				所属角色：<?php echo ($Groups); ?> <br />
				最后登录IP：<?php echo ($last_Login['ip']); ?><br />
				最后登录时间：<?php echo ($last_Login['date']); ?><br />
				最后登录地点：<?php echo ($last_Login['country']); ?><br />
				最后登录网络：<?php echo ($last_Login['area']); ?>
			</div>

			<div title="近期登录" collapsible="true" style="padding:8px;">
				<?php if(is_array($lately_Login)): foreach($lately_Login as $key=>$lately_Login): ?>[<?php echo ($lately_Login["date"]); ?>] 登录IP：<?php echo ($lately_Login["ip"]); ?><br/><?php endforeach; endif; ?>
			</div>
		</div>

		<div style="width:50%">

			<div title="<?php echo ($safe_Info["title"]); ?>" collapsible="true" style="padding:8px;">
				<?php echo (htmlspecialchars_decode($safe_Info["content"])); ?>
			</div>

			<div title="<?php echo ($system_Info["title"]); ?>" collapsible="true" style="padding:8px;">
				<?php echo (htmlspecialchars_decode($system_Info["content"])); ?>
			</div>
		</div>
	</div>

</div>