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
<c:set var="basePath" value="<%=basePath%>" />
<c:set var="base" value="<%=base%>" />
<c:set var="path" value="<%=path%>" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<title>请输入二级密码</title>
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
</head>
<body onload="init_reg();">
	<form name="form1" method="post" action="${path}/member/pwd2.action"
		id="form1" onsubmit="return frmchk(this);">
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
						<td valign="bottom" align="middle">请输入您的二级密码</td>
					</tr>
					<tr>
						<td align="middle"><input name="password" type="password"
							maxlength="16" id="password" style="width: 100px;"></td>
					</tr>
					<tr>
						<td valign="top" align="middle"><input type="submit"
							name="chkbotton" value="提交" id="chkbotton"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>