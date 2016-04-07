<?php if (!defined('THINK_PATH')) exit();?><table id="Account_Device"></table>
<div id="Account_Device_Search">
	<table cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td>
					<a href="javascript:void(0)" class="l-btn l-btn-small l-btn-plain" onclick="Account_Device.add()">
						<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">添加</span><span class="l-btn-icon icons-table-table_add">&nbsp;</span></span>
					</a>
					<a href="javascript:void(0)" class="l-btn l-btn-small l-btn-plain" onclick="$.Oa.refresh()">
						<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">刷新</span><span class="l-btn-icon icons-table-table_refresh">&nbsp;</span></span>
					</a>
					<a href="javascript:void(0)" class="l-btn l-btn-small l-btn-plain" onclick="Account_Device.importExcel()" >
						<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">导入</span><span class="l-btn-icon icons-table-table_add">&nbsp;</span></span>
					</a>
					<a href="javascript:void(0)" class="l-btn l-btn-small l-btn-plain"  onclick="Account_Device.exportExcel()">
						<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">导出</span><span class="l-btn-icon icons-table-table_add">&nbsp;</span></span>
					</a>
					<br />
					<form id="Account_Device_Search_Form" style="float:right">
						<span style="padding-left:10px;">设备编号：</span>
						<input class="easyui-textbox" name="search[number]" type="text" style="width:100px" />
						<span style="padding-left:10px;">设备名称：</span>
						<input name="search[name]" class="easyui-combobox" style="width:120px" />
						<a href="javascript:void(0);" onclick="Account_Device.search()" class="easyui-linkbutton" iconCls="icons-table-table">搜索</a>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<script type="text/javascript">
window.Account_Device = {
	//工具栏
	toolbar: "#Account_Device_Search",
	//搜索
	search: function(){
		$("#Account_Device").datagrid('loadData', { total: 0, rows: [] });
		var queryParams = $("#Account_Device").datagrid('options').queryParams;
		$.each($("#Account_Device_Search_Form").serializeArray(), function() {
			queryParams[$(this).attr('name')] = $(this).attr('value');
		});
		$("#Account_Device").datagrid({pageNumber: 1});
	},
	//添加
	add: function(){
		$($.Oa.dialog_1).dialog({
			title: '添加设备',
			width: '580',
			height: '350',
			iconCls: 'icon-add',
			href: '<?php echo U("Account/addDevice/");?>',
			modal: true
		});
	},

	//编辑
	edit: function(id){
		if(id == null){
			var row = $('#Account_Device').datagrid("getSelected");
			if(row == null){
				$.Oa.tip('提示信息', '请选择要处理的数据','error');
				return false;
			}
			id = row.id;
		}
		$($.Oa.dialog_1).dialog({
			title: '编辑设备',
			width: '580',
			height: '350',
			iconCls: 'icon-edit',
			href: '<?php echo U("Account/editDevice/");?>/id/'+id,
			modal: true
		});
	},

	//删除
	delete: function(id){
		if(id == null){
			var row = $('#Account_Device').datagrid("getSelected");
			if(row == null){
				$.Oa.tip('提示信息', '请选择要处理的数据','error');
				return false;
			}
			id = row.id;
		}
		$.Oa.confirm('$.Oa.delData("'+id+'","<?php echo U("Account/delDevice");?>")')
	},
	
	//查看详细
	show: function(id){
		var row = $("#Account_Device").datagrid('selectRecord',id);
		row = $("#Account_Device").datagrid('getSelected');
		var content = '';
		$($.Oa.dialog_1).dialog({
			title: '特种设备详细',
			iconCls: 'icons-application-application_view_detail',
			maximizable: true,
			width: 580,
			height: 400,
			href: '<?php echo U("Account/showDevice");?>/id/'+id,
			modal: true
		});
		
	},
	
	//附件管理
	attach: function (id){
		var row = $("#Account_Device").datagrid('selectRecord',id);
		row = $("#Account_Device").datagrid('getSelected');
		$($.Oa.dialog_1).dialog({
			title: '特殊设备附件资料管理',
			iconCls: 'icons-application-application_view_detail',
			width: '580',
			height: '450',
			iconCls: 'icon-edit',
			href: '<?php echo U("Account/dAttach/");?>/id/'+id,
			modal: true
			
		})
	},
	
	//导入
	importExcel: function(){
		$($.Oa.dialog_1).dialog({
			title: '特殊设备附件资料管理导入',
			width: '500',
			height: '300',
			href: '<?php echo U("Account/importDevice/");?>',
			modal: true
		})
	},
	
	//导出
    exportExcel: function(){
        location.href="<?php echo U('Account/deviceExportExcel');?>";
	},
	
	//操作格式化
	opert: function(value,row,index){
		return '<a href="javascript:void(0);" onclick="Account_Device.show('+row.id+')">查看详细</a> | <a href="javascript:void(0)" onclick="Account_Device.edit('+row.id+')">修改</a> | <a href="javascript:void(0)" onclick="Account_Device.delete('+row.id+')">删除</a> | <a href="javascript:void(0)" onclick="Account_Device.attach('+row.id+')">附件资料</a>';
	},

	//状态格式化
	/*is_record: function(value){
		if(value >= 1){//为真时
			return '<span class="oa-block tree-icon tree-file icons-arrow-accept"></span>';
		} else {
			return '<span class="oa-block tree-icon tree-file icons-other-cancel"></span>';
		}
	},

	record_type: function(value){
		var record_type = '';
		switch(value){
			case '0':
				record_type = '<font color="red">未备案</font>';
				break;
			case '1':
				record_type = '个人备案';
				break;
			case '2':
				record_type = '企业备案';
				break;
		}
		return record_type;
	}*/
}
</script>
<script type="text/javascript">
/**
 * 容器实例化数据
 */
$("#Account_Device").datagrid({
	title: "台帐中心 > 一台一档 > 特种设备台帐",
	singleSelect:true,
	nowrap:true,
	border: false,
	fitColumns: true,
	fit: true,
	toolbar: Account_Device.toolbar,
	idField: 'id',
	rownumbers: true,
	animate: true,
	multiSort: true,
	url: "<?php echo U('Account/Device');?>",
	columns:[[
		//{field:'id',title:'ID',align:'center',width:50},
		{field:'number',title:'设备编号',width:150},
		{field:'name',title:'设备名称',width:100},
		{field:'model',title:'设备型号',width:100},
        {field:'register_code',title:'注册代码',width:150},
		{field:'use_car_number',title:'使用登记证编号/场内车辆牌照号',width:190},
		{field:'maintenance_unit',title:'维保单位',width:100},
		{field:'use_state',title:'使用状态',width:80},
		{field:'check_before_time',title:'上次检验日期',width:120},
		{field:'check_next_time',title:'下次检验日期',width:120},
		{field:'check_report_number',title:'检验报告编号',width:120},
        {field:'use_location',title:'使用地点',width:100},
        {field:'area',title:'所在地区',width:80},
        {field:'opert_id',title:'操作',width:300,formatter:Account_Device.opert}
        
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