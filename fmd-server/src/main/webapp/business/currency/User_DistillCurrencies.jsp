<%@page import="com.fmd.entity.Withdraw_log"%>
<%@page import="java.util.List"%>
<%@page import="com.fmd.service.Withdraw_logService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.fmd.entity.Member_user"%>
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
	Withdraw_logService withdraw_logService = (Withdraw_logService)wac.getBean("withdraw_logService");
	Object obj = request.getSession().getAttribute("loginedUser");
	Member_user member_user = null;
	List<Withdraw_log> withdraw_log_list = null;
	int count = 0;
	if(obj!=null){
		member_user = (Member_user)obj;
		int from = (pageNum-1)*pagesize;
		withdraw_log_list = withdraw_logService.queryCapital_log(member_user.getUserid(),pagesize,from);
		count = withdraw_logService.countCapital_log(member_user.getUserid());
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
<title>奖金提现</title>
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
	<form name="Form1" method="post" action="${path}/withdraw/take.action"
		id="Form1">
		<div class="ncenter_box">
			<div class="accounttitle">
				<h1>金币提现</h1>
			</div>
			<table width="98%" border="0" class="tab2">
				<tbody>
					<tr>
						<td>（<font color="red">提醒：姓名：<%=member_user.getAccount_name() %>&nbsp;&nbsp;
								账号：<%=member_user.getUserid()%>&nbsp; </font> ）
						</td>
					</tr>
					<tr>
						<td>奖金余额： <span id="Label1"><%=member_user.getCapital() %></span>
							&nbsp;&nbsp;提现总额：<%=member_user.getWithdraw()%>
						</td>
					</tr>
					<tr>
						<td colspan="2" height="30">申请提现金额额: 1000&nbsp;&nbsp;&nbsp;
							开户姓名：<%=member_user.getAccount_name() %>&nbsp;&nbsp;&nbsp;三级密码:<input name="pwd3" type="password" maxlength="18" id="pwd3" style="width: 100px;"> <input
							type="submit" name="btDistillCurrencies" value="确定申请"
							onclick="return confirm('确定申请提现吗！');"
							language="javascript" id="btDistillCurrencies"></td>
					</tr>
					<!-- <tr>
						<td colspan="2" height="30">开始时间:<input name="StarTime"
							type="text" id="StarTime" onclick="WdatePicker()"
							style="width: 100px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							结束时间:<input name="EndTime" type="text" id="EndTime"
							onclick="WdatePicker()" style="width: 100px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" name="lbSeach" value="搜索" id="lbSeach"></td>
					</tr> -->
				</tbody>
			</table>

			<table width="98%" border="0" class="tab2" id="chk_idAll">

				<tbody>
					<tr>
						<td><strong>序号</strong></td>
						<td><strong>编号</strong></td>
						<td><strong>类型</strong></td>
						<td align="center"><strong>金额</strong></td>
						<td><strong>申请时间</strong></td>
						<td><strong>状态</strong></td>
						<td><strong>操作</strong></td>
					</tr>
					<%
						if (withdraw_log_list != null) {
							int i = 1;
							for (Withdraw_log log : withdraw_log_list) {
					%>
					<tr class="GridItem" onMouseOver="over(this)"
						onMouseOut="over(this)">
						<td><span id="Repeater1__ctl1_lbId"><%=i++ %></span></td>
						<td><span id="Repeater1__ctl1_lbId"><%=log.getId() %></span></td>
						<td><%=log.getOperation()==1?"提现":"其他" %></td>
						<td align=center><span id="Repeater1__ctl1_IbCurrencyNum"><%=log.getCapital() %></span>
						</td>
						<td><%=log.getApply_time() %></td>
						<td><%if(log.getState()==0)
							out.println("未付款");
							else if(log.getOperation()==1)
								out.println("已付款");
							else if(log.getOperation()==2)
								out.println("取消");%></td>
						<td><a onclick="return confirm('请确定是否取消提现申请！');"
							id="Repeater1__ctl1_ModIspay"
							href="javascript:__doPostBack('Repeater1$_ctl1$ModIspay','')">取消提现</a></td>
					</tr>
					<% }}%>
					<tr id="Tr1" align="center">
						<td height="28" colspan="3">总计：</td>
						<td><%=member_user.getWithdraw() %></td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>
					<tr>
						<td colspan="7">
							<div id="AspNetPager1">
								<div style="float: left; width: 45%;">
									第<font color="red"><b><%=pageNum%></b></font>页，共有记录<%=count%>条，分<%=count/pagesize+1 %>页，每页显示<%=pagesize %>条记录
								</div>
								<div style="width: 55%; float: left;">
									<a <%=pageNum==1?"disabled":""%> style="margin-right: 5px;"
										href="javascript:doPostBack(1);">第一页</a> <a
										<%=pageNum<=1?"disabled":""%> style="margin-right: 5px;"
										href="javascript:doPostBack(<%=pageNum-1%>);">前一页</a> <span
										style="margin-right: 5px; font-weight: Bold; color: red;"><%=pageNum%></span>
									<a <%=pageNum>=(count/pagesize+1)?"disabled":""%>
										style="margin-right: 5px;"
										href="javascript:doPostBack(<%=pageNum+1%>);">下一页</a> <a
										<%=pageNum>=(count/pagesize+1)?"disabled":""%>
										style="margin-right: 5px;"
										href="javascript:doPostBack(<%=count/pagesize+1%>);">最后一页</a>&nbsp;&nbsp;
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