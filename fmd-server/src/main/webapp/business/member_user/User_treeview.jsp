<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.fmd.entity.Member_user"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.fmd.service.Member_userService"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path;
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	Member_userService member_userService = (Member_userService) wac.getBean("member_userService");
	String []tree = new String[15];
	String userid = request.getParameter("userid");
	if(userid==null||"".equals(userid)){
		Object obj = request.getSession().getAttribute("loginedUser");
		Member_user member_user = null;
		if(obj!=null){
			member_user = (Member_user)obj;
			userid = member_user.getUserid();
		}
	}
	tree[0]=userid;
%>
<c:set var="basePath" value="<%=basePath%>" />
<c:set var="base" value="<%=base%>" />
<c:set var="path" value="<%=path%>" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<title>User_treeview</title>
<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
<style type="text/css">
<!--
a {
	text-decoration: none;
	font-size: 12px;
	line-height: 16px;
	color: #fff;
}

body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #fff00;
}

a:hover {
	text-decoration: underline;
	color: #fff;
	font-weight: bold;
}

a:link {
	text-decoration: none;
	color: #fff;
	font-weight: bold;
}

a:visited {
	text-decoration: none;
	color: #fff;
	font-weight: bold;
}

.box {
	border: 1px solid #990066;
}

a:active {
	text-decoration: none;
}

td {
	font-size: 12px;
	line-height: 18px;
	/*
 
background-color:#FFFFFF;
filter: Alpha(Opacity=80);
, FinishOpacity=8, Style=1, StartX=45, StartY=2, FinishX=5, FinishY=5
*/
}

table.tablefilter {
	width: 95px;
	height: 70px;
	filter: Alpha(Opacity = 100);
	background-position: center;
	background-repeat: no-repeat;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #adba84;
	border-left-style: solid;
	border-left-color: #adba84;
	border-left-width: 1px;
	border-bottom-color: #adba84;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: #93C0FF;
}

td.tdfilter {
	/*
border:solid 1px #CCCCCC;

BACKGROUND: url(${path}/business/templets/XZ20140517/images/q.jpg) repeat-x left top;
	bordercolordark:#FF0000;
   
	position:relative;
	height: 28px;
     */
	
}

.borderall {
	border: solid 1px #CCCCCC;
}

.borderlr {
	border-left: solid 1px #CCCCCC;
	border-right: solid 1px #CCCCCC;
}

.borderlrt {
	/*
	border-left:solid 1px #CCCCCC;
	border-right:solid 1px #CCCCCC;
	border-top:solid 1px #CCCCCC;
*/
	background-repeat: no-repeat;
	background-position: center center;
	background-color: #e5e5e5;
	vertical-align: middle;
}

.borderlrb {
	border-left: solid 1px #CCCCCC;
	border-right: solid 1px #CCCCCC;
	border-bottom: solid 1px #CCCCCC;
}

.borderno {
	border: none;
}

.STYLE91 {
	font-size: 12px;
	color: #000000;
}

.STYLE92 {
	font-size: 16px;
	color: #000000;
	font-weight: bold;
}

.l {
	text-align: center;
	width: 40%;
}

.m {
	text-align: center;
	width: 20%;
}

.r {
	text-align: center;
	width: 40%;
}

.tablefilter td {
	/*background-color: #92A45B;*/
	
}

.lshy td {
	background-color: #F7DEF1;
	border: 1px solid #CCC;
}

.zshy td {
	background-color: #CCC;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #93C0FF;
	border-right-color: #adba84;
	border-bottom-color: #adba84;
	border-left-color: #adba84;
}

.lshy {
	background-color: #F7DEF1;
}

.zshy {
	background-color: #CCC;
}

.kongwei {
	background-color: #CCC;
}

.ulevel1 {
	background-color: #325E7F;
	/*BACKGROUND: url(${path}/business/templets/XZ20140517/images/q.jpg) repeat-x left top;*/
	color: #ffffff;
}

.ulevel2 {
	background-color: #C2D7EC;
}

.ulevel3 {
	background-color: #F3D31C;
}

.ulevel4 {
	background-color: #F9B763;
}

.ulevel5 {
	background-color: #95AF00;
}

