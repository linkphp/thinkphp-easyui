<?php if (!defined('THINK_PATH')) exit();?><form id="editBranch" action="<?php echo U('Core/editBranch');?>" method="post">
	<input type="hidden" name="editBranch" value="editBranch" />
	<input type="hidden" name="id" value="<?php echo ($Branch["id"]); ?>" />
	<table cellspacing="6" width="100%">
		<tr>
			<td width="60">上级部门：</td>
			<td><input class="easyui-combotree" data-options="url:'<?php echo U('CoreCommon/treeListBranch');?>'" name="branch_id" value="<?php echo ($Branch["branch_id"]); ?>" style="width:230px;height:24px" /></td>
		</tr>
		<tr>
			<td>部门名称：</td>
			<td><input class="easyui-textbox" data-options="required:true,validType:['length[2,20]']"  name="title" type="text" style="width:220px" value='<?php echo ($Branch["title"]); ?>' /></td>
		</tr>
		<tr>
			<td>部门排序：</td>
			<td><input class="easyui-textbox" data-options="required:true,validType:['length[1,20]']"  name="sort" type="text" style="width:220px" value="<?php echo ($Branch["sort"]); ?>" /></td>
		</tr>
		<tr>
			<td></td>
			<td align="right">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="$.Oa.confirm('$.Oa.doForm(\'#editBranch\')')">编辑部门</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$($.Oa.dialog_1).dialog('close')">关闭窗口</a>
			</td>
		</tr>
	</table>
</form>