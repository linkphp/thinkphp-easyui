<?php if (!defined('THINK_PATH')) exit();?><form id="editRule" action="<?php echo U('Core/editRule');?>" method="post">
	<input type="hidden" name="editRule" value="editRule" />
	<input type="hidden" name="id" value="<?php echo ($Rule["id"]); ?>" />
	<table cellspacing="6" width="100%">
		<tr>
			<td width="60">上级菜单：</td>
			<td><input class="easyui-combotree" data-options="url:'<?php echo U('Base/treeRule');?>'" name="rule_id" value="<?php echo ($Rule["rule_id"]); ?>" style="width:230px;height:24px" /></td>
		</tr>
		<tr>
			<td>菜单名称：</td>
			<td><input class="easyui-textbox" data-options="required:true,validType:['length[2,20]']"  name="title" type="text" style="width:220px" value="<?php echo ($Rule["title"]); ?>" /></td>
		</tr>
		<tr>
			<td>菜单规则：</td>
			<td><input class="easyui-textbox" data-options="required:true,validType:['length[2,40]','remote[\'<?php echo U('Base/checkEditRule',array('id'=>$Rule['id']));?>\',\'name\']']" name="name" type="text" style="width:220px" value="<?php echo ($Rule["name"]); ?>" /></td>
		</tr>
		<tr>
			<td>菜单排序：</td>
			<td><input class="easyui-textbox" data-options="required:true,validType:['length[1,20]']"  name="sort" type="text" style="width:220px" value="<?php echo ($Rule["sort"]); ?>" /></td>
		</tr>
		<tr>
			<td>菜单图标：</td>
			<td>
				<input id="Core_Rule_icons_input" name="cls" type="hidden" value="<?php echo ($Rule["cls"]); ?>" />
				<strong id="Core_Rule_icons"><span class="tree-icon tree-file <?php echo ($Rule["cls"]); ?>"></span></strong>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Show_Core_Rule_icons()">选择图标</a>
			</td>
		</tr>
		<tr>
			<td>是否显示：</td>
			<td>
				<label><input name="display" value="1" type="radio" <?php if($Rule.display): ?>checked<?php endif; ?> />是</label>
				<label><input name="display" value="0" type="radio" <?php if($Rule["display"] == 0): ?>checked<?php endif; ?> />否</label>
			</td>
		</tr>
		<tr>
			<td></td>
			<td align="right">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="$.Oa.confirm('$.Oa.doForm(\'#editRule\')')">编辑菜单</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$($.Oa.dialog_1).dialog('close')">关闭窗口</a>
			</td>
		</tr>
	</table>
</form>
<script>
function Select_Core_Rule_icons(cls){
	$("#Core_Rule_icons").html('<span class="tree-icon tree-file '+cls+'"></span>');
	$("#Core_Rule_icons_input").val(cls);
	$($.Oa.dialog_2).dialog("close");
}
function Show_Core_Rule_icons(){
	$($.Oa.dialog_2).dialog({
		title: "选择图标",
		width: '387',
		height: '300',
		left: $("#Core_Rule_icons").offset().left+100+"px",
		top: "230px",
		content: $.Oa.loading("正在加载图标中..."),
		modal: true
	});
	$.post("<?php echo U('Base/iconsCls');?>","",function(data){
		if(typeof data == 'object'){
			var content = [];
			for(x in data){
				content[x] = "<span class='tree-icon tree-file "+data[x]+"' onclick=\"Select_Core_Rule_icons('"+data[x]+"')\" style='cursor:pointer;'></span>";
			}
			$($.Oa.dialog_2).dialog({content: "<div style='padding:10px;'>"+content.join(" ")+"</div>"});
		} else {
			$($.Oa.dialog_2).dialog({content: "<div style='padding:10px;'>图标加载失败，请联系管理员！</div>"});
		}
	},'json').error(function(){
		$.messager.progress({text:"读取图标信息失败，请联系管理员，3秒后自动关闭..."});
		setTimeout("$.messager.progress('close')",3000);
	});

}
</script>