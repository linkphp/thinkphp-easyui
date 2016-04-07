<?php if (!defined('THINK_PATH')) exit();?><table id="Account_Unit"></table>
<script type="text/javascript">
window.Account_Unit = {
		//工具栏
		toolbar: [
			{ text: '添加', iconCls: 'icons-table-table_add', handler: function(){Account_Unit.add();} },
			{ text: '刷新', iconCls: 'icons-table-table_refresh', handler: function(){$.Oa.refresh();} }
		],	
	
	//添加
	add: function(){
		$($.Oa.dialog_1).dialog({
			title: '添加单位名称',
			width: '500',
			height: '200',
			iconCls: 'icon-add',
			href: '<?php echo U("Account/addUnit/");?>',
			modal: true
		});
	},

	//编辑
	edit: function(id){
		if(id == null){
			var row = $('#Account_Unit').datagrid("getSelected");
			if(row == null){
				$.Oa.tip('提示信息', '请选择要处理的数据','error');
				return false;
			}
			id = row.un_id;
		}
		$($.Oa.dialog_1).dialog({
			title: '编辑设备',
			width: '500',
			height: '200',
			iconCls: 'icon-edit',
			href: '<?php echo U("Account/editUnit/");?>/id/'+id,
			modal: true
		});
	},

	//删除
	delete: function(id){
		if(id == null){
			var row = $('#Account_Unit').datagrid("getSelected");
			if(row == null){
				$.Oa.tip('提示信息', '请选择要处理的数据','error');
				return false;
			}
			id = row.un_id;
		}
		$.Oa.confirm('$.Oa.delData("'+id+'","<?php echo U("Account/delUnit");?>")')
	},
	
	//操作格式化
	opert: function(value,row,index){
		return '<a href="javascript:void(0)" onclick="Account_Unit.edit('+row.un_id+')">修改</a> | <a href="javascript:void(0)" onclick="Account_Unit.delete('+row.un_id+')">删除</a>';
	},
}
</script>
<script>
/**
 * 容器实例化数据
 */
$("#Account_Unit").datagrid({
	title: "台帐中心 > 一台一档 > 单位名称管理",
	singleSelect:true,
	nowrap:true,
	border: false,
	fitColumns: true,
	fit: true,
	toolbar: Account_Unit.toolbar,
	idField: 'un_id',
	rownumbers: true,
	animate: true,
	multiSort: true,
	url: "<?php echo U('Account/Unit');?>",
	columns:[[
		{field:'un_id',title:'ID',align:'center',width:50},
		{field:'unitname',title:'单位名称',width:150},
        {field:'opert_id',title:'操作',width:200,formatter:Account_Unit.opert}
        
	]],
	pagination:true,
	pagePosition:'bottom',
	pageNumber:1,
	pageSize:20,
	pageList:[20,30,50],
	onDblClickRow: function(rowIndex,rowData){
        Account_Device.edit(rowData.id);
	},
	onRowContextMenu: function(e, rowIndex,rowData){
		e.preventDefault(); //阻止浏览器捕获右键事件
        $(this).datagrid("unselectAll"); //取消所有选中项
        $(this).datagrid("selectRow",rowIndex); //根据索引选中该行
        /*$('#Account_Device_Menu').menu('show', {//显示右键部门
            left: e.pageX,//在鼠标点击处显示部门
            top: e.pageY
        });*/
	}
});
</script>