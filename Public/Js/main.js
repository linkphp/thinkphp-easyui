$(function(){
	//读取皮肤配置
	if($.cookie('theme')){
    	$.Oa.theme($.cookie('theme'));
	}
	/**
	 * 用户操作下拉特效
	 */
	$(".oa-user-select").hover(function() {
		$(this).children('p').stop(true, true).slideDown('slow');
	}, function() {
		$(this).children('p').stop(true, true).slideUp('slow');
	});


	/**
	 * 顶部菜单切换特效
	 */
	$(".link-north-navbar li").click(function(){
		$(this).siblings().removeClass('active');
		$(this).addClass('active');
	});

	/**
	 * tabs 框架
	 */
	$("#oa-tabs").tabs({
	    fit:true,
	    tabPosition:'bottom',
	    border:false
	});

	/**
	 * 左侧菜单accordion
	 */
	$(".link-north-navbar a").click(function(e) {
	    $('#west').panel({title:$(this).text()});
	    $.ajax({
	        url: $(this).attr('data-url'),
	        type: 'GET',
	        dataType: 'json',
	        beforeSend: function(){
	            //移除左侧菜单内容
	            $.Oa.removeLeftMenu();
	            $("#left").accordion("add", {content:$.Oa.loading("正在加载菜单中...")});
	        },
	        success: function(data){
	            //移除左侧菜单内容
	            $.Oa.removeLeftMenu();
	            //左侧内容更新
	            /*$.each(data, function(i,m) {
	                var content = '';
	                if(m.children){
	                    content = "<ul class='easyui-tree' data-options='data:"+ JSON.stringify(m.children) +",animate:true,lines:false,onClick:function(node){$.Oa.openUrl(node)}'></ul>";
	                }
	                $("#left").accordion("add", {title: m.title, content: content,iconCls:m.cls});
	            });*/
	    		$('#left').tree({
			        checkbox: false,
			        data: data,
			        parentField:"rule_id",
			        textFiled:"text",
			        idFiled:"key",
			        onClick: function(node){
				       $.Oa.openUrl(node);
				    }
			    });
	        },
			error: function(){
				$.messager.progress({text:"获取菜单失败，请联系管理员！3秒后关闭..."});
            	setTimeout('$.messager.progress("close")',3000);
			}
	    });

	});
	$(".link-north-navbar a").eq(0).click();
});