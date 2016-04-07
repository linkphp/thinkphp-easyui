<?php if (!defined('THINK_PATH')) exit();?><table id="Person_LoginLog"></table>
<div id="Person_LoginLog_Search" style="padding:5px;height:auto">
	<form id="Person_LoginLog_Search_Form">
		时 间: <input name="search[date_begin]" class="easyui-datebox" style="width:100px">
		至: <input name="search[date_end]" class="easyui-datebox" style="width:100px">
		<a href="javascript:;" onclick="Person_LoginLog.search()" class="easyui-linkbutton" iconCls ="icons-table-table">搜索</a>
		<a href="javascript:;" onclick="Person_LoginLog.delete()" class="easyui-linkbutton" iconCls="icons-table-table_delete" >删除上月数据</a>
        <a href="javascript:;" onclick="Person_LoginLog.delete_all()" class="easyui-linkbutton" iconCls="icons-table-table_delete" >清空</a>
	</form>
</div>
<script type="text/javascript">
window.Person_LoginLog = {
	//工具栏
	toolbar: "#Person_LoginLog_Search",
	//搜索
	search: function(){
		$("#Person_LoginLog").datagrid('loadData', { total: 0, rows: [] });
		var queryParams = $("#Person_LoginLog").datagrid('options').queryParams;
		$.each($("#Person_LoginLog_Search_Form").serializeArray(), function() {
			queryParams[$(this).attr('name')] = $(this).attr('value');
		});
		$("#Person_LoginLog").datagrid({pageNumber: 1});
	},

	//删除上月数据
	delete: function(){
		$.Oa.confirm('$.Oa.delData("lastMonth","<?php echo U("Person/delLoginLog");?>")')
	},
    //删除所有数据
    delete_all: function(){
        $.Oa.confirm('$.Oa.delData("AllMonth","<?php echo U("Person/delAllLoginLog");?>")')
    }
}
</script>
<script>
/**
 * 版块容器实例化数据
 */
$("#Person_LoginLog").datagrid({
	title: "个人中心 > 用户操作 > 登录日志",
	singleSelect:true,
	nowrap:true,
	border: false,
	fitColumns: true,
	fit: true,
	toolbar: Person_LoginLog.toolbar,
	idField: 'id',
	rownumbers: true,
	animate: true,
	url: "<?php echo U('Person/LoginLog');?>",
	columns:[[
		{field:'name',title:'登录用户',width:50},
		{field:'date',title:'登录时间',width:70},
		{field:'user_agent',title:'浏览器标识',width:280},
		{field:'ip',title:'IP',width:50},
		{field:'area',title:'登录网络',width:80},
		{field:'country',title:'登录地点',width:50}
	]],
	pagination:true,
	pagePosition:'bottom',
	pageNumber:1,
	pageSize:20,
	pageList:[20,30,50]
});
</script>