<%@page import="com.fmd.service.Member_userService"%>
<%@page import="java.util.List"%>
<%@page import="com.fmd.entity.Member_user"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.fmd.entity.Capital_log"%>
<%@page import="com.fmd.service.Capital_logService"%>
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
	Capital_logService capital_logService = (Capital_logService)wac.getBean("capital_logService");
	Member_userService member_userService =(Member_userService)wac.getBean("member_userService");
	Object obj = request.getSession().getAttribute("loginedUser");
	Member_user member_user = null;
	List<Capital_log> capital_log_lsit = null;
	int count = 0;
	if(obj!=null){
		member_user = (Member_user)obj;
		int from = (pageNum-1)*pagesize;
		capital_log_lsit = capital_logService.queryCapital_log(member_user.getUserid(),pagesize,from);
		count = capital_logService.countCapital_log(member_user.getUserid());
		member_user = member_userService.getById(member_user.getId());
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
<title>奖金历史</title>
<link href="${path}/business/_files/WdatePicker.css" rel="stylesheet" type="text/css">
<script src="${path}/business/_files/main.js" type="text/javascript"></script>
<script src="${path}/business/_files/meizzDate.js" type="text/javascript"></script>
<script src="${path}/business/_files/fckeditor.js"></script>
<script src="${path}/business/_files/function.js" type="text/javascript"></script>
<script src="${path}/business/_files/menu.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/business/_files/WdatePicker.js"></script>
<link href="${path}/business/_files/common.css" rel="stylesheet" media="screen"
	type="text/css">
<link href="${path}/business/_files/style.css" rel="stylesheet" media="screen"
	type="text/css">
<link href="${path}/business/_files/font.css" rel="stylesheet" media="all"
	type="text/css">
</head>

<body>
	<form name="Form1" method="post" action="BonusHis.jsp" id="Form1">
		<div class="ncenter_box">
			<div class="accounttitle">
				<h1>总奖金明细</h1>
			</div>
			<table class="tab2">
				<!-- <tbody>
					<tr>
						<td>用户</td>
						<td><input name="UserName" type="text" maxlength="16"
							id="UserName" style="width: 80px;"></td>
						<td><select name="dlBonus" id="dlBonus">
								<option selected="selected" value="0">==全部=</option>
								<option value="1">对碰奖</option>
								<option value="2">推荐奖</option>
								<option value="3">市场管理奖</option>
								<option value="4">提成</option>
								<option value="5">市代管理奖</option>
								<option value="6">报单奖</option>
								<option value="7">养生店利润</option>
								<option value="8">管理费</option>
								<option value="10">市场促销奖</option>
								<option value="12">全国分红</option>
								<option value="13">重复消费</option>
								<option value="14">消费分红</option>

						</select></td>
						<td>开始时间</td>
						<td><input name="StarTime" type="text" id="StarTime"
							onclick="WdatePicker()" style="width: 100px;"></td>
						<td>结束时间</td>
						<td><input name="EndTime" type="text" id="EndTime"
							onclick="WdatePicker()" style="width: 100px;"></td>
						<td width="20%"><input type="submit" name="btSeach"
							value="搜索" id="btSeach"></td>
					</tr>
				</tbody> -->
			</table>

			<table class="tab2">


				<tbody>
					<tr>
						<td><strong>序号</strong></td>
						<td><strong>会员</strong></td>
						<td><strong>日期时间</strong></td>
						<td><strong>操作</strong></td>
						<td><strong>详细信息</strong></td>
						<td><strong>支出</strong></td>
						<td><strong>入账</strong></td>
						<td><strong>余额</strong></td>
						<td style="display: none"><strong>实际</strong></td>
					</tr>
					<%
						if (capital_log_lsit != null) {
							int i = 1;
							for (Capital_log log : capital_log_lsit) {
					%>
					<tr>
						<td><%=i++%></td>
						<td><%=log.getMember_id()%></td>
						<td><%=log.getTime()%></td>
						<td><%if(log.getOperation()==1)
							out.println("推荐奖");
							else if(log.getOperation()==2)
								out.println("管理奖");
							else if(log.getOperation()==3)
								out.println("见点奖");
							else out.println("支出");%></td>
						<td><%=log.getDetail()%></td>
						<td><%=log.getPayout()==null?"0":log.getPayout()%></td>
						<td><%=log.getIncome()%></td>
						<td><%=log.getRemain()%></td>
					</tr>
					<%}}%>
					<tr>
						<td colspan="9">
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