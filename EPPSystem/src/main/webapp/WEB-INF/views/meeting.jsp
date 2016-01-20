<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询页面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/common/bootstrap-3.3.0.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/common/jquery.dataTables.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/common/dataTables.bootstrap.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/meeting.css"/>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/bootstrap-3.3.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/jquery.dataTables.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/meeting.js"></script>
</head>
<body>
<div class="iframe-container">
		<table class="table11" width="1170px">
			<tr height="20px">
				<th colspan=4>查询</th>
			</tr>
			<tr height="20px">
				<td width="150px">会议选择</td>
				<td width="500px" style="text-align:left;">
					<select id="mtId" style="width:125px">
						<option value ="">请选择</option>
 						<c:forEach items="${mtlist}" var="temp">
 							<option value="${temp.mtId }">${temp.meetingName }</option>
 						</c:forEach>
					</select>
					<input id="msId" type="text" style="display:none;" value="${ms}" />
					<input id="msType" type="text" style="display:none;" value="${mstype}" />
				</td>
				<td width="150px">题目</td>
				<td width="500px" style="text-align:left;">
					<input id="daSubject" type="text" style="width:150px" />
				</td>
			</tr>
			<tr height="20px">
				<td>状态</td>
				<td style="text-align:left;">
					<select id="assignedStatus" style="width:125px" onchange="changeStatus(this.value)">
						<option value ="">请选择</option>
						<option value="0">办理中</option>
 						<option value ="1">已办结</option>
  						<option value ="2">续办</option>
					</select>
					<select id="assignedStatus2" style="width:125px;display:none;">
						<option value="3">1年</option>
						<option value="4">2年</option>
						<option value="5">3年</option>
					</select>
				</td>
				<td width="150px">主办单位</td>
				<td style="text-align:left;">
					<select id="hostUnit" style="width:150px">
						<option value="">请选择</option>
						<option value="建委">建委</option>
						<option value="管委">管委</option>
						<option value="其他">其他</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<button onclick="queryAdviceByCondition()">查询</button>
					<button onclick="reset()">清空</button>
				</td>
			</tr>
		</table>
		<br>
		<a href="${pageContext.request.contextPath}/advice/gotoNewAdvicePage.do"><button>新增建议</button></a>
		<table id="dataTables" class="table11">
			<thead >
				<tr style="height: 20px;">
					<th>建议编号</th>
					<th>题目</th>
					<th>领衔代表</th>
					<th>附议代表</th>
					<th>建议代表团</th>
					<th>主办单位</th>
					<th>交办状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="tbody" ></tbody>
		</table>
	</div>
</body>
</html>