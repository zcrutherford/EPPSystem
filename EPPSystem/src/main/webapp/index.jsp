<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>石景山人大环保建议系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/common/zTreeStyle.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css" />
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/common/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/index.js"></script>
</head>
<body>
<div class="head">head</div>
<div class="content">
	<div class="left">
		<ul id="navigation" class="ztree"></ul>
	</div>
	<div class="middle">
		<iframe name="myframe" frameborder="0" class="myframe" src="${pageContext.request.contextPath}/meeting/gotoWelcome.do"></iframe>
	</div>
</div>
<div class="foot">foot</div>
</body>
</html>