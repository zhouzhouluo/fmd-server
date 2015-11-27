<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.fmd.entity.Member_user"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.fmd.service.Member_userService"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	int pagesize = 10;
	int pageNum = request.getParameter("pageNum")==null?1:Integer.parseInt(request.getParameter("pageNum"));
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	Member_userService member_userService =(Member_userService)wac.getBean("member_userService");
	Object obj = request.getSession().getAttribute("loginedUser");
	Member_user member_user = null;
	List<Member_user> member_user_lsit = null;
	int count = 0;
	if(obj!=null){
		member_user = (Member_user)obj;
		int from = (pageNum-1)*pagesize;
		member_user_lsit = member_userService.queryMember_users(member_user.getUserid(),pagesize,from);
		count = member_userService.countMember_users(member_user.getUserid());
	}
%>
<c:set var="basePath" value="<%=basePath%>" />
<c:set var="base" value="<%=base%>" />
<c:set var="path" value="<%=path%>" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
	<title>User_treerec</title>
	<link href="${path}/business/_files/WdatePicker.css" rel="stylesheet" type="text/css">
	<script src="${path}/business/_files/main.js" type="text/javascript"></script>
	<script src="${path}/business/_files/meizzDate.js" type="text/javascript"></script>
	<script type="text/javascript" src="${path}/business/_files/fckeditor.js"></script>
	<script src="${path}/business/_files/function.js" type="text/javascript"></script>
	<link href="${path}/business/_files/common.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${path}/business/_files/style.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${path}/business/_files/font.css" rel="stylesheet" media="all" type="text/css">
	<script src="${path}/business/_files/main.js" type="text/javascript"></script>
	<script src="${path}/business/_files/meizzDate.js" type="text/javascript"></script>
	<script src="${path}/business/_files/fckeditor.js"></script>
	<script src="${path}/business/_files/function.js" type="text/javascript"></script>
	<script src="${path}/business/_files/menu.js" type="text/javascript"></script>
	<script type="text/javascript"src="WdatePicker.js"></script>
	<link href="${path}/business/_files/common.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${path}/business/_files/style.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${path}/business/_files/font.css" rel="stylesheet" media="all" type="text/css">
	<script src="${path}/business/_files/menu.js" type="text/javascript"></script>
	<script type="text/javascript" src="${path}/business/_files/WdatePicker.js"></script>
</head>

<body>
	<form name="Form1" method="post" action="my_member.jsp" id="Form1">
		<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
			value="/wEPDwUJODgxODc2NjU1D2QWAgIHD2QWBAINDxYCHgtfIUl0ZW1Db3VudAIDFgYCAQ9kFgJmDxUHDOWViuWViuWViuWVigYzNjExNTgGMTAwMDAwEzIwMTUtMTAtMjggMTQ6MzE6MDUJ5raI6LS55Y2hIjxmb250IGNvbG9yPSJyZWQiPumdnuato+W8jzwvZm9udD4DNjE5ZAICD2QWAmYPFQcJ54m56Imy5LuWBjExODUwOQYxMDAwMDATMjAxNS0xMC0yOCAxNDozMDoxMwnmtojotLnljaEiPGZvbnQgY29sb3I9InJlZCI+6Z2e5q2j5byPPC9mb250PgM2MThkAgMPZBYCZg8VBwzmiZjlsJTmlq/ms7AGNzA4OTc5BjEwMDAwMBMyMDE1LTEwLTI4IDE0OjI5OjQxCea2iOi0ueWNoSI8Zm9udCBjb2xvcj0icmVkIj7pnZ7mraPlvI88L2ZvbnQ+AzYxN2QCDw8PFgIeC1JlY29yZGNvdW50AgNkZGRVLeEGOG4Qne+5NU+urOI2pee0xiu0sQ0M/5SkwgBooA==">
			<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
				<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT"
				value=""> <input type="hidden" name="__EVENTVALIDATION"
					id="__EVENTVALIDATION"
					value="/wEWBgKVj/LcBAKvruq2CALT+f69AwLzt9zuCwLduqHwAgKKlN3WBBfos+XbkfkSuxmoEJr+zCzsIORPoHzOp/VRvL4LTzNK">
					<input type="hidden" name="pageNum" id="pageNum" value="<%=pageNum%>">
						<div class="ncenter_box">
							<div class="accounttitle">
								<h1>我的会员</h1>
							</div>
							<table width="100%" border="0" class="tab2">
								<tbody>
									<tr style="display: none;">
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
										<th><strong>序号</strong></th>
										<th><strong>姓名</strong></th>
										<th><strong>用户名</strong></th>
										<th><strong>推荐人</strong></th>
										<th><strong>推荐时间</strong></th>
										<th><strong>状态</strong></th>
										<th><strong>操作</strong></th>
									</tr>
									<%if(member_user_lsit!=null){
										int i=1;
										for(Member_user user:member_user_lsit) {%>
									
									<tr>
										<td><%=i++%></td>
										<td><%=user.getAccount_name() %></td>
										<td><%=user.getUserid() %></td>
										<td><%=user.getReferee_id() %></td>
										<td><%=user.getCjsj() %></td>
										<td><font color="red"><%=user.getState()==0?"非正式":"正式"%></font></td>
										<td></td>
									</tr>
									
									<%}}%>
									<tr>
										<td colspan="7">
											<!-- AspNetPager V7.0 for VS2008  Copyright:2003-2007 Webdiyer (www.webdiyer.com) -->
											<div id="AspNetPager1">
												<div style="float: left; width: 45%;">
													第<font color="red"><b><%=pageNum%></b></font>页，共有记录<%=count%>条，分<%=count/pagesize+1 %>页，每页显示<%=pagesize %>条记录
												</div>
												<div style="width: 55%; float: left;">
													<a  style="margin-right: 5px;" 
														href="<%=pageNum==1?"javascript:return false;":"javascript:doPostBack(1);"%>">第一页</a> 
														<a style="margin-right: 5px;"
														href="<%=pageNum<=1?"javascript:return false;":"javascript:doPostBack("+(pageNum-1)+");"%>">前一页</a> <span
														style="margin-right: 5px; font-weight: Bold; color: red;"><%=pageNum%></span>
													<a 
														style="margin-right: 5px;"
														href="<%=pageNum>=(count/pagesize+1)?"javascript:return false;":"javascript:doPostBack("+(pageNum+1)+");"%>">下一页</a> 
														<a style="margin-right: 5px;"
														href="<%=pageNum>=(count/pagesize+1)?"javascript:return false;":"javascript:doPostBack("+(count/pagesize+1)+");"%>">最后一页</a>&nbsp;&nbsp;
													<select name="select" id="select"
														onchange="javascript:doPostBack(this.value);">
														<%for(int i=0;i<=count/pagesize;i++) {%>
														<option <%if(i==pageNum-1){%> selected <%} %>
															value="<%=i+1 %>"><%=i+1 %></option>
														<%} %>
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