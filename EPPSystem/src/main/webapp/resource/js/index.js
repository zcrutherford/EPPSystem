"use strict";
var setting = {
	data : {
		simpleData : {
			enable : true,
			idKey : "id",
			pIdKey : "parent",
			rootPId : null
		},
		key : {
			name : "name",
			url : "url",
		},
		view : {
			dblClickExpand : false,
			showLine : false,
			showIcon : false
		}
	},
};
var nodes;
var zTree;
$(document).ready(function(){
	$.ajax({
		type : "post",
		url : contextPath + "/menu/getmenu.do",
		dataType : "json",
		success : function(result) {
			zTree = $.fn.zTree.init($("#navigation"), setting, result);
		}
	});
});