<?php if (!defined('THINK_PATH')) exit();?><table id="Core_User"></table>
<div id="Core_User_Search">
	<table cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td>
					<a href="javascript:void(0)" class="l-btn l-btn-small l-btn-plain" onclick="Core_User.add()">
						<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">添加</span><span class="l-btn-icon icons-table-table_add">&nbsp;</span></span>
					</a>
					<a href="javascript:void(0)" class="l-btn l-btn-small l-btn-plain" onclick="$.Oa.refresh()">
						<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">刷新</span><span class="l-btn-icon icons-table-table_refresh">&nbsp;</span></span>
					</a>
                    <a href="javascript:void(0)" class="l-btn l-btn-small l-btn-plain" onclick="Core_User.exportExcel()">
                        <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">导出Excel</span><span class="l-btn-icon icons-table-table_lightning">&nbsp;</span></span>
                    </a>
					<br />
					<form id="Core_User_Search_Form" style="float:right">
						<span style="padding-left:10px;">用户名：</span><input name="search[name]" class="easyui-textbox" style="width:120px">
						<span style="padding-left:10px;">用户：</span><input name="search[branch_id]" class="easyui-combobox" style="width:120px" data-options="valueField: 'id',textField: 'title',url: '<?php echo U('CoreCommon/listBranch');?>/type/all'">
						<span style="padding-left:10px;">角色：</span><input name="search[group_id]" class="easyui-combobox" style="width:120px" data-options="valueField: 'id',textField: 'title',url: '<?php echo U('CoreCommon/listGroup');?>/type/all'">
						<a href="javascript:;" onclick="Core_User.search()" class="easyui-linkbutton" iconCls="icons-table-table">搜索</a>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<script type="text/javascript">
window.Core_User = {
	//工具栏
	toolbar: "#Core_User_Search",
	//搜索
	search: function(){
		$("#Core_User").datagrid('loadData', { total: 0, rows: [] });
		var queryParams = $("#Core_User").datagrid('options').queryParams;
		$.each($("#Core_User_Search_Form").serializeArray(), function() {
			queryParams[$(this).attr('name')] = $(this).attr('value');
		});
		$("#Core_User").datagrid({pageNumber: 1});
	},

	//状态格式化
	status: function(value){
		if(value >= 1){//为真时
			return '<span class="oa-block tree-icon tree-file icons-arrow-accept"></span>';
		} else {
			return '<span class="oa-block tree-icon tree-file icons-other-cancel"></span>';
		}
	},

	//数据管理级别格式化
	data_level: function(value){
		if(value >= 1){//为真时
			return '<strong style="color:red;">管理</strong>';
		} else {
			return '普通';
		}
	},

	//显示角色
	show_group:function(value,row){
		if(row.uid == '1'){
			return "超级管理员";
		} else {
			return '<a href="javascript:void(0)" onclick="Core_User.show_group_dialog('+row.uid+')">查看详细</a>';
		}
	},

	//查看用户角色
	show_group_dialog: function(uid){
		var row = $("#Core_User").datagrid('selectRecord',uid);
		row = $("#Core_User").datagrid('getSelected');
		var content = '';
		var groups = [];

		//组合用户所拥有的角色
		for(x in row['groups']){
			groups.push(row['groups'][x]['title']);
		}
		content += '<table cellspacing="6" width="100%">';
		content += '<tr><td align="right" width="80">用户ID：</td><td>'+row['uid']+'</td></tr>';
		content += '<tr><td align="right">登录账号：</td><td>'+row['name']+'</td></tr>';
		content += '<tr><td align="right">用户昵称：</td><td>'+row['title']+'</td></tr>';
		content += '<tr><td align="right">授权角色：</td><td>'+groups.join(',')+'</td></tr>';
		content += '</table>';
		$($.Oa.dialog_1).dialog({
			title: '用户授权角色',
			iconCls: 'icons-application-application_view_detail',
			width: 380,
			height: 300,
			cache: false,
			href: null,
			content: content,
			modal: true,
			collapsible: false,
			minimizable: false,
			resizable: true,
			maximizable: true
		});
	},

	//操作格式化
	opert: function(value,row,index){
		return '<a href="javascript:void(0);" onclick="Core_User.show('+row.uid+')">查看</a> | <a href="javascript:void(0);" onclick="Core_User.resetUserPass('+row.uid+')">重置密码</a>';

	},

	//查看用户
	show: function(uid){
		//var rows=$('#Core_User').datagrid('getRows');
		var row = $("#Core_User").datagrid('selectRecord',uid);
		row = $("#Core_User").datagrid('getSelected');
		var content = '';
		var groups = [];

		//组合用户所拥有的角色
		for(x in row['groups']){
			groups.push(row['groups'][x]['title']);
		}
		content += '<table cellspacing="6" width="100%">';
		content += '<tr><td align="right" width="80">用户ID：</td><td>'+row['uid']+'</td></tr>';
		content += '<tr><td align="right">登录账号：</td><td>'+row['name']+'</td></tr>';
		content += '<tr><td align="right">用户昵称：</td><td>'+row['title']+'</td></tr>';
		content += '<tr><td align="right">工作职务：</td><td>'+row['job_title']+'</td></tr>';
		content += '<tr><td align="right">联系电话：</td><td>'+row['phone']+'</td></tr>';
		content += '<tr><td align="right">联系QQ：</td><td>'+row['qq']+'</td></tr>';
		content += '<tr><td align="right">回访权限：</td><td>'+(row['visit']>=1 ? '<span class="tree-icon tree-file icons-arrow-accept"></span>' : '<span class="tree-icon tree-file icons-other-cancel"></span>')+'</td></tr>';
		content += '<tr><td align="right">用户状态：</td><td>'+(row['status']>=1 ? '<span class="tree-icon tree-file icons-arrow-accept"></span>' : '<span class="tree-icon tree-file icons-other-cancel"></span>')+'</td></tr>';
		content += '<tr><td align="right">数据级别：</td><td>'+(row['data_level'] ? '<strong style="color:red;">管理</strong>' : '普通')+'</td></tr>';
		content += '<tr><td align="right">所属部门：</td><td>'+row['branch_title']+'</td></tr>';
		content += '<tr><td align="right">授权角色：</td><td>'+groups.join('<br />')+'</td></tr>';
		content += '</table>';
		$($.Oa.dialog_1).dialog({
			title: '用户详细信息',
			iconCls: 'icons-application-application_view_detail',
			width: 250,
			height: 360,
			cache: false,
			href: null,
			content: content,
			modal: true,
			collapsible: false,
			minimizable: false,
			resizable: true,
			maximizable: true
		});
	},

	//添加用户
	add: function(){
		$($.Oa.dialog_1).dialog({
			title: '添加用户',
			width: '580',
			height: '300',
			iconCls: 'icon-add',
			href: '<?php echo U("Core/addUser/");?>',
			modal: true
		});
	},

    //导出
    exportExcel: function(){
        location.href="<?php echo U('Core/exportExcel');?>";
},
	//编辑用户
	edit: function(id){
		if(id == null){
			var row = $('#Core_User').datagrid("getSelected");
			if(row == null){
				$.Oa.tip('提示信息', '请选择要处理的数据','error');
				return false;
			}
			id = row.uid;
		}
		$($.Oa.dialog_1).dialog({
			title: '编辑用户',
			width: '580',
			height: '300',
			iconCls: 'icon-edit',
			href: '<?php echo U("Core/editUser/");?>/id/'+id,
			modal: true
		});
	},

	//删除用户
	delete: function(id){
		if(id == null){
			var row = $('#Core_User').datagrid("getSelected");
			if(row == null){
				$.Oa.tip('提示信息', '请选择要处理的数据','error');
				return false;
			}
			id = row.uid;
		}
		$.Oa.confirm('$.Oa.delData("'+id+'","<?php echo U("Core/delUser");?>")')
	},
	//修复表
	resetUserPass: function(uid){
		//其实delData只是个传递参数去post的方法,可以用于增删改查
		$.Oa.confirm('$.Oa.delData("'+uid+'","<?php echo U("Core/resetUserPass");?>")');
	}
}
</script>
<script>
/**
 * 用户容器实例化数据
 */
