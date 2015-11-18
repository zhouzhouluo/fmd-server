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
	int pagesize = 10;
	int pageNum = request.getParameter("pageNum") == null
			? 1
			: Integer.parseInt(request.getParameter("pageNum"));
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	Member_userService member_userService = (Member_userService) wac.getBean("member_userService");
	Map<Integer,Member_user> map = member_userService.getTree("000001");
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
	<form name="Form1" method="post" action="User_treeview.html" id="Form1">
		<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
		<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT"
			value="">

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
		<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION"
			value="/wEWAwKe7rj8CwKvruq2CALS9pLoCB2H0SVU9AgPsKw4lYN/WY/t+PHHb/KrX9VUbyfdp7qy">

		<div class="ncenter_box">
			<div class="accounttitle">
				<h1>团队网络</h1>
			</div>

			<table class="tab2">
				<tbody>
					<tr>
						<td class="head" background="login_08z.gif" style="height: 30px"><strong>&nbsp;<span
								class="style3">会员系谱图<input name="UserName" type="text"
									value="100000" id="UserName"></span></strong> <input
							onclick="__doPostBack('action','')" name="action" type="button"
							id="action" class="buttonCN" value="跳转"> <span
							id="FatherUrl"></span></td>
					</tr>
				</tbody>
			</table>
			<table class="tab2">
				<tbody>
					<tr>
						<td><span id="lbTree"><table width="100%" border="0"
									align="center" cellpadding="0" cellspacing="0"
									class="tb_border">
									<tbody>
										<tr>
											<td bgcolor="#f6f6ec">
												<table width="100%" border="0" cellspacing="1"
													cellpadding="4">
													<tbody>
														<tr class="text">
															<td><table width="100%" border="0" cellpadding="1"
																	cellspacing="1">
																	<tbody>
																		<tr align="center">
																			<td class="borderlrt" width="100%" valign="top"
																				title="第1层"><img width="12" height="0"><br>
																				<table width="100" cellspacing="0" cellpadding="0"
																					border="0" class="tablefilter">
																					<tbody>
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel5"><a
																								href="User_treeview.jsp?userid="><%=map.get(1)!=null?map.get(1).getUserid(): ""%></a>
																							</td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">5</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">5</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">5</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
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
																						<%if(map.get(2)!=null) { Member_user m = map.get(2);%>																							
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel1"><a
																								href="http://xz20141114.dflvip.com/Member/User_treeview.aspx?UserID=617"><%=m.getUserid() %></a></td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																						<%}else{ %>
																							<tr align="center">
																								<td class="kongwei"><a
																									href=""
																									title="推荐">[空位]<br>推荐
																								</a></td>
																							</tr>
																						<%}%>
																					</tbody>
																				</table></td>
																			<td class="borderlrt" width="50%" valign="top"
																				title="第2层"><img width="12" height="0"><br>
																				<table width="100" cellspacing="0" cellpadding="0"
																					class="tablefilter">
																					<tbody>
																						<%if(map.get(3)!=null) {Member_user m = map.get(3);%>																							
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel1"><a
																								href="http://xz20141114.dflvip.com/Member/User_treeview.aspx?UserID=617"><%=m.getUserid() %></a></td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																						<%}else{ %>
																							<tr align="center">
																								<td class="kongwei"><a
																									href=""
																									title="推荐">[空位]<br>推荐
																								</a></td>
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
																						<%if(map.get(4)!=null) { Member_user m = map.get(4);%>																							
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel1"><a
																								href="http://xz20141114.dflvip.com/Member/User_treeview.aspx?UserID=617"><%=m.getUserid() %></a></td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																						<%}else{ %>
																							<tr align="center">
																								<td class="kongwei"><a
																									href=""
																									title="推荐">[空位]<br>推荐
																								</a></td>
																							</tr>
																						<%}%>
																					</tbody>
																				</table></td>
																			<td class="borderlrt" width="25%" valign="top"
																				title="第3层"><img width="12" height="0"><br>
																				<table cellspacing="0" cellpadding="0"
																					class="tablefilter">
																					<tbody>
																						<%if(map.get(5)!=null) { Member_user m = map.get(5);%>																							
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel1"><a
																								href="http://xz20141114.dflvip.com/Member/User_treeview.aspx?UserID=617"><%=m.getUserid() %></a></td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																						<%}else{ %>
																							<tr align="center">
																								<td class="kongwei"><a
																									href=""
																									title="推荐">[空位]<br>推荐
																								</a></td>
																							</tr>
																						<%}%>
																					</tbody>
																				</table></td>
																			<td class="borderlrt" width="25%" valign="top"
																				title="第3层"><img width="12" height="0"><br>
																				<table cellspacing="0" cellpadding="0"
																					class="tablefilter">
																					<tbody>
																						<%if(map.get(6)!=null) { Member_user m = map.get(6);%>																							
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel1"><a
																								href="http://xz20141114.dflvip.com/Member/User_treeview.aspx?UserID=617"><%=m.getUserid() %></a></td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																						<%}else{ %>
																							<tr align="center">
																								<td class="kongwei"><a
																									href=""
																									title="推荐">[空位]<br>推荐
																								</a></td>
																							</tr>
																						<%}%>
																					</tbody>
																				</table></td>
																			<td class="borderlrt" width="25%" valign="top"
																				title="第3层"><img width="12" height="0"><br>
																				<table cellspacing="0" cellpadding="0"
																					class="tablefilter">
																					<tbody>
																						<%if(map.get(7)!=null) { Member_user m = map.get(7);%>																							
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel1"><a
																								href="http://xz20141114.dflvip.com/Member/User_treeview.aspx?UserID=617"><%=m.getUserid() %></a></td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																						<%}else{ %>
																							<tr align="center">
																								<td class="kongwei"><a
																									href=""
																									title="推荐">[空位]<br>推荐
																								</a></td>
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
																						<%if(map.get(8)!=null) { Member_user m = map.get(8);%>																							
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel1"><a
																								href="http://xz20141114.dflvip.com/Member/User_treeview.aspx?UserID=617"><%=m.getUserid() %></a></td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																						<%}else{ %>
																							<tr align="center">
																								<td class="kongwei"><a
																									href=""
																									title="推荐">[空位]<br>推荐
																								</a></td>
																							</tr>
																						<%}%>
																					</tbody>
																				</table></td>
																			<td class="borderlrt" width="12%" valign="top"
																				title="第4层"><img width="12" height="0"><br>
																				<table cellspacing="0" cellpadding="0"
																					class="tablefilter">
																					<tbody>
																						<%if(map.get(9)!=null) { Member_user m = map.get(9);%>																							
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel1"><a
																								href="http://xz20141114.dflvip.com/Member/User_treeview.aspx?UserID=617"><%=m.getUserid() %></a></td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																						<%}else{ %>
																							<tr align="center">
																								<td class="kongwei"><a
																									href=""
																									title="推荐">[空位]<br>推荐
																								</a></td>
																							</tr>
																						<%}%>
																					</tbody>
																				</table></td>
																			<td class="borderlrt" width="12%" valign="top"
																				title="第4层"><img width="12" height="0"><br>
																				<table width="100" cellspacing="0" cellpadding="0"
																					class="tablefilter">
																					<tbody>
																						<%if(map.get(10)!=null) {Member_user m = map.get(10);%>																							
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel1"><a
																								href="http://xz20141114.dflvip.com/Member/User_treeview.aspx?UserID=617"><%=m.getUserid() %></a></td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																						<%}else{ %>
																							<tr align="center">
																								<td class="kongwei"><a
																									href=""
																									title="推荐">[空位]<br>推荐
																								</a></td>
																							</tr>
																						<%}%>
																					</tbody>
																				</table></td>
																			<td class="borderlrt" width="12%" valign="top"
																				title="第4层"><img width="12" height="0"><br>
																				<table width="100" cellspacing="0" cellpadding="0"
																					class="tablefilter">
																					<tbody>
																						<%if(map.get(11)!=null) { Member_user m = map.get(11);%>																							
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel1"><a
																								href="http://xz20141114.dflvip.com/Member/User_treeview.aspx?UserID=617"><%=m.getUserid() %></a></td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																						<%}else{ %>
																							<tr align="center">
																								<td class="kongwei"><a
																									href=""
																									title="推荐">[空位]<br>推荐
																								</a></td>
																							</tr>
																						<%}%>
																					</tbody>
																				</table></td>
																			<td class="borderlrt" width="12%" valign="top"
																				title="第4层"><img width="12" height="0"><br>
																				<table width="100" cellspacing="0" cellpadding="0"
																					class="tablefilter">
																					<tbody>
																						<%if(map.get(12)!=null) { Member_user m = map.get(12);%>																							
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel1"><a
																								href="http://xz20141114.dflvip.com/Member/User_treeview.aspx?UserID=617"><%=m.getUserid() %></a></td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																						<%}else{ %>
																							<tr align="center">
																								<td class="kongwei"><a
																									href=""
																									title="推荐">[空位]<br>推荐
																								</a></td>
																							</tr>
																						<%}%>
																					</tbody>
																				</table></td>
																			<td class="borderlrt" width="12%" valign="top"
																				title="第4层"><img width="12" height="0"><br>
																				<table width="100" cellspacing="0" cellpadding="0"
																					class="tablefilter">
																					<tbody>
																						<%if(map.get(13)!=null) { Member_user m = map.get(13);%>																							
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel1"><a
																								href="http://xz20141114.dflvip.com/Member/User_treeview.aspx?UserID=617"><%=m.getUserid() %></a></td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																						<%}else{ %>
																							<tr align="center">
																								<td class="kongwei"><a
																									href=""
																									title="推荐">[空位]<br>推荐
																								</a></td>
																							</tr>
																						<%}%>
																					</tbody>
																				</table></td>
																			<td class="borderlrt" width="12%" valign="top"
																				title="第4层"><img width="12" height="0"><br>
																				<table width="100" cellspacing="0" cellpadding="0"
																					class="tablefilter">
																					<tbody>
																						<%if(map.get(14)!=null) { Member_user m = map.get(14);%>																							
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel1"><a
																								href="http://xz20141114.dflvip.com/Member/User_treeview.aspx?UserID=617"><%=m.getUserid() %></a></td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																						<%}else{ %>
																							<tr align="center">
																								<td class="kongwei"><a
																									href=""
																									title="推荐">[空位]<br>推荐
																								</a></td>
																							</tr>
																						<%}%>
																					</tbody>
																				</table></td>
																			<td class="borderlrt" width="12%" valign="top"
																				title="第4层"><img width="12" height="0"><br>
																				<table width="100" cellspacing="0" cellpadding="0"
																					class="tablefilter">
																					<tbody>
																						<%if(map.get(15)!=null) {Member_user m = map.get(15);%>																							
																						<tr align="center">
																							<td colspan="2" class="tdfilter ulevel1"><a
																								href="http://xz20141114.dflvip.com/Member/User_treeview.aspx?UserID=617"><%=m.getUserid() %></a></td>
																						</tr>
																						<tr align="center" bgcolor="#006600">
																							<td colspan="2" class="tdfilter"
																								bgcolor="#eeeeee">
																								<table border="0" cellspacing="1"
																									cellpadding="2" width="100%" class="zshy">
																									<tbody>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">总</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">余</td>
																											<td class="r">0</td>
																										</tr>
																										<tr>
																											<td class="l">4</td>
																											<td class="m">新</td>
																											<td class="r">0</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																						<%}else{ %>
																							<tr align="center">
																								<td class="kongwei"><a
																									href=""
																									title="推荐">[空位]<br>推荐
																								</a></td>
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
												<table width="100%" border="0" cellspacing="1"
													cellpadding="4">
													<tbody>
														<tr align="center" class="head">
															<td>
																<table width="300" border="0" cellspacing="1"
																	cellpadding="4"
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
											</td>
										</tr>
									</tbody>
								</table></span></td>
					</tr>
				</tbody>
			</table>


		</div>
	</form>
</body>
</html>