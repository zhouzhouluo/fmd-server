<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>
<c:set var="ctx" value="<%=basePath%>" />
<c:set var="base" value="<%=base%>" />
<c:set var="path" value="<%=path%>" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<title>用户登录</title>
	<link href="${path}/business/_files/WdatePicker.css" rel="stylesheet" type="text/css">
	<link href="${path}/business/_files/common.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${path}/business/_files/style.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${path}/business/_files/font.css" rel="stylesheet" media="all" type="text/css">
	<script src="${path}/business/_files/main.js"type="text/javascript"></script>
	<script src="${path}/business/_files/meizzDate.js" type="text/javascript"></script>
	<script type="text/javascript" src="${path}/business/_files/fckeditor.js"></script>
	<script src="${path}/business/_files/function.js" type="text/javascript"></script>
	<script src="${path}/business/_files/menu.js" type="text/javascript"></script>
	<script type="text/javascript" src="${path}/business/_files/WdatePicker.js"></script>
	<script type="text/javascript" src="${path}/business/_files/login.js"></script>
	<script type="text/javascript" src="${path}/business/_files/jquery.js"></script>
<script type="text/javascript">
	var contextPath = "<%=path%>";
</script>
<style type="text/css">
    .text {
		width: 150px;
		height: 20px;
		vertical-align: middle;
		line-height:20px;
    }
</style>
</head>
<body>
	<form name="Form1" method="post" action="${path}/member/login.action"
		id="Form1" onsubmit="return frmchk(this);">
		<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
			value="/wEPDwUKMTc5ODgxNzEzN2Rk4iZwydhiQj0MLspEVXbxn8KzOrr7JKgysf3cF4eDCjI=">
		<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION"
			value="/wEWAwKHnrKDDgLyveCRDwK61/XMA2orJnwDxVqB4Sf89hNMuVOuo9t/m0xMh6U+O2D4YFGr">
		<div class="ncenter_box">
			<div class="accounttitle">
				<h1></h1>
			</div>
			<table class="tab2">
				<tbody>
					<tr>
						<td valign="bottom" align="middle">请输入您的用户id和密码</td>
					</tr>
					<tr>
						<td align="left" style="font-size: 16pt;">
							用户编号&nbsp;
							<input name="userid" type="text"
							maxlength="16" id="userid" class="text"></td>
					</tr>
					<tr>
						<td align="left" style="font-size: 16pt;">
							密码 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input name="pwd" type="password"
							maxlength="16" id="pwd" class="text"></td>
					</tr>
					<tr>
						<td align="left" style="font-size: 16pt;">
							验证码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input name="idcode" type="text"
							maxlength="16" id="idcode" class="text">
							<img  src="${path}/imgVcode" id="imgVcode">
							<a href="javascript:;"
          						onclick="document.getElementById('imgVcode').src='${path}/imgVcode?'+new Date()">刷新</a>
						</td>
					</tr>
					<tr>
						<td valign="top" align="left"><input type="button" name="chkbotton" value="登陆" id="chkbotton" onclick="createRequest();"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>