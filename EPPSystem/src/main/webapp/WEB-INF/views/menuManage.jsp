<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>菜单管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/meeting.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<table style="margin:auto;" class="table11" width="800px">
			<tr height="20px">
				<th colspan=2>新增会议</th>
			</tr>
			<tr height="20px">
				<td width="40%">会议界</td>
				<td style="text-align:left;">
					<input id="msId" type="text" style="width:150px"/>
				</td>
			</tr>
			<tr height="20px">
				<td>会议次</td>
				<td style="text-align:left;">
					<select id="msId">
						<option value="noSelected">请选择</option>
					</select>
					<select id="mtId">
						<option value="">请选择</option>
					</select>
				</td>
			</tr>
			<tr height="20px">
				<td>会议类型</td>
				<td style="text-align:left;">
					<select id="msType" style="width:150px">
						<option value="on">开会期间</option>
						<option value="off">闭会期间</option>
					</select>
				</td>
			</tr>
			<tr height="20px">
				<td>领衔代表</td>
				<td style="text-align:left;">
					<input id="ledDeputy" type="text" style="width:150px"/>
				</td>
			</tr>
			<tr height="20px">
				<td>建议代表</td>
				<td style="text-align:left;">
					<input id="daDeputy" type="text" style="width:150px"/>
				</td>
			</tr>
			<tr height="20px">
				<td>主办单位</td>
				<td style="text-align:left;">
					<select id="hostUnit" style="width:150px">
						<option value="建委">建委</option>
						<option value="管委">管委</option>
						<option value="其他">其他</option>
					</select>
				</td>
			</tr>
			<tr height="20px">
				<td>建议代表团</td>
				<td style="text-align:left;">
					<input id="daDeputation" type="text" style="width:150px"/>
				</td>
			</tr>
			<tr height="20px">
				<td>交办状态</td>
				<td style="text-align:left;">
					<select id="assignedStatus" style="width:150px" onchange="changeStatus(this.value)">
						<option value ="0">办理中</option>
 						<option value ="1">已办结</option>
  						<option value ="2">续办</option>
					</select>
					<select id="assignedStatus2" style="width:125px;display:none;">
						<option value="3">1年</option>
						<option value="4">2年</option>
						<option value="5">3年</option>
					</select>
				</td>
			</tr>
			<tr height="20px">
				<td>建议内容</td>
				<td style="text-align:left;">
					<textarea id="daContent" rows="10" cols="40"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<button onclick="addAdvice()">提交</button>
					<a href="#" onClick="javascript :history.back(-1);"><button>返回</button></a>
					<button onclick="reset()">清空</button>
				</td>
			</tr>
		</table>
</body>
</html>