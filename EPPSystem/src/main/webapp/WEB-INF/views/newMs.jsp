<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新增界</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/meeting.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	$(document).ready(function(){
		
	});
	function addMs() {
		if($("#msId").val() == "") {
			alert("会议界不能为空");
		} else if($("#sessionName").val() == "") {
			alert("会议界名不能为空");
		} else {
			$.ajax({
				type:"post",
				url:contextPath+"/menu/addMs.do",
				data:{msId:$("#msId").val(),sessionName:$("#sessionName").val()},
				success:function(result){
					if(result == "success") {
						alert("添加成功");
						window.location.href=contextPath+"/menu/gotoMenu.do";
					}
				}
			});
		}
	}
	function reset() {
		$("#msId").val("");
		$("#sessionName").val("");
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
					<input id="msId" type="text" style="width:150px"/>
				</td>
			</tr>
			<tr height="20px">
				<td width="40%">会议界名</td>
				<td style="text-align:left;">
					<input id="sessionName" type="text" style="width:150px"/>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<button onclick="addMs()">提交</button>
					<button onclick="reset()">清空</button>
				</td>
			</tr>
		</table>
</body>
</html>