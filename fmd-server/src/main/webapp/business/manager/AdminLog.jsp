<%@page import="java.util.Date"%>
<%@page import="com.fmd.util.utils"%>
<%@page import="com.fmd.entity.Log"%>
<%@page import="com.fmd.service.LogService"%>
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
	String startTime = request.getParameter("startTime")==null?"":request.getParameter("startTime");
	String endTime = request.getParameter("endTime")==null?"":request.getParameter("endTime");
	String userid = request.getParameter("userid")==null?"":request.getParameter("userid");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	LogService logService =(LogService)wac.getBean("logService");
	Object obj = request.getSession().getAttribute("loginedUser");
	Member_user member_user = null;
	List<Log> log_lsit = null;
	int count = 0;
	if(obj!=null){
		member_user = (Member_user)obj;
		int from = (pageNum-1)*pagesize;
		log_lsit = logService.queryLog(userid,startTime, endTime, pagesize, from);
		count = logService.countLog(userid,startTime, endTime);
	}
	if("".equals(startTime)&&"".equals(endTime)){
		startTime = utils.getLastMonth(new Date());
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
	<link href="${path}/business/_files/common.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${path}/business/_files/style.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${path}/business/_files/font.css" rel="stylesheet" media="all" type="text/css">
	<script src="${path}/business/_files/menu.js" type="text/javascript"></script>
	<script type="text/javascript" src="/fmd-server/business/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
	<form name="Form1" method="post" action="AdminLog.jsp" id="Form1">
		<input type="hidden" name="pageNum" id="pageNum" value="<%=pageNum%>">
		<div class="ncenter_box">
			<div class="accounttitle">
				<h1>我的会员</h1>
			</div>
			<table width="100%" border="0" class="tab2">
				<tbody>
					<tr style="display:;">
						<td>用户id</td>
						<td><input name="userid" type="text" maxlength="16"
							id="userid" style="width: 80px;" value="<%=userid%>"></td>
						<td>开始时间</td>
						<td><input name="startTime" type="text" id="startTime"
							onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width: 150px;" value="<%=startTime%>"></td>
						<td>结束时间</td>
						<td><input name="endTime" type="text" id="endTime"
							onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width: 150px;" value="<%=endTime%>"></td>
						<td><input type="submit" name="lbSeach" value="搜索"
							id="lbSeach"></td>
					</tr>
				</tbody>
			</table>

			<table width="100%" border="0" class="tab2">
				<tbody>
					<tr>
						<th><strong>序号</strong></th>
						<th><strong>用户id</strong></th>
						<th><strong>用户名</strong></th>
						<th><strong>类型</strong></th>
						<th><strong>操作时间</strong></th>
						<th><strong>ip地址</strong></th>
						<th><strong>操作内容</strong></th>
					</tr>
					<%if(log_lsit!=null){
										int i=1;
										for(Log log:log_lsit) {%>
					<tr>
						<td><%=i++%></td>
						<td><%=log.getUser_id()%></td>
						<td><%=log.getUser_name()%></td>
						<td><%=utils.getLogType(log.getType())%></td>
						<td><%=log.getOperation_time()%></td>
						<td><%=log.getIp()%></td>
						<td><%=log.getOperation()%></td>
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
									<a style="margin-right: 5px;"
										href="<%=pageNum==1?"javascript:return false;":"javascript:doPostBack(1);"%>">第一页</a>
									<a style="margin-right: 5px;"
										href="<%=pageNum<=1?"javascript:return false;":"javascript:doPostBack("+(pageNum-1)+");"%>">前一页</a>
									<span style="margin-right: 5px; font-weight: Bold; color: red;"><%=pageNum%></span>
									<a style="margin-right: 5px;"
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
		</div>
		<script type="text/javascript">
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