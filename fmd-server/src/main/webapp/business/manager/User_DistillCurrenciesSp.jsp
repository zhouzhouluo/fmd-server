<%@page import="com.fmd.service.Member_userService"%>
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
	Member_userService member_userService =(Member_userService)wac.getBean("member_userService");
	Object obj = request.getSession().getAttribute("loginedUser");
	Member_user member_user = null;
	List<Withdraw_log> withdraw_log_list = null;
	int count = 0;
	if(obj!=null){
		member_user = (Member_user)obj;
		int from = (pageNum-1)*pagesize;
		withdraw_log_list = withdraw_logService.queryWithdraw_log_dsp(0,pagesize,from);
		count = withdraw_logService.countWithdraw_log_dsp(0);
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
	<script type="text/javascript" src="${path}/business/_files/jquery.js"></script>
	<script type="text/javascript">
		var contextPath = "<%=path%>";
		var capital = <%=member_user.getCapital() %>;
	</script>	
</head>
<body>
	<form name="Form1" method="post" 
		id="Form1">
		<input type="hidden" name="pageNum" id="pageNum" value="<%=pageNum%>">
		<div class="ncenter_box">
			<div class="accounttitle">
				<h1>奖金提现</h1>
			</div>
			<table width="98%" border="0" class="tab2">
				<tbody>
				</tbody>
			</table>

			<table width="98%" border="0" class="tab2" id="chk_idAll">

				<tbody>
					<tr>
						<th><strong>序号</strong></th>
						<th><strong>姓名</strong></th>
						<th><strong>会员号</strong></th>
						<th><strong>银行卡号</strong></th>
						<th><strong>开户行</strong></th>
						<th><strong>类型</strong></th>
						<th align="center"><strong>金额</strong></th>
						<th><strong>申请时间</strong></th>
						<th><strong>状态</strong></th>
						<th><strong>操作</strong></th>
					</tr>
					<%
						if (withdraw_log_list != null) {
							int i = 1;
							for (Withdraw_log log : withdraw_log_list) {
							Member_user user0 = member_userService.getUserByUserId(log.getMember_id());
					%>
					<tr class="GridItem" onMouseOver="over(this)"
						onMouseOut="over(this)">
						<td><span id="Repeater1__ctl1_lbId"><%=i++ %></span></td>
						<td><%=log.getMember()%></td>
						<td><%=log.getMember_id()%></td>
						<td><%=log.getAccount()==null?user0.getAccount():log.getAccount()%></td>
						<td><%=log.getAccount_node()==null?user0.getAccount_node():log.getAccount_node()%></td>
						<td><%=log.getOperation()==1?"提现":"其他" %></td>
						<td align=center><span id="Repeater1__ctl1_IbCurrencyNum"><%=log.getCapital() %></span>
						</td>
						<td><%=log.getApply_time() %></td>
						<td><%if(log.getState()==0)
							out.println("未付款");
							else if(log.getState()==1)
								out.println("已付款");
							else if(log.getState()==2)
								out.println("取消");%></td>
						<td>
						<%if(log.getState()==0) {%>
						<a href="javascript:txsp(<%=log.getId() %>,1);">审批</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:txsp(<%=log.getId() %>,2);">取消</a>
						<%}else{ %>
							-
						<%} %>	
						</td>
					</tr>
					<% }}%>
					<tr>
						<td colspan="11">
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