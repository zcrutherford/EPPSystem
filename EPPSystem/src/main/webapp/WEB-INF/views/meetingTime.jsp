<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>菜单管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/common/bootstrap-3.3.0.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/common/jquery.dataTables.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/common/dataTables.bootstrap.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/meeting.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/bootstrap-3.3.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/jquery.dataTables.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/dataTables.bootstrap.js"></script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	var zTable = null;
	$(document).ready(function() {
		$("#msId").change(function(){
			createMtOption();
		});
		fillMs();
		zTable = $('#dataTables').DataTable({
			"aLengthMenu" : [ [ 10 ] ],
			"serverSide" : true,
			"ajax" : {
				"url" : contextPath + "/menu/getMeetingTime.do",
				"type" : "POST",
				"data" : function(d) {
					if($("#msId").val()=="noselected") {
						d.msId = "";
					} else {
						d.msId = $("#msId").val();//界
					}
					d.mtId = $("#mtId").val();//次
					d.meetingName = $("#meetingName").val();
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
				"mData" : "mtId",
				"sWidth" : "100"
			}, {
				"bVisible" : true,
				"mData" : "msId",
				"sWidth" : "100"
			}, {
				"bVisible" : true,
				"mData" : "meetingName",
				"sWidth" : "100"
			}, {
				"bVisible" : true,
				"mData" : "meetingContent",
				"sWidth" : "100"
			}, {
				"bVisible" : true,
				"render" : function(data, type, full, meta) {
					return "<a href='"+contextPath+".do?mtId="+ full.mtId +"'><button>修改</button></a>" +
							"<a href='#'><button onclick='deleteMeetingTime("+full.mtId+")'>删除</button></a>";
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
	function query() {
		zTable.ajax.reload();
	}
	function reset() {
		$("#meetingName").val("");
		$("#msId").html("");
		$("#msId").append("<option value='noselected'>请选择</option>");
		fillMs();
		$("#mtId").html("");
		$("#mtId").append("<option value=''>请选择</option>");
	}
	function fillMs() {
		$.ajax({
			type : "post",
			url : contextPath + "/meeting/getMs.do",
			dataType : "json",
			success : function(result) {
				initMs = result;
				for(var i=0;i<result.length;i++) {
					$("#msId").append("<option value='"+ result[i].msId +"'>" + result[i].sessionName + "</option>");
				}
			}
		});
	}
	function createMtOption() {
		if($("#msId").val == "") {
			$("#mtId").html("");
			$("#mtId").append("<option value=''>请选择</option>");
		} else {
			$.ajax({
				type:"post",
				url:contextPath+"/meeting/getMtByCondition.do",
				data:{ms:$("#msId").val()},
				dataType:"json",
				success:function(result){
					$("#mtId").html("");
					$("#mtId").append("<option value=''>请选择</option>");
					for(var i=0;i<result.length;i++) {
						$("#mtId").append("<option value='"+ result[i].mtId +"'>" + result[i].meetingName + "</option>");
					}
				}
			});
		}
	}
	function deleteMeetingTime(mtId) {
		if(confirm("确定删除本次会议吗?")) {
			$.ajax({
				type : "post",
				url : contextPath + "/menu/deleteMeetingTime.do",
				data : {mtId:mtId},
				success : function(result) {
					if(result == "success") {
						alert("删除成功");
					}
					zTable.ajax.reload();
				}
			});
		}
	}
</script>
</head>
<body>

<table class="table11" style="width:1170px">
	<tr height="20px">
		<th colspan="4">会议管理</th>
	</tr>
	<tr>
		<td width="15%">会议名称:</td>
		<td width="35%" style="text-align:left;">
			<input id="meetingName" type="text" style="width:150px"/>
		</td>
		<td width="15%">归属届次:</td>
		<td width="35%" style="text-align:left;">
			<select id="msId" style="width:154px">
				<option value="noselected">请选择</option>
			</select>
			<select id="mtId" style="width:154px">
				<option value="">请选择</option>
			</select>
		</td>
	</tr>
	<tr id="buttonTr">
		<td colspan="4">
			<button onclick="query()">查询</button>
			<button onclick="reset()">清空</button>
		</td>
	</tr>
</table>

<a href="${pageContext.request.contextPath}/menu/gotoAddMt.do"><button>新增会议次</button></a>
	<table id="dataTables" class="table11">
		<thead>
			<tr style="height: 20px;">
				<th>会议编号</th>
				<th>会议界次</th>
				<th>会议名称</th>
				<th>会议主题</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="tbody" ></tbody>
	</table>
</body>
</html>