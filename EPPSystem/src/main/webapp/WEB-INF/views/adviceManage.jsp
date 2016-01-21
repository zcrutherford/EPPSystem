<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>建议管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/meeting.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	$(document).ready(function(){
		$.ajax({
			type : "post",
			url : contextPath + "/advice/gotoNewAdvicePage.do",
			data : {daId:$("#daId").val()},
			dataType : "json",
			success : function(result) {
				$("#daSubject").val(result.daSubject);
			}
		});
	});
	function changeStatus(value) {
		if(value == 0) {
			$("#assignedStatus2").hide();
		} else if(value == 1) {
			$("#assignedStatus2").hide();
		} else if(value == 2) {
			$("#assignedStatus2").show();
		}
	}
</script>
</head>
<body>
<input id="daId" style="display:none;" value="${daId }"/>
<table class="table11" style="width:1170px">
	<tr height="20px">
		<th colspan="4">建议管理</th>
	</tr>
	<tr>
		<td width="15%">题目:</td>
		<td width="35%" style="text-align:left;">
			<input id="daSubject" type="text" style="width:150px"/>
		</td>
		<td width="15%">交办状态</td>
		<td width="35%" style="text-align:left;">
			<select id="assignedStatus" style="width:154px" onchange="changeStatus(this.value)">
				<option value ="0">办理中</option>
 				<option value ="1">已办结</option>
  				<option value ="2">续办</option>
			</select>
			<select id="assignedStatus2" style="width:154px;display:none;">
				<option value="3">1年</option>
				<option value="4">2年</option>
				<option value="5">3年</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="15%">归属届次:</td>
		<td width="35%" style="text-align:left;">
			<select id="msId" style="width:154px">
				<option value="">请选择</option>
			</select>
			<select id="mtId" style="width:154px">
				<option value="">请选择</option>
			</select>
		</td>
		<td width="15%">会议类型:</td>
		<td width="35%" style="text-align:left;">
			<select id="msType" style="width:154px">
				<option value="on">开会期间</option>
				<option value="off">闭会期间</option>
			</select>		
		</td>
	</tr>
	<tr>
		<td width="15%">领衔代表:</td>
		<td width="35%" style="text-align:left;">
			<input id="ledDeputy" type="text" style="width:150px"/>
		</td>
		<td width="15%">建议代表:</td>
		<td width="35%" style="text-align:left;">
			<input id="daDeputy" type="text" style="width:150px"/>
		</td>
	</tr>
	<tr>
		<td width="15%">主办单位:</td>
		<td width="35%" style="text-align:left;">
			<select id="hostUnit" style="width:154px">
				<option value="建委">建委</option>
				<option value="管委">管委</option>
				<option value="其他">其他</option>
			</select>
		</td>
		<td width="15%">建议代表团:</td>
		<td width="35%" style="text-align:left;">
			<input id="daDeputation" type="text" style="width:150px"/>
		</td>
	</tr>
	<tr>
		<td width="15%">建议内容:</td>
		<td colspan="3" style="text-align:left;">
			<textarea id="daContent" rows="10" cols="80"></textarea>
		</td>
	</tr>
	<tr>
		<td width="15%">办理报告</td>
		<td colspan="3" style="text-align:left;">
			<textarea id="assignedReport" rows="10" cols="80"></textarea>
		</td>
	</tr>
</table>

</body>
</html>