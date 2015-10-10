<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>List of teams</h1>
<p>Here you can see the list of the teams, edit them, remove or update.</p>
<c:foreach var="team" items="${teams}">
</c:foreach><table border="1px" cellpadding="0" cellspacing="0">
<thead>
<tr>
<th width="10%">id</th><th width="15%">name</th><th width="10%">rating</th><th width="10%">actions</th>
</tr>
</thead>
<tbody>
<tr>
    <td>${team.id}</td>
    <td>${team.name}</td>
    <td>${team.rating}</td>
    <td>
    <a href="${pageContext.request.contextPath}/edit/${team.id}.im">Edit</a>
    <a href="${pageContext.request.contextPath}/delete/${team.id}.im">Delete</a>
    </td>
</tr>
 
</tbody>
</table>
 
<p><a href="${pageContext.request.contextPath}/home.jsp">Home page</a></p>
</html>