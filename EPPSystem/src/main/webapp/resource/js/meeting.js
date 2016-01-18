"use strict";
var zTable = null;
$(document).ready(function() {
	zTable = $('#dataTables').DataTable({
		"aLengthMenu" : [ [ 10 ] ],
		"serverSide" : true,
		"ajax" : {
			"url" : contextPath + "/advice/getAdvice.do",
			"type" : "POST",
			"data" : function(d) {
				d.msId = $("#msId").val();
				d.mtId = $("#mtId").val();
				d.assignedStatus = $("#assignedStatus").val();
				d.daId=$("#daId").val();
				d.daSubject=$("#daSubject").val();
			}
		},
		"scrollX" : "",
		"bFilter" : false,
		"bLengthChange" : false,
		"bDestroy" : true,
		"ordering" : false,
		"bAutoWidth" : false,
		"bRetrieve" : true,
		"oLanguage" : {
			"sProcessing" : "加载中...",
			"sLengthMenu" : "每页显示 _MENU_条",
			"sZeroRecords" : "没有找到符合条件的数据",
			"sInfo" : "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条",
			"sInfoEmpty" : "",
			"sInfoFiltered" : "",
			"sSearch" : "搜索：",
			"oPaginate" : {
				"sFirst" : "首页",
				"sPrevious" : "前一页",
				"sNext" : "后一页",
				"sLast" : "尾页",
			}
		},
		"aoColumns" : [ {
			"bVisible" : true,
			"mData" : "daId",
			"sWidth" : "100"
		}, {
			"bVisible" : true,
			"mData" : "daSubject",
			"render" : function(data, type, full, meta) {
				return "<a href='#'>" + data;
			},
			"sWidth" : "300"
		}, {
			"bVisible" : true,
			"mData" : "ledDeputy",
			"sWidth" : "200"
		}, {
			"bVisible" : true,
			"mData" : "daDeputy",
			"sWidth" : "200"
		}, {
			"bVisible" : true,
			"mData" : "assignedStatus",
			"render" : function(data, type, full, meta) {
				if(data == 1) {
					return "已办结";
				} else if(data == 2){
					return "办理中";
				} else if(data == 3){
					return "无法办理";
				} else if(data == 4){
					return "已开工-1年内";
				} else if(data == 5){
					return "1-2年";
				} else if(data == "0") {
					return "未办理";
				} else {
					return "未知状态";
				}
			},
			"sWidth" : "100"
		}, {
			"bVisible" : true,
			"render" : function(data, type, full, meta) {
				return "<button>办理报告</button>&nbsp<button>下载</button>";
			},
			"sWidth" : "300"
		} ],
		"aoColumnDefs" : [ {
			"bVisible" : false,
			sDefaultContent : '',
			aTargets : [ '_all' ]
		} ],
	});
});
function queryAdviceByCondition() {
	zTable.ajax.reload();
}
function reset() {
	$("#mtId option:eq('')").attr("selected","selected");
	$("#assignedStatus option:eq('')").attr("selected","selected");
	$("#daId").val("");
	$("#daSubject").val("");
}