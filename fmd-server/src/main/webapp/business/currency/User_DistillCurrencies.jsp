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
		withdraw_log_list = withdraw_logService.queryWithdraw_log(member_user.getUserid(),pagesize,from);
		count = withdraw_logService.countWithdraw_log(member_user.getUserid());
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
		
		function takecash() {
			var take = document.Form1.take.value;
			if (take < 100) {
				alert("只能提现大于100的整数");
				return false;
			}
			if (take % 100 != 0) {
				alert("只能提现100的倍数");
				return false;
			}
			if (confirm('确定申请提现吗！')) {
				var pwd3 = document.Form1.pwd3.value;
				$.ajax({
					// 提交数据的类型 POST GET
					type : "POST",
					// 提交的网址
					url : contextPath + "/withdraw/take.action",
					// 提交的数据
					data : {
						pwd3 : pwd3,
						take : take,
					},
					// 返回数据的格式
					datatype : "text",// "xml", "html", "script", "json", "jsonp", "text".
					// 在请求之前调用的函数
					// beforeSend:function(){$("#msg").html("logining");},
					// 成功返回之后调用的函数
					success : function(data) {
						if (data == "1") {
							window.location.reload();
						} else if (data == "2") {
							alert("密码错误");
						}
					},
					// 调用执行后调用的函数
					complete : function(XMLHttpRequest, textStatus) {

					},
					// 调用出错执行的函数
					error : function() {
						// 请求出错处理
					}
				});
			}
		}
	</script>	
</head>
<body>
	<form name="Form1" method="post"  id="Form1">
		<input type="hidden" name="pageNum" id="pageNum" value="<%=pageNum%>">
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
							&nbsp;&nbsp;提现总额：<%=member_user.getWithdraw()==null?"0":member_user.getWithdraw()%>
						</td>
					</tr>
					<tr>
						<td colspan="2" height="30">申请提现金额: <input id="take" type="text" style="width: 70px;" value="100" onchange=""/>&nbsp;&nbsp;&nbsp;
							开户姓名：<%=member_user.getAccount_name() %>&nbsp;&nbsp;&nbsp;三级密码:<input name="pwd3" type="password" maxlength="18" id="pwd3" style="width: 100px;"> 
							&nbsp;&nbsp;&nbsp;<input type="button" name="btDistillCurrencies" value="确定申请" onclick="takecash();" id="btDistillCurrencies"></td>
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
						<th><strong>序号</strong></th>
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
					%>
					<tr class="GridItem" onMouseOver="over(this)"
						onMouseOut="over(this)">
						<td><span id="Repeater1__ctl1_lbId"><%=i++ %></span></td>
						<td><%=log.getOperation()==1?"提现":"其他" %></td>
						<td align=center><span id="Repeater1__ctl1_IbCurrencyNum"><%=log.getState()==2?"-"+log.getCapital():"+"+log.getCapital() %></span>
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
						<a href="javascript:cancel(<%=log.getId() %>,2);">取消提现</a>
						<%}else{ %>
							-
						<%} %>	
						</td>
					</tr>
					<% }}%>
					<%-- <tr id="Tr1" align="center">
						<td height="28" colspan="2">总计：</td>
						<td><%=member_user.getWithdraw() %></td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr> --%>
					<tr>
						<td colspan="6">
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