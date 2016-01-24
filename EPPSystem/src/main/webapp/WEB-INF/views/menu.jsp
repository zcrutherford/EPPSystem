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
		zTable = $('#dataTables').DataTable({
			"aLengthMenu" : [ [ 10 ] ],
			"serverSide" : true,
			"ajax" : {
				"url" : contextPath + "/meeting/getMs.do",
				"type" : "POST",
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
				"mData" : "msId",
				"sWidth" : "100"
			}, {
				"bVisible" : true,
				"mData" : "sessionName",
				"sWidth" : "100"
			}, {
				"bVisible" : true,
				"mData" : "msOperator",
				"sWidth" : "100"
			}, {
				"bVisible" : true,
				"render" : function(data, type, full, meta) {
					return "<a href='"+contextPath+".do?msId="+ full.msId +"'><button>修改</button></a>" +
							"<a href='#'><button onclick='deleteMeetingSession("+full.msId+")'>删除</button></a>";
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
	function deleteMeetingSession(msId) {
		if(confirm("确定删除本届吗?")) {
			$.ajax({
				type : "post",
				url : contextPath + "",
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

<a href="${pageContext.request.contextPath}/menu/gotoAddMs.do"><button>新增会议界</button></a>
	<table id="dataTables" class="table11">
		<thead>
			<tr style="height: 20px;">
				<th>归属界次</th>
				<th>界次名称</th>
				<th>操作者</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="tbody" ></tbody>
	</table>
</body>
</html>