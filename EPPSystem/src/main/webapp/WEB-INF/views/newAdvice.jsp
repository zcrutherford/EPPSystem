<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增建议</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/meeting.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	$(document).ready(function(){
		$("#assignedStatus2").hide();
		$("#msId").change(function(){
			createMtOption();
		});
	});
	function createMtOption() {
		$.ajax({
			type:"post",
			url:contextPath+"/meeting/getMtByCondition.do",
			data:{ms:$("#msId").val()},
			success:function(result){
				$("#mtId").html("");
				$("#mtId").append("<option value=''>请选择</option>");
				var list = eval(result);
				for(var i=0;i<list.length;i++) {
					$("#mtId").append("<option value='"+ list[i].mtId +"'>" + list[i].meetingName + "</option>");
				}
			}
		});
	}
	function addAdvice() {
		if($("#daSubject").val() == "") {
			alert("题目不能为空!");
			return;
		}
		if($("#msId").val() == "") {
			alert("界次不能为空!");
			return;
		}
		if($("#mtId").val() == "") {
			alert("界次不能为空!");
			return;
		}
		if($("#ledDeputy").val() == "") {
			alert("领衔代表不能为空!");
			return;
		}
		if($("#daContent").val() == "") {
			alert("建议内容不能为空!");
			return;
		}
		
		var assignedStatus = $("#assignedStatus").val();
		if(assignedStatus == 2) {
			assignedStatus = $("#assignedStatus2").val()
		}
		$.ajax({
			type:"post",
			url:contextPath+"/advice/addAdvice.do",
			data:{
				daSubject:$("#daSubject").val(),
				msId:$("#msId").val(),
				mtId:$("#mtId").val(),
				msType:$("#msType").val(),
				ledDeputy:$("#ledDeputy").val(),
				daDeputy:$("#daDeputy").val(),
				hostUnit:$("#hostUnit").val(),
				daDeputation:$("#daDeputation").val(),
				assignedStatus:assignedStatus,
				daContent:$("#daContent").val(),
				},
			success:function(result) {
				if(result == "success") {
					alert("添加成功!");
					window.location.href=contextPath+"/meeting/gotoMeeting.do?ms="+$("#msId").val()+"&mstype="+$("#msType").val();
				} else {
					alert("添加失败!");
				}
			}
				
		});
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
	function reset() {
		
	}
</script>
</head>
<body>
<table style="margin:auto;" class="table11" width="800px">
			<tr height="20px">
				<th colspan=2>新增建议</th>
			</tr>
			<tr height="20px">
				<td width="40%">题目</td>
				<td style="text-align:left;">
					<input id="daSubject" type="text" style="width:150px"/>
				</td>
			</tr>
			<tr height="20px">
				<td>归属界次</td>
				<td style="text-align:left;">
					<select id="msId">
						<option value="">请选择</option>
						<c:forEach items="${mslist }" var="temp">
							<option value="${temp.msId }">${temp.sessionName }</option>
						</c:forEach>
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