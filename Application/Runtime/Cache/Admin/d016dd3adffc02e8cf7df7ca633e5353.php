<?php if (!defined('THINK_PATH')) exit();?><table id="Account_Detail"></table>
<div id="Account_Detail_Search">
	<table cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td>
					<a href="javascript:void(0)" class="l-btn l-btn-small l-btn-plain" onclick="Account_Detail.add()">
						<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">添加</span><span class="l-btn-icon icons-table-table_add">&nbsp;</span></span>
					</a>
					<a href="javascript:void(0)" class="l-btn l-btn-small l-btn-plain" onclick="$.Oa.refresh()">
						<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">刷新</span><span class="l-btn-icon icons-table-table_refresh">&nbsp;</span></span>
					</a>
					<br/>
					<span style="padding-left:10px;">导入日期：</span>
					<input class="easyui-textbox" id="import-year" style="width:40px"/>&nbsp;年&nbsp;<input class="easyui-textbox" id="import-month" style="width:40px"/>&nbsp;月
					<a href="javascript:void(0)" onclick="Account_Detail.importDetail()" class="easyui-linkbutton" >导入记录</a>
					<br />
					<form id="Account_Detail_Search_Form" style="float:right">
						<span style="padding-left:10px;">检测日期：</span>
						<input class="easyui-datebox" id="checktime" name="search[checktime]" type="text" style="width:100px" />
						<a href="javascript:void(0);" onclick="Account_Detail.search()" class="easyui-linkbutton" iconCls="icons-table-table">搜索</a>
						<a href="javascript:void(0)" class="l-btn l-btn-small l-btn-plain" onclick="Account_Detail.exportExcel()">
							<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">导出</span><span class="l-btn-icon icons-table-table_add">&nbsp;</span></span>
						</a>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<script type="text/javascript">
window.Account_Detail = {
	//工具栏
	toolbar:'#Account_Detail_Search',
	
	//搜索
	search: function(){
		$("#Account_Detail").datagrid('loadData', { total: 0, rows: [] });
		var queryParams = $("#Account_Detail").datagrid('options').queryParams;
		$.each($("#Account_Detail_Search_Form").serializeArray(), function() {
			queryParams[$(this).attr('name')] = $(this).attr('value');
		});
		$("#Account_Detail").datagrid({pageNumber: 1});
	},
	
	//添加
	add: function(){
		$($.Oa.dialog_1).dialog({
			title: '添加特种设备检验检测明细',
			width: '500',
			height: '380',
			iconCls: 'icon-add',
			href: '<?php echo U("Account/addDetail/");?>',
			modal: true
		});
	},

	//编辑
	edit: function(id){
		if(id == null){
			var row = $('#Account_Detail').datagrid("getSelected");
			if(row == null){
				$.Oa.tip('提示信息', '请选择要处理的数据','error');
				return false;
			}
			id = row.id;
		}
		$($.Oa.dialog_1).dialog({
			title: '编辑特种设备检验检测明细',
			width: '500',
			height: '380',
			iconCls: 'icon-edit',
			href: '<?php echo U("Account/editDetail/");?>/id/'+id,
			modal: true
		});
	},

	//删除
	delete: function(id){
		if(id == null){
			var row = $('#Account_Detail').datagrid("getSelected");
			if(row == null){
				$.Oa.tip('提示信息', '请选择要处理的数据','error');
				return false;
			}
			id = row.id;
		}
		$.Oa.confirm('$.Oa.delData("'+id+'","<?php echo U("Account/delDetail");?>")')
	},
	
	//导出
    exportExcel: function(){
    	var checktime = $('#checktime').textbox('getValue');
    	
        location.href="<?php echo U('Account/detailExportExcel');?>/checktime/"+checktime;
	},
	
	//生成数据
	importDetail: function(){
		var year = $('#import-year').textbox('getText');
		var month = $('#import-month').textbox('getText');
		if(year == '' || month == ''){
			$.Oa.tip('提示信息','请按正确形式输入需要生成的年月格式')
		}
		$.ajax({
			type:'post',
			url:"<?php echo U('AccountCommon/importDetail');?>",
			data:{'importtime':year+'-'+month},
			dataType:'json',
			success:function(data){
				$.Oa.tip('提示信息',data.info);
			}
		})
	},
	
	//操作格式化
	opert: function(value,row,index){
		return '<a href="javascript:void(0)" onclick="Account_Detail.edit('+row.id+')">修改</a> | <a href="javascript:void(0)" onclick="Account_Detail.delete('+row.id+')">删除</a>';
	}
}
</script>
<script>
/**
 * 容器实例化数据
 */
$("#Account_Detail").datagrid({
	title: "台帐中心 > 一台一档 > 特种设备检验明细管理",
	singleSelect:true,
	nowrap:true,
	border: false,
	fitColumns: true,
	fit: true,
	toolbar: Account_Detail.toolbar,
	idField: 'id',
	rownumbers: true,
	animate: true,
	multiSort: true,
	url: "<?php echo U('Account/Detail');?>",
	columns:[[
		{field:'id',title:'ID',align:'center',width:50},
		{field:'un_name',title:'单位名称',width:150},
		{field:'it_name',title:'检验项目',width:150},
		{field:'register_code',title:'注册代码',width:150},
		{field:'device_name',title:'设备名称',width:150},
		{field:'internal_number',title:'单位内部编号',width:150},
        {field:'opert_id',title:'操作',width:200,formatter:Account_Detail.opert}
        
	]],
	pagination:true,
	pagePosition:'bottom',
	pageNumber:1,
	pageSize:20,
	pageList:[20,30,50],
	onDblClickRow: function(rowIndex,rowData){
        Account_Detail.edit(rowData.id);
	},
	onRowContextMenu: function(e, rowIndex,rowData){
		e.preventDefault(); //阻止浏览器捕获右键事件
        $(this).datagrid("unselectAll"); //取消所有选中项
        $(this).datagrid("selectRow",rowIndex); //根据索引选中该行
	}
});
</script>