.ulevel6 {
	background-color: #FF0000;
}
-->
</style>
<script language="javascript">
	var ismusicok = 0
	function purl(url, title) {
		parent.show_title(title);
		parent.switchTab('TabPage1', 'Tab3');
		parent.menu(parent.document.getElementById('Tab3'))
		parent.frames["content3"].location = url;
		parent.MM_showHideLayers('layer_wait', '', 'show');
	}

	function pmusicurl() {
		parent.switchTab('TabPage1', 'Tab2');
		parent.menu(parent.document.getElementById('Tab2'))
		//if(ismusicok == 0){parent.frames["content2"].location = 'api/api_aobo.asp?action=aobomusic';ismusicok = 1;}
	}
</script>
<link href="${path}/business/_files/WdatePicker.css" rel="stylesheet"
	type="text/css">
<script src="${path}/business/_files/main.js" type="text/javascript"></script>
<script src="${path}/business/_files/meizzDate.js"
	type="text/javascript"></script>
<script src="${path}/business/_files/fckeditor.js"></script>
<script src="${path}/business/_files/function.js" type="text/javascript"></script>
<script src="${path}/business/_files/menu.js" type="text/javascript"></script>
<script type="text/javascript"
	src="${path}/business/_files/WdatePicker.js"></script>
<link href="${path}/business/_files/common.css" rel="stylesheet"
	media="screen" type="text/css">
<link href="${path}/business/_files/style.css" rel="stylesheet"
	media="screen" type="text/css">
<link href="${path}/business/_files/font.css" rel="stylesheet"
	media="all" type="text/css">