$("#Core_User").datagrid({
	title: "系统中心 > 用户设置 > 用户管理",
	singleSelect:true,
	nowrap:true,
	border: false,
	fitColumns: true,
	fit: true,
	toolbar: Core_User.toolbar,
	idField: 'uid',
	rownumbers: true,
	animate: true,
	url: "<?php echo U('Core/User');?>",
	columns:[[
		{field:'uid',title:'UID',align:'center',width:20},
		{field:'name',title:'账号',width:50},
		{field:'title',title:'昵称',width:50},
		{field:'job_title',title:'工作职务',width:50},
		{field:'visit',title:'回访',width:30,align:'center',formatter:Core_User.status},
		{field:'status',title:'状态',width:30,align:'center',formatter:Core_User.status},
		{field:'branch_title',title:'所属部门',width:50},
		{field:'data_level',title:'数据级别',width:40,formatter:Core_User.data_level},
		{field:'groups',title:'所属角色',width:40,formatter:Core_User.show_group},
		{field:'opert_id',title:'操作',width:80,formatter:Core_User.opert}
	]],
	pagination:true,
	pagePosition:'bottom',
	pageNumber:1,
	pageSize:20,
	pageList:[20,30,50],
	/*
	onDblClickRow: function(rowIndex,rowData){
		Core_User.edit(rowData.id);
	},
	*/
	onRowContextMenu: function(e, rowIndex,rowData){
		e.preventDefault(); //阻止浏览器捕获右键事件
        $(this).datagrid("unselectAll"); //取消所有选中项
        $(this).datagrid("selectRow",rowIndex); //根据索引选中该行
        $('#Core_User_Menu').menu('show', {//显示右键用户
            left: e.pageX,//在鼠标点击处显示用户
            top: e.pageY
        });
	}
});
</script>
<div id="Core_User_Menu" class="easyui-menu" style="display:none;">
	<div data-options="iconCls:'icon-edit'" onclick="Core_User.edit()">修改</div>
	<div data-options="iconCls:'icon-cancel'" onclick="Core_User.delete()">删除</div>
</div>