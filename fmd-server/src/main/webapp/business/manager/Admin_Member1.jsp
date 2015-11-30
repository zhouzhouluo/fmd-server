<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.fmd.service.Member_userService"%>
<%@page import="java.util.List"%>
<%@page import="com.fmd.entity.Member_user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	Object obj = request.getSession().getAttribute("loginedUser");
	Member_user member_user = null;
	if(obj!=null){
		member_user = (Member_user)obj;
	}
	int count = 0;
	int pagesize = 10;
	int pageNum = request.getParameter("pageNum")==null?1:Integer.parseInt(request.getParameter("pageNum"));
	int from = (pageNum-1)*pagesize;
	WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	Member_userService member_userService =(Member_userService)wac.getBean("member_userService");
	List<Member_user> member_user_lsit = member_userService.queryMember_Dsp(0,pagesize,from);
	count = member_userService.countMember_Dsp(0);
%>
<c:set var="ctx" value="<%=basePath%>" />
<c:set var="base" value="<%=base%>" />
<c:set var="path" value="<%=path%>" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<title>会员管理</title>
	<link href="${path}/business/_files/WdatePicker.css" rel="stylesheet" type="text/css">
	<script src="${path}/business/_files/main.js" type="text/javascript"></script>
	<script src="${path}/business/_files/meizzDate.js" type="text/javascript"></script>
	<script src="${path}/business/_files/fckeditor.js"></script>
	<script src="${path}/business/_files/function.js" type="text/javascript"></script>
	<script src="${path}/business/_files/menu.js" type="text/javascript"></script>
	<script type="text/javascript" src="${path}/business/_files/WdatePicker.js"></script>
	<link href="${path}/business/_files/common.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${path}/business/_files/style.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${path}/business/_files/font.css" rel="stylesheet" media="all" type="text/css">
	<script type="text/javascript" src="${path}/business/_files/jquery.js"></script>
	<script type="text/javascript">
		var contextPath = "<%=path%>";
	</script>
</head>
<body>
	<form name="Form1" method="post" action="" id="Form1">
	<input type="hidden" name="pageNum" id="pageNum" value="<%=pageNum%>">
		<div class="ncenter_box">
			<div class="accounttitle">
				<h1>审核会员</h1>
			</div>
			<table class="tab2" style="display: none;">
				<tbody>
					<tr align="center">
						<td height="30"><a
							href="Admin_Member1.jsp#"
							onclick="chk_idAll(Form1,1);">全部选择</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a
							href="Admin_Member1.jsp#"
							onclick="chk_idAll(Form1,0);">全部取消</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
							onclick="return confirm('请确认是否真的要开通会员?');" id="lbIspay"
							class="linktext" href="javascript:__doPostBack('lbIspay','')">开通会员</a></td>
					</tr>
					<tr align="center">
						<td>用户：<input name="UserName" type="text" maxlength="18"
							id="UserName" style="width: 80px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							姓名：<input name="BankUserName" type="text" maxlength="10"
							id="BankUserName" style="width: 80px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</select>&nbsp;&nbsp; <input type="submit" name="lbSeach" value="搜索"
							id="lbSeach"></td>
					</tr>
				</tbody>
			</table>
			<table border="0" class="tab2" id="chk_idAll">


				<tbody>
					<tr class="tit2">
						<th><strong>序号</strong></th>
						<th><strong>姓名</strong></th>
						<th><strong>用户名</strong></th>
						<th><strong>QQ</strong></th>
						<th><strong>联系电话</strong></th>
						<th><strong>E-mail</strong></th>
						<th><strong>推荐时间</strong></th>
						<th><strong>推荐人</strong></th>
						<th><strong>推荐人ID</strong></th>
						<th><strong>节点人</strong></th>
						<th><strong>节点人ID</strong></th>
						<th><strong>状态</strong></th>
						<th><strong>操作</strong></th>
					</tr>
					<%if(member_user_lsit!=null){
										int i=1;
										for(Member_user user:member_user_lsit) {%>
					<tr>
						<td><span id="Repeater1__ctl1_lbId"><%=i++%></span></td>
						<td><%=user.getAccount_name() %></td>
						<td><%=user.getUserid() %></td>
						<td><%=user.getQq()%></td>
						<td><%=user.getPhone_number()%></td>
						<td><%=user.getEmail()%></td>
						<td><%=user.getCjsj() %></td>
						<td><%=user.getReferee()%></td>
						<td><%=user.getReferee_id() %></td>
						<td><%=user.getNode()%></td>
						<td><%=user.getNode_id() %></td>
						<td><font color="red"><%=user.getState()==0?"非正式":"正式"%></font></td>
						<td>
							<a onclick="return confirm('请确认是否真的要设置该用户为正式会员?');"
							id="Repeater1__ctl1_ModIspay"
							href="javascript:sp('<%=user.getUserid() %>','1')"
							style="color: Red;">开通会员</a> <a
							onclick="return confirm('请确认是否真的要删除该用户?');"
							id="Repeater1__ctl1_DelUser"
							href="javascript:sp('<%=user.getUserid() %>','99')">删除</a>
						</td>
					</tr>
					<%}}%>
					<tr>
						<td colspan="13">
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
	</form>
</body>
</html>