</head>
<body>
	<noscript>&lt;iframe src=*.html&gt;&lt;/iframe&gt;</noscript>
	<form name="Form1" method="post" action="User_treeview.jsp" id="Form1">
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
		<div class="ncenter_box">
			<div class="accounttitle">
				<h1>团队网络</h1>
			</div>
			<table class="tab2">
				<tbody>
					<tr>
						<td class="head" background="login_08z.gif" style="height: 30px"><strong>&nbsp;<span
								class="style3">会员系谱图&nbsp;<input name="UserName" type="text"
									value="<%=userid %>" id="UserName"></span></strong> <input
							onclick="doPostJ();" name="action" type="button"
							id="action" class="buttonCN" value="跳转"> <span
							id="FatherUrl"></span></td>
					</tr>
				</tbody>
			</table>
			<table class="tab2">
				<tbody>
							<tr class="text">
								<td><table width="100%" border="0" cellpadding="1"
										cellspacing="1">
										<tbody>
											<tr align="center">
												<td class="borderlrt" width="100%" valign="top"
													title="第1层"><img width="12" height="0"><br>
													<table cellspacing="0" cellpadding="0"
														border="0" class="tablefilter">
														<tbody>
															<%Member_user member_user0 = member_userService.getUserByUserId(tree[0]); 
															if(tree[0]!=null&&!"".equals(tree[0])&&member_user0!=null){
																		Member_user member_user= member_user0;
																		tree[1]=member_user.getLeftid();
																		tree[2]=member_user.getRightid();
															%>																							
															<tr align="center" >
																<td colspan="2" class="tdfilter ulevel1"><%=tree[0]%></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2"  class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ tree[0]=null;%>
																<tr align="center">
																	<td class="kongwei"></td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
											</tr>
											<tr align="center">
												<td class="borderno" width="100%" valign="top">
													<img
													src="${path}/business/_files/t_tree_bottom_l.gif"
													alt="height=30"><img
													src="${path}/business/_files/t_tree_line.gif"
													width="25%" height="30"><img
													src="${path}/business/_files/t_tree_top.gif"
													alt="父节点" height="30"><img
													src="${path}/business/_files/t_tree_line.gif"
													width="25%" height="30"><img
													src="${path}/business/_files/t_tree_bottom_r.gif"
													alt="height=30">
												</td>
											</tr>
										</tbody>
									</table>
									<table width="100%" border="0" cellpadding="1"
										cellspacing="1">
										<tbody>
											<tr align="center">
												<td class="borderlrt" width="50%" valign="top"
													title="第2层"><img width="12" height="0"><br>
													<table width="100" cellspacing="0" cellpadding="0"
														class="tablefilter">
														<tbody>
															<%if(tree[1]!=null&&!"".equals(tree[1])){
																		Member_user member_user= member_userService.getUserByUserId(tree[1]);
																		tree[3]=member_user.getLeftid();
																		tree[4]=member_user.getRightid();
															%>																							
															<tr align="center">
																<td colspan="2" class="tdfilter ulevel1"><a
																	href="${path}/business/member_user/User_treeview.jsp?userid=<%=member_user.getUserid()%>"><%=tree[1]%></a></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2" class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ %>
																<tr align="center">
																	<td class="kongwei">
																	<%if(tree[0]!=null&&!"".equals(tree[0])){ %>
																		<a href="${path}/business/member_user/reg.jsp?nodeuserid=<%=tree[0]%>&aere=0" title="推荐"><br>产品订购</a>
																	<%}else{ %>
																		[空位]
																	<%}%>
																	</td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
												<td class="borderlrt" width="50%" valign="top"
													title="第2层"><img width="12" height="0"><br>
													<table width="100" cellspacing="0" cellpadding="0"
														class="tablefilter">
														<tbody>
															<%if(tree[2]!=null&&!"".equals(tree[2])){
																		Member_user member_user= member_userService.getUserByUserId(tree[2]);
																		tree[5]=member_user.getLeftid();
																		tree[6]=member_user.getRightid();
															%>																					
															<tr align="center">
																<td colspan="2" class="tdfilter ulevel1"><a
																	href="${path}/business/member_user/User_treeview.jsp?userid=<%=member_user.getUserid()%>"><%=tree[2]%></a></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2" class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ %>
																<tr align="center">
																	<td class="kongwei">
																	<%if(tree[0]!=null&&!"".equals(tree[0])){ %>
																		<a href="${path}/business/member_user/reg.jsp?nodeuserid=<%=tree[0]%>&aere=1" title="推荐"><br>产品订购</a>
																	<%}else{ %>
																		[空位]
																	<%}%>
																	</td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
											</tr>
											<tr align="center">
												<td class="borderno" width="50%" valign="top"><img
													src="${path}/business/_files/t_tree_bottom_l.gif"
													alt="height=30"><img
													src="${path}/business/_files/t_tree_line.gif"
													width="25%" height="30"><img
													src="${path}/business/_files/t_tree_top.gif"
													alt="父节点" height="30"><img
													src="${path}/business/_files/t_tree_line.gif"
													width="25%" height="30"><img
													src="${path}/business/_files/t_tree_bottom_r.gif"
													alt="height=30"></td>
												<td class="borderno" width="50%" valign="top"><img
													src="${path}/business/_files/t_tree_bottom_l.gif"
													alt="height=30"><img
													src="${path}/business/_files/t_tree_line.gif"
													width="25%" height="30"><img
													src="${path}/business/_files/t_tree_top.gif"
													alt="父节点" height="30"><img
													src="${path}/business/_files/t_tree_line.gif"
													width="25%" height="30"><img
													src="${path}/business/_files/t_tree_bottom_r.gif"
													alt="height=30"></td>
											</tr>
										</tbody>
									</table>
									<table width="100%" border="0" cellpadding="1"
										cellspacing="1">
										<tbody>
											<tr align="center">
												<td class="borderlrt" width="25%" valign="top"
													title="第3层"><img width="12" height="0"><br>
													<table width="100" cellspacing="0" cellpadding="0"
														class="tablefilter">
														<tbody>
															<%if(tree[3]!=null&&!"".equals(tree[3])){
																		Member_user member_user= member_userService.getUserByUserId(tree[3]);
																		tree[7]=member_user.getLeftid();
																		tree[8]=member_user.getRightid();
															%>																							
															<tr align="center">
																<td colspan="2" class="tdfilter ulevel1"><a
																	href="${path}/business/member_user/User_treeview.jsp?userid=<%=member_user.getUserid()%>"><%=tree[3]%></a></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2" class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ %>
																<tr align="center">
																	<td class="kongwei">
																	<%if(tree[1]!=null&&!"".equals(tree[1])&&tree[2]!=null&&!"".equals(tree[2])){ %>
																		<a href="${path}/business/member_user/reg.jsp?nodeuserid=<%=tree[1]%>&aere=0" title="推荐"><br>产品订购</a>
																	<%}else{ %>
																		[空位]
																	<%}%>
																	</td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
												<td class="borderlrt" width="25%" valign="top"
													title="第3层"><img width="12" height="0"><br>
													<table cellspacing="0" cellpadding="0"
														class="tablefilter">
														<tbody>
															<%if(tree[4]!=null&&!"".equals(tree[4])){
																		Member_user member_user= member_userService.getUserByUserId(tree[4]);
																		tree[9]=member_user.getLeftid();
																		tree[10]=member_user.getRightid();
															%>																						
															<tr align="center">
																<td colspan="2" class="tdfilter ulevel1"><a
																	href="${path}/business/member_user/User_treeview.jsp?userid=<%=member_user.getUserid()%>"><%=tree[4]%></a></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2" class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ %>
																<tr align="center">
																	<td class="kongwei">
																	<%if(tree[1]!=null&&!"".equals(tree[1])&&tree[2]!=null&&!"".equals(tree[2])){ %>
																		<a href="${path}/business/member_user/reg.jsp?nodeuserid=<%=tree[1]%>&aere=1" title="推荐"><br>产品订购</a>
																	<%}else{ %>
																		[空位]
																	<%}%>
																	</td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
												<td class="borderlrt" width="25%" valign="top"
													title="第3层"><img width="12" height="0"><br>
													<table cellspacing="0" cellpadding="0"
														class="tablefilter">
														<tbody>
															<%if(tree[5]!=null&&!"".equals(tree[5])){
																		Member_user member_user= member_userService.getUserByUserId(tree[5]);
																		tree[11]=member_user.getLeftid();
																		tree[12]=member_user.getRightid();
															%>																						
															<tr align="center">
																<td colspan="2" class="tdfilter ulevel1"><a
																	href="${path}/business/member_user/User_treeview.jsp?userid=<%=member_user.getUserid()%>"><%=tree[5]%></a></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2" class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ %>
																<tr align="center">
																	<td class="kongwei">
																	<%if(tree[1]!=null&&!"".equals(tree[1])&&tree[2]!=null&&!"".equals(tree[2])){ %>
																		<a href="${path}/business/member_user/reg.jsp?nodeuserid=<%=tree[2]%>&aere=0" title="推荐"><br>产品订购</a>
																	<%}else{ %>
																		[空位]
																	<%}%>
																	</td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
												<td class="borderlrt" width="25%" valign="top"
													title="第3层"><img width="12" height="0"><br>
													<table cellspacing="0" cellpadding="0"
														class="tablefilter">
														<tbody>
															<%if(tree[6]!=null&&!"".equals(tree[6])){
																		Member_user member_user= member_userService.getUserByUserId(tree[6]);
																		tree[13]=member_user.getLeftid();
																		tree[14]=member_user.getRightid();
															%>																						
															<tr align="center">
																<td colspan="2" class="tdfilter ulevel1"><a
																	href="${path}/business/member_user/User_treeview.jsp?userid=<%=member_user.getUserid()%>"><%=tree[6]%></a></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2" class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ %>
																<tr align="center">
																	<td class="kongwei">
																	<%if(tree[1]!=null&&!"".equals(tree[1])&&tree[2]!=null&&!"".equals(tree[2])){ %>
																		<a href="${path}/business/member_user/reg.jsp?nodeuserid=<%=tree[2]%>&aere=1" title="推荐"><br>产品订购</a>
																	<%}else{ %>
																		[空位]
																	<%}%>
																	</td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
											</tr>
											<tr align="center">
												<td class="borderno" width="25%" valign="top"><img
													src="${path}/business/_files/t_tree_bottom_l.gif"
													alt="height=30"><img
													src="${path}/business/_files/t_tree_line.gif"
													width="25%" height="30"><img
													src="${path}/business/_files/t_tree_top.gif"
													alt="父节点" height="30"><img
													src="${path}/business/_files/t_tree_line.gif"
													width="25%" height="30"><img
													src="${path}/business/_files/t_tree_bottom_r.gif"
													alt="height=30"></td>
												<td class="borderno" width="25%" valign="top"><img
													src="${path}/business/_files/t_tree_bottom_l.gif"
													alt="height=30"><img
													src="${path}/business/_files/t_tree_line.gif"
													width="25%" height="30"><img
													src="${path}/business/_files/t_tree_top.gif"
													alt="父节点" height="30"><img
													src="${path}/business/_files/t_tree_line.gif"
													width="25%" height="30"><img
													src="${path}/business/_files/t_tree_bottom_r.gif"
													alt="height=30"></td>
												<td class="borderno" width="25%" valign="top"><img
													src="${path}/business/_files/t_tree_bottom_l.gif"
													alt="height=30"><img
													src="${path}/business/_files/t_tree_line.gif"
													width="25%" height="30"><img
													src="${path}/business/_files/t_tree_top.gif"
													alt="父节点" height="30"><img
													src="${path}/business/_files/t_tree_line.gif"
													width="25%" height="30"><img
													src="${path}/business/_files/t_tree_bottom_r.gif"
													alt="height=30"></td>
												<td class="borderno" width="25%" valign="top"><img
													src="${path}/business/_files/t_tree_bottom_l.gif"
													alt="height=30"><img
													src="${path}/business/_files/t_tree_line.gif"
													width="25%" height="30"><img
													src="${path}/business/_files/t_tree_top.gif"
													alt="父节点" height="30"><img
													src="${path}/business/_files/t_tree_line.gif"
													width="25%" height="30"><img
													src="${path}/business/_files/t_tree_bottom_r.gif"
													alt="height=30"></td>
											</tr>
										</tbody>
									</table>
									<table width="100%" border="0" cellpadding="1"
										cellspacing="1">
										<tbody>
											<tr align="center">
												<td class="borderlrt" width="12%" valign="top"
													title="第4层"><img width="12" height="0"><br>
													<table width="100" cellspacing="0" cellpadding="0"
														class="tablefilter">
														<tbody>
															<%if(tree[7]!=null&&!"".equals(tree[7])){
																		Member_user member_user= member_userService.getUserByUserId(tree[7]);
															%>																						
															<tr align="center">
																<td colspan="2" class="tdfilter ulevel1"><a
																	href="${path}/business/member_user/User_treeview.jsp?userid=<%=member_user.getUserid()%>"><%=tree[7]%></a></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2" class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ %>
																<tr align="center">
																	<td class="kongwei">
																	<%if(tree[3]!=null&&!"".equals(tree[3])&&tree[4]!=null&&!"".equals(tree[4])
																			&&tree[5]!=null&&!"".equals(tree[5])&&tree[6]!=null&&!"".equals(tree[6])){ %>
																		<a href="${path}/business/member_user/reg.jsp?nodeuserid=<%=tree[3]%>&aere=0" title="推荐"><br>产品订购</a>
																	<%}else{ %>
																		[空位]
																	<%}%>
																	</td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
												<td class="borderlrt" width="12%" valign="top"
													title="第4层"><img width="12" height="0"><br>
													<table cellspacing="0" cellpadding="0"
														class="tablefilter">
														<tbody>
															<%if(tree[8]!=null&&!"".equals(tree[8])){
																		Member_user member_user= member_userService.getUserByUserId(tree[8]);
															%>																						
															<tr align="center">
																<td colspan="2" class="tdfilter ulevel1"><a
																	href="${path}/business/member_user/User_treeview.jsp?userid=<%=member_user.getUserid()%>"><%=tree[8]%></a></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2" class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ %>
																<tr align="center">
																	<td class="kongwei">
																	<%if(tree[3]!=null&&!"".equals(tree[3])&&tree[4]!=null&&!"".equals(tree[4])
																			&&tree[5]!=null&&!"".equals(tree[5])&&tree[6]!=null&&!"".equals(tree[6])){ %>
																		<a href="${path}/business/member_user/reg.jsp?nodeuserid=<%=tree[3]%>&aere=1" title="推荐"><br>产品订购</a>
																	<%}else{ %>
																		[空位]
																	<%}%>
																	</td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
												<td class="borderlrt" width="12%" valign="top"
													title="第4层"><img width="12" height="0"><br>
													<table width="100" cellspacing="0" cellpadding="0"
														class="tablefilter">
														<tbody>
															<%if(tree[9]!=null&&!"".equals(tree[9])){
																		Member_user member_user= member_userService.getUserByUserId(tree[9]);
															%>																					
															<tr align="center">
																<td colspan="2" class="tdfilter ulevel1"><a
																	href="${path}/business/member_user/User_treeview.jsp?userid=<%=member_user.getUserid()%>"><%=tree[9]%></a></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2" class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ %>
																<tr align="center">
																	<td class="kongwei">
																	<%if(tree[3]!=null&&!"".equals(tree[3])&&tree[4]!=null&&!"".equals(tree[4])
																			&&tree[5]!=null&&!"".equals(tree[5])&&tree[6]!=null&&!"".equals(tree[6])){ %>
																		<a href="${path}/business/member_user/reg.jsp?nodeuserid=<%=tree[4]%>&aere=0" title="推荐"><br>产品订购</a>
																	<%}else{ %>
																		[空位]
																	<%}%>
																	</td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
												<td class="borderlrt" width="12%" valign="top"
													title="第4层"><img width="12" height="0"><br>
													<table width="100" cellspacing="0" cellpadding="0"
														class="tablefilter">
														<tbody>
															<%if(tree[10]!=null&&!"".equals(tree[10])){
																		Member_user member_user= member_userService.getUserByUserId(tree[10]);
															%>																							
															<tr align="center">
																<td colspan="2" class="tdfilter ulevel1"><a
																	href="${path}/business/member_user/User_treeview.jsp?userid=<%=member_user.getUserid()%>"><%=tree[10]%></a></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2" class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ %>
																<tr align="center">
																	<td class="kongwei">
																	<%if(tree[3]!=null&&!"".equals(tree[3])&&tree[4]!=null&&!"".equals(tree[4])
																			&&tree[5]!=null&&!"".equals(tree[5])&&tree[6]!=null&&!"".equals(tree[6])){ %>
																		<a href="${path}/business/member_user/reg.jsp?nodeuserid=<%=tree[4]%>&aere=1" title="推荐"><br>产品订购</a>
																	<%}else{ %>
																		[空位]
																	<%}%>
																	</td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
												<td class="borderlrt" width="12%" valign="top"
													title="第4层"><img width="12" height="0"><br>
													<table width="100" cellspacing="0" cellpadding="0"
														class="tablefilter">
														<tbody>
															<%if(tree[11]!=null&&!"".equals(tree[11])){
																		Member_user member_user= member_userService.getUserByUserId(tree[11]);
															%>																						
															<tr align="center">
																<td colspan="2" class="tdfilter ulevel1"><a
																	href="User_treeview.jsp?userid=<%=member_user.getUserid()%>"><%=tree[11]%></a></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2" class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ %>
																<tr align="center">
																	<td class="kongwei">
																	<%if(tree[3]!=null&&!"".equals(tree[3])&&tree[4]!=null&&!"".equals(tree[4])
																			&&tree[5]!=null&&!"".equals(tree[5])&&tree[6]!=null&&!"".equals(tree[6])){ %>
																		<a href="${path}/business/member_user/reg.jsp?nodeuserid=<%=tree[5]%>&aere=0" title="推荐"><br>产品订购</a>
																	<%}else{ %>
																		[空位]
																	<%}%>
																	</td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
												<td class="borderlrt" width="12%" valign="top"
													title="第4层"><img width="12" height="0"><br>
													<table width="100" cellspacing="0" cellpadding="0"
														class="tablefilter">
														<tbody>
															<%if(tree[12]!=null&&!"".equals(tree[12])){
																		Member_user member_user= member_userService.getUserByUserId(tree[12]);
															%>																						
															<tr align="center">
																<td colspan="2" class="tdfilter ulevel1"><a
																	href="${path}/business/member_user/User_treeview.jsp?userid=<%=member_user.getUserid()%>"><%=tree[12]%></a></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2" class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ %>
																<tr align="center">
																	<td class="kongwei">
																	<%if(tree[3]!=null&&!"".equals(tree[3])&&tree[4]!=null&&!"".equals(tree[4])
																			&&tree[5]!=null&&!"".equals(tree[5])&&tree[6]!=null&&!"".equals(tree[6])){ %>
																		<a href="${path}/business/member_user/reg.jsp?nodeuserid=<%=tree[5]%>&aere=1" title="推荐"><br>产品订购</a>
																	<%}else{ %>
																		[空位]
																	<%}%>
																	</td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
												<td class="borderlrt" width="12%" valign="top"
													title="第4层"><img width="12" height="0"><br>
													<table width="100" cellspacing="0" cellpadding="0"
														class="tablefilter">
														<tbody>
															<%if(tree[13]!=null&&!"".equals(tree[13])){
																		Member_user member_user= member_userService.getUserByUserId(tree[13]);
															%>																						
															<tr align="center">
																<td colspan="2" class="tdfilter ulevel1"><a
																	href="${path}/business/member_user/User_treeview.jsp?userid=<%=member_user.getUserid()%>"><%=tree[13]%></a></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2" class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ %>
																<tr align="center">
																	<td class="kongwei">
																	<%if(tree[3]!=null&&!"".equals(tree[3])&&tree[4]!=null&&!"".equals(tree[4])
																			&&tree[5]!=null&&!"".equals(tree[5])&&tree[6]!=null&&!"".equals(tree[6])){ %>
																		<a href="${path}/business/member_user/reg.jsp?nodeuserid=<%=tree[6]%>&aere=0" title="推荐"><br>产品订购</a>
																	<%}else{ %>
																		[空位]
																	<%}%>
																	</td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
												<td class="borderlrt" width="12%" valign="top"
													title="第4层"><img width="12" height="0"><br>
													<table width="100" cellspacing="0" cellpadding="0"
														class="tablefilter">
														<tbody>
															<%if(tree[14]!=null&&!"".equals(tree[14])){
																		Member_user member_user= member_userService.getUserByUserId(tree[14]);
															%>																						
															<tr align="center">
																<td colspan="2" class="tdfilter ulevel1"><a
																	href="${path}/business/member_user/User_treeview.jsp?userid=<%=member_user.getUserid()%>"><%=tree[14]%></a></td>
															</tr>
															<tr align="center" bgcolor="#006600">
																<td colspan="2" class="<%=1==member_user.getState()?"zshy":"lshy"%>"
																	bgcolor="#eeeeee">
																	<%=member_user.getAccount_name() %>
																</td>
															</tr>
															<tr bgcolor="#006600">
																<td bgcolor="#eeeeee" style="">
																	 <span style="font-size:10px">左&nbsp;<%=member_userService.countChildList(member_user.getLeftid())%></span>
																</td>
																<td bgcolor="#eeeeee">
																	<span style="font-size:10px">右&nbsp;<%=member_userService.countChildList(member_user.getRightid())%></span>
																</td>
															</tr>
															<%}else{ %>
																<tr align="center">
																	<td class="kongwei">
																	<%if(tree[3]!=null&&!"".equals(tree[3])&&tree[4]!=null&&!"".equals(tree[4])
																			&&tree[5]!=null&&!"".equals(tree[5])&&tree[6]!=null&&!"".equals(tree[6])){ %>
																		<a href="${path}/business/member_user/reg.jsp?nodeuserid=<%=tree[6]%>&aere=1" title="推荐"><br>产品订购</a>
																	<%}else{ %>
																		[空位]
																	<%}%>
																	</td>
																</tr>
															<%}%>
														</tbody>
													</table></td>
											</tr>
											<tr align="center">
											</tr>
										</tbody>
									</table></td>
							</tr>
						</tbody>
					</table>
			<table width="100%" border="0" cellspacing="1" cellpadding="4">
				<tbody>
					<tr align="center" class="head">
						<td>
							<table width="300" border="0" cellspacing="1" cellpadding="4"
								style="background-color: #FFFFFF; border: solid" 1px=""
								#ffcccc="">
								<tbody>
									<tr class="head" align="center">
										<td width="80">下部底色</td>
										<td class="lshy">非正式会员</td>
										<td class="zshy">正式会员</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>