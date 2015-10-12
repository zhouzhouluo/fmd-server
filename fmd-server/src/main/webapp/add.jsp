<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>Add team page</h1>
<p>Here you can add a new team.</p>
<form:form method="POST" commandname="team" action="${pageContext.request.contextPath}/team/add2.im">
<table>
<tbody>
    <tr>
        <td>Name:</td>
        <td><input name="name" id = "name" /></td>
    </tr>
    <tr>
        <td>Rating:</td>
        <td><input name="rating" id = "rating" /></td>
    </tr>
    <tr>
        <td><input value="Add" type="submit"></td>
        <td></td>
    </tr>
</tbody>
</table>
</form:form>
 
<p><a href="${pageContext.request.contextPath}/index.html">Home page</a></p>
</body>
</html>