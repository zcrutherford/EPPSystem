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
				d.msId = $("#msId").val();//界
				d.mtId = $("#mtId").val();//次
				d.msType = $("#msType").val();//会议类型
				if($("#assignedStatus").val() == 2) {
					d.assignedStatus = $("#assignedStatus2").val();//状态
				} else {
					d.assignedStatus = $("#assignedStatus").val();//状态
				}
				d.daSubject=$("#daSubject").val();//题目
				d.hostUnit=$("#hostUnit").val();//主办单位
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
				return "<a href='"+contextPath+"/advice/gotoAdviceManagePage.do?daId="+ full.daId +"&ms="+ full.msId +"'>" + data;
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
			"mData" : "daDeputation",
			"sWidth" : "200"
		}, {
			"bVisible" : true,
			"mData" : "hostUnit",
			"sWidth" : "200"
		}, {
			"bVisible" : true,
			"mData" : "assignedStatus",
			"render" : function(data, type, full, meta) {
				if(data == 0) {
					return "办理中";
				} else if(data == 1){
					return "已办结";
				} else if(data == 2){
					return "续办";
				} else if(data == 3){
					return "续办-1年";
				} else if(data == 4){
					return "续办-2年";
				} else if(data == 5) {
					return "续办-3年";
				} else {
					return "未知状态";
				}
			},
			"sWidth" : "100"
		}, {
			"bVisible" : true,
			"render" : function(data, type, full, meta) {
				return "<a href='"+contextPath+"/advice/gotoAdviceManagePage.do?daId="+ full.daId +"&ms="+ full.msId +"'><button>办理报告</button></a><button onclick='deleteAdvice("+full.daId+")'>删除</button>";
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
	$("#hostUnit option:eq('')").attr("selected","selected");
	$("#daId").val("");
	$("#daSubject").val("");
	$("#assignedStatus2").hide();
}
function changeStatus(value) {
	if(value == 0) {
		$("#assignedStatus2").hide();
	} else if(value == 1) {
		$("#assignedStatus2").hide();
	} else if(value == 2) {
		$("#assignedStatus2").show();
	}
}
function deleteAdvice(daId) {
	if(confirm("确定删除本条建议吗?")) {
		$.ajax({
			type : "post",
			url : contextPath + "/advice/deleteAdvice.do",
			data : {daId:daId},
			success : function(result) {
				if(result == "success") {
					alert("删除成功");
				}
				zTable.ajax.reload();
			}
		});
	}
}