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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
	<title>User_treerec</title>
	<link href="${ctx}/business/_files/WdatePicker.css" rel="stylesheet" type="text/css">
	<script src="${ctx}/business/_files/main.js" type="text/javascript"></script>
	<script src="${ctx}/business/_files/meizzDate.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/business/_files/fckeditor.js"></script>
	<script src="${ctx}/business/_files/function.js" type="text/javascript"></script>
	<link href="${ctx}/business/_files/common.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${ctx}/business/_files/style.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${ctx}/business/_files/font.css" rel="stylesheet" media="all" type="text/css">
	<script src="${ctx}/business/_files/main.js" type="text/javascript"></script>
	<script src="${ctx}/business/_files/meizzDate.js" type="text/javascript"></script>
	<script src="${ctx}/business/_files/fckeditor.js"></script>
	<script src="${ctx}/business/_files/function.js" type="text/javascript"></script>
	<script src="${ctx}/business/_files/menu.js" type="text/javascript"></script>
	<script type="text/javascript"src="WdatePicker.js"></script>
	<link href="${ctx}/business/_files/common.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${ctx}/business/_files/style.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${ctx}/business/_files/font.css" rel="stylesheet" media="all" type="text/css">
	<script src="${ctx}/business/_files/menu.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/business/_files/WdatePicker.js"></script>
	<script type="text/javascript">
		alert("登录成功");
	</script>
</head>

<body>
	<form name="Form1" method="post" action="my_member.html" id="Form1">
		<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
			value="/wEPDwUJODgxODc2NjU1D2QWAgIHD2QWBAINDxYCHgtfIUl0ZW1Db3VudAIDFgYCAQ9kFgJmDxUHDOWViuWViuWViuWVigYzNjExNTgGMTAwMDAwEzIwMTUtMTAtMjggMTQ6MzE6MDUJ5raI6LS55Y2hIjxmb250IGNvbG9yPSJyZWQiPumdnuato+W8jzwvZm9udD4DNjE5ZAICD2QWAmYPFQcJ54m56Imy5LuWBjExODUwOQYxMDAwMDATMjAxNS0xMC0yOCAxNDozMDoxMwnmtojotLnljaEiPGZvbnQgY29sb3I9InJlZCI+6Z2e5q2j5byPPC9mb250PgM2MThkAgMPZBYCZg8VBwzmiZjlsJTmlq/ms7AGNzA4OTc5BjEwMDAwMBMyMDE1LTEwLTI4IDE0OjI5OjQxCea2iOi0ueWNoSI8Zm9udCBjb2xvcj0icmVkIj7pnZ7mraPlvI88L2ZvbnQ+AzYxN2QCDw8PFgIeC1JlY29yZGNvdW50AgNkZGRVLeEGOG4Qne+5NU+urOI2pee0xiu0sQ0M/5SkwgBooA==">
			<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
				<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT"
				value=""> <input type="hidden" name="__EVENTVALIDATION"
					id="__EVENTVALIDATION"
					value="/wEWBgKVj/LcBAKvruq2CALT+f69AwLzt9zuCwLduqHwAgKKlN3WBBfos+XbkfkSuxmoEJr+zCzsIORPoHzOp/VRvL4LTzNK">
						<div class="ncenter_box">
							<div class="accounttitle">
								<h1>我的会员</h1>
							</div>
							<table width="100%" border="0" class="tab2">
								<tbody>
									<tr>
										<td>用户</td>
										<td><input name="UserName" type="text" maxlength="16"
											id="UserName" style="width: 80px;"></td>
										<td>推荐人</td>
										<td><input name="ReName" type="text" maxlength="16"
											id="ReName" style="width: 80px;"></td>

										<td>开始时间</td>
										<td><input name="StarTime" type="text" id="StarTime"
											onclick="WdatePicker()" style="width: 100px;"></td>
										<td>结束时间</td>
										<td><input name="EndTime" type="text" id="EndTime"
											onclick="WdatePicker()" style="width: 100px;"></td>
										<td><input type="submit" name="lbSeach" value="搜索"
											id="lbSeach"></td>
									</tr>
								</tbody>
							</table>

							<table width="100%" border="0" class="tab2">
								<tbody>
									<tr>
										<th><strong>姓名</strong></th>
										<th><strong>用户名</strong></th>
										<th><strong>推荐人</strong></th>
										<th><strong>推荐时间</strong></th>
										<th><strong>消费级别</strong></th>
										<th><strong>状态</strong></th>
										<th><strong>操作</strong></th>
									</tr>

									<tr>
										<td>啊啊啊啊</td>
										<td>361158</td>
										<td>100000</td>
										<td>2015-10-28 14:31:05</td>
										<td>消费卡</td>
										<td><font color="red">非正式</font></td>
										<td>619</td>
									</tr>

									<tr>
										<td>特色他</td>
										<td>118509</td>
										<td>100000</td>
										<td>2015-10-28 14:30:13</td>
										<td>消费卡</td>
										<td><font color="red">非正式</font></td>
										<td>618</td>
									</tr>

									<tr>
										<td>托尔斯泰</td>
										<td>708979</td>
										<td>100000</td>
										<td>2015-10-28 14:29:41</td>
										<td>消费卡</td>
										<td><font color="red">非正式</font></td>
										<td>617</td>
									</tr>
									<tr>
										<td colspan="6">
											<!-- AspNetPager V7.0 for VS2008  Copyright:2003-2007 Webdiyer (www.webdiyer.com) -->
											<div id="AspNetPager1">
												<div style="float: left; width: 45%;">
													第<font color="red"><b>1</b></font>页，共有记录3条，分1页，每页显示12条记录
												</div>
												<div style="width: 55%; float: left;">
													<a disabled="disabled" style="margin-right: 5px;">第一页</a><a
						 								disabled="disabled" style="margin-right: 5px;">前一页</a><span
														style="margin-right: 5px; font-weight: Bold; color: red;">1</span><a
														disabled="disabled" style="margin-right: 5px;">下一页</a><a
														disabled="disabled" style="margin-right: 5px;">最后一页</a>&nbsp;&nbsp;<select
														name="AspNetPager1_input" id="AspNetPager1_input"
														onchange="__doPostBack(&#39;AspNetPager1&#39;,&#39;&#39;)">
														<option selected="true">1</option>
													</select>
												</div>
											</div> <!-- AspNetPager V7.0 for VS2008 End -->
										</td>
									</tr>
								</tbody>
							</table>
						</div> <script type="text/javascript">
<!--
var theForm = document.forms['Form1'];
if (!theForm) {
    theForm = document.Form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
// -->
</script>
	</form>
</body>
</html>