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
	int isSend = request.getParameter("isSend")==null?0:Integer.parseInt(request.getParameter("isSend"));
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
	List<Member_user> member_user_lsit = member_userService.queryMember_Send(isSend,pagesize,from);
	count = member_userService.countMember_Send(isSend);
%>
<c:set var="ctx" value="<%=basePath%>" />
<c:set var="base" value="<%=base%>" />
<c:set var="path" value="<%=path%>" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<title>发货管理</title>
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
		function Selected() {
	        var isSend = document.Form1["isSend"].value;
	        window.location.href = "./Admin_Send.jsp?isSend="+isSend;
	    }
	</script>
</head>
<body>
	<form name="Form1" method="post" action="" id="Form1">
	<input type="hidden" name="pageNum" id="pageNum" value="<%=pageNum%>">
		<div class="ncenter_box">
			<div class="accounttitle">
				<h1>发货管理</h1>
			</div>
			<table class="tab2" style="display:;">
				<tbody>
					<tr align="">
						<td>
						是否发货&nbsp;<select name="isSend" id="isSend" onchange="Selected();">
								<option value=99 <%=isSend==99?"selected":""%>>全部</option>
								<option value=0 <%=isSend==0?"selected":"" %>>未发货</option>
								<option value=1 <%=isSend==1?"selected":"" %>>已发货</option>
								</select>
						<input type="button" name="lbSeach" value="搜索" id="lbSeach" style="display:none;">
						</td>
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
						<th><strong>是否发货</strong></th>
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
						<td><font color="red"><%=user.getIssend()==0?"未发货":"已发货"%></font></td>
						<td>
							<%if(user.getIssend()==0){ %>
								<a onclick="return confirm('请确认是否真的要发货?');"
								id="Repeater1__ctl1_ModIspay"
								href="javascript:fh('<%=user.getUserid() %>',1)"
								style="color: Red;">发货</a>
							<%} %>
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