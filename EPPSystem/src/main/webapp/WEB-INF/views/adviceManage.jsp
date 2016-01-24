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
	var initAdviceContext;
	var initMs;
	var initMt;
	$(document).ready(function(){
		$("#msId").change(function(){
			createMtOption();
		});
		if($("#editable").val() == "false") {
			disableAllText();
		}
		fillMs();
		fillMt();
		fillText();
	});
	function disableAllText(){
		$("#buttonTr").hide();
		$("#daSubject").attr("disabled","disabled");
		$("#msId").attr("disabled","disabled");
		$("#mtId").attr("disabled","disabled");
		$("#msType").attr("disabled","disabled");
		$("#assignedStatus").attr("disabled","disabled");
		$("#assignedStatus2").attr("disabled","disabled");
		$("#ledDeputy").attr("disabled","disabled");
		$("#daDeputy").attr("disabled","disabled");
		$("#hostUnit").attr("disabled","disabled");
		$("#daDeputation").attr("disabled","disabled");
		$("#daContent").attr("disabled","disabled");
		$("#assignedReport").attr("disabled","disabled");
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
	function fillMt() {
		$.ajax({
			type : "post",
			url : contextPath + "/meeting/getMtByCondition.do",
			data : {ms:$("#ms").val()},
			dataType : "json",
			success : function(result) {
				initMt = result;
				for(var i=0;i<result.length;i++) {
					$("#mtId").append("<option value='"+ result[i].mtId +"'>" + result[i].meetingName + "</option>");
				}
			}
		});
	}
	function fillText() {
		$.ajax({
			type : "post",
			url : contextPath + "/advice/getAdviceByCondition.do",
			data : {daId:$("#daId").val()},
			dataType : "json",
			success : function(result) {
				initAdviceContext = result;
				$("#daSubject").val(result.daSubject);
				if(result.assignedStatus == "3" || result.assignedStatus == "4" || result.assignedStatus == "5") {
					$("#assignedStatus option[value=2]").attr("selected","selected");
					$("#assignedStatus2").show();
					$("#assignedStatus2 option[value="+ result.assignedStatus +"]").attr("selected","selected");
				} else {
					$("#assignedStatus option[value="+ result.assignedStatus +"]").attr("selected","selected");
				}
				$("#msId option[value="+ result.msId +"]").attr("selected","selected");
				$("#mtId option[value="+ result.mtId +"]").attr("selected","selected");
				$("#msType option[value="+ result.msType +"]").attr("selected","selected");
				$("#ledDeputy").val(result.ledDeputy);
				$("#daDeputy").val(result.daDeputy);
				$("#hostUnit option[value="+ result.hostUnit +"]").attr("selected","selected");
				$("#daDeputation").val(result.daDeputation);
				$("#daContent").val(result.daContent);
				$("#assignedReport").val(result.assignedReport);
			}
		});
	}
	function createMtOption() {
		if($("#msId").val == "noSelected") {
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
	function changeStatus(value) {
		if(value == 0) {
			$("#assignedStatus2").hide();
		} else if(value == 1) {
			$("#assignedStatus2").hide();
		} else if(value == 2) {
			$("#assignedStatus2").show();
		}
	}
	function update() {
		if($("#daSubject").val() == "") {
			alert("题目不能为空!");
			return;
		}
		if($("#msId").val() == "noSelected") {
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
			assignedStatus = $("#assignedStatus2").val();
		}
		$.ajax({
			type:"post",
			url:contextPath+"/advice/updateAdvice.do",
			data:{
				daId:$("#daId").val(),
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
				assignedReport:$("#assignedReport").val()
				},
			success:function(result) {
				if(result == "success") {
					alert("办理修改成功!");
					window.location.href=contextPath+"/meeting/gotoMeeting.do?ms="+$("#msId").val()+"&mstype="+$("#msType").val();
				} else {
					alert("办理修改失败!");
				}
			}
				
		});
	}
	function reset() {
		$("#msId").html("");
		$("#msId").append("<option value=''>请选择</option>");
		$("#mtId").html("");
		
		$("#mtId").append("<option value=''>请选择</option>");
		for(var i=0;i<result.length;i++) {
			$("#msId").append("<option value='"+ initMs[i].msId +"'>" + initMs[i].sessionName + "</option>");
		}
		
		for(var i=0;i<result.length;i++) {
			$("#mtId").append("<option value='"+ initMt[i].mtId +"'>" + initMt[i].meetingName + "</option>");
		}
		
		$("#daSubject").val(initAdviceContext.daSubject);
		if(initAdviceContext.assignedStatus == "3" || initAdviceContext.assignedStatus == "4" || result.assignedStatus == "5") {
			$("#assignedStatus option[value=2]").attr("selected","selected");
			$("#assignedStatus2").show();
			$("#assignedStatus2 option[value="+ initAdviceContext.assignedStatus +"]").attr("selected","selected");
		} else {
			$("#assignedStatus option[value="+ initAdviceContext.assignedStatus +"]").attr("selected","selected");
		}
		$("#msId option[value="+ initAdviceContext.msId +"]").attr("selected","selected");
		$("#mtId option[value="+ initAdviceContext.mtId +"]").attr("selected","selected");
		$("#msType option[value="+ initAdviceContext.msType +"]").attr("selected","selected");
		$("#ledDeputy").val(initAdviceContext.ledDeputy);
		$("#daDeputy").val(initAdviceContext.daDeputy);
		$("#hostUnit option[value="+ initAdviceContext.hostUnit +"]").attr("selected","selected");
		$("#daDeputation").val(initAdviceContext.daDeputation);
		$("#daContent").val(initAdviceContext.daContent);
		$("#assignedReport").val(initAdviceContext.assignedReport);
	}
</script>
</head>
<body>
<input id="daId" style="display:none;" value="${daId }"/>
<input id="ms" style="display:none;" value="${ms }"/>
<input id="editable" style="display:none;" value="${editable }"/>
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
			<textarea id="daContent" rows="8" style="width:738px"></textarea>
		</td>
	</tr>
	<tr>
		<td width="15%">办理报告</td>
		<td colspan="3" style="text-align:left;">
			<textarea id="assignedReport" rows="8" style="width:738px"></textarea>
		</td>
	</tr>
	<tr id="buttonTr">
		<td colspan="4">
			<button onclick="update()">提交</button>
			<a href="#" onClick="javascript :history.back(-1);"><button>返回</button></a>
			<button onclick="reset()">清空</button>
		</td>
	</tr>
</table>

</body>
</html>