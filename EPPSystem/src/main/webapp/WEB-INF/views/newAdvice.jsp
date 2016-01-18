<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增建议</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	$(document).ready(function(){
		createMtOption();
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
				var list = eval(result);
				for(var i=0;i<list.length;i++) {
					$("#mtId").append("<option value='"+ list[i].mtId +"'>" + list[i].meetingName + "</option>");
				}
			}
		});
	}
	function addAdvice() {
		$.ajax({
			type:"post",
			url:contextPath+"/advice/addAdvice.do",
			data:{msId:$("#msId").val(),
				mtId:$("#mtId").val(),
				daSubject:$("#daSubject").val(),
				ledDeputy:$("#ledDeputy").val(),
				daContent:$("#daContent").val(),
				},
			success:function(result) {
				if(result == "success") {
					alert("添加成功!");
				} else {
					alert("添加失败!");
				}
			}
				
		});
	}
</script>
</head>
<body>
<div>新增建议代表</div>
<div>
	<span>题目：</span>
	<input id="daSubject" type="text"/>
</div>
<div>
	<span>领衔代表：</span>
	<input id="ledDeputy" type="text"/>
</div>
<div>
	<span>归属届次：</span>
	<select id="msId">
		<c:forEach items="${mslist }" var="temp">
			<option value="${temp.msId }">${temp.sessionName }</option>
		</c:forEach>
	</select>
	<select id="mtId"></select>
</div>
<div>
	<span>建议内容：</span>
	<textarea id="daContent" rows="10" cols="10"></textarea>
</div>
<button onclick="addAdvice()">确定</button>
<a href="#" onClick="javascript :history.back(-1);"><button>返回</button></a>
</body>
</html>