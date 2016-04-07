<?php if (!defined('THINK_PATH')) exit();?><div class="easyui-panel" title="个人中心 > 用户操作 > 我的资料" style="padding:20px;" data-options="fit:true">
    <table>
		<tr><td align='right'>用户id：</td><td><?php echo ($User["uid"]); ?></td></tr>
		<tr><td align='right'>登录名：</td><td><?php echo ($User["name"]); ?></td></tr>
		<tr><td align='right'>昵称：</td><td><?php echo ($User["title"]); ?></td></tr>
		<tr><td align='right'>职务：</td><td><?php echo ($User["job_title"]); ?></td></tr>
		<tr><td align='right'>手机：</td><td><?php echo ($User["phone"]); ?></td></tr>
		<tr><td align='right'>QQ：</td><td><?php echo ($User["qq"]); ?></td></tr>
		<tr><td align='right'>回访权限：</td><td><?php if($User["visit"] >= 1): ?><span class="tree-icon tree-file icons-arrow-accept"></span><?php else: ?><span class="tree-icon tree-file icons-other-cancel"></span><?php endif; ?></td></tr>
		<tr><td align='right'>用户状态：</td><td><?php if($User["status"] >= 1): ?><span class="tree-icon tree-file icons-arrow-accept"></span><?php else: ?><span class="tree-icon tree-file icons-other-cancel"></span><?php endif; ?></td></tr>
		<tr><td align='right'>数据级别：</td><td><?php if($User["data_level"] >= 1): ?><strong style="color:red;">管理</strong><?php else: ?>普通<?php endif; ?></td></tr>
		<tr><td align='right'>所在部门：</td><td><?php echo ($User["branch_title"]); ?></td></tr>
		<tr><td align='right'>授权角色：</td><td><?php echo ($Groups); ?></td></tr>
		<tr><td align='right'>创建时间：</td><td><?php echo ($User["create_date"]); ?></td></tr>
	</table>
</div>