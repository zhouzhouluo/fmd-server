<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>Home page</h1>
<p>
${message}
<a href="${pageContext.request.contextPath}/team/add.im">Add new team</a>
<a href="${pageContext.request.contextPath}/team/list.im">Team list</a>
</p>
</body>
</html>