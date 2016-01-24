<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新增次</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/meeting.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	$(document).ready(function(){
		fillMs();
	});
	function addMt() {
		$.ajax({
			type:"post",
			url:contextPath+"/menu/addMt.do",
			data:{msId:$("#msId").val(),
				  mtId:$("#mtId").val(),
				  meetingName:$("#meetingName").val(),
				  meetingContent:$("#meetingContent").val()},
			success:function(result){
				if(result == "success") {
					alert("添加成功");
					window.location.href=contextPath+"/menu/gotoMenu.do";
				}
			}
		});
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
	function reset() {
		$("#msId option:eq('')").attr("selected","selected");
		$("#mtId").val("");
		$("#meetingName").val("");
		$("#meetingContent").val("");
	}
</script>
</head>
<body>
<table style="margin:auto;" class="table11" width="800px">
			<tr height="20px">
				<th colspan=2>新增界次</th>
			</tr>
			<tr height="20px">
				<td width="40%">会议界</td>
				<td style="text-align:left;">
					<select id="msId" style="width:154px">
						<option value="">请选择</option>
					</select>
				</td>
			</tr>
			<tr height="20px">
				<td width="40%">会议次</td>
				<td style="text-align:left;">
					<input id="mtId" type="text" style="width:150px"/>
				</td>
			</tr>
			<tr height="20px">
				<td width="40%">会议名</td>
				<td style="text-align:left;">
					<input id="meetingName" type="text" style="width:150px"/>
				</td>
			</tr>
			<tr height="20px">
				<td width="40%">会议描述</td>
				<td style="text-align:left;">
					<input id="meetingContent" type="text" style="width:150px"/>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<button onclick="addMt()">提交</button>
					<button onclick="reset()">清空</button>
				</td>
			</tr>
		</table>
</body>
</html>