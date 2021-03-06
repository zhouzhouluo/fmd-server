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
%>
<c:set var="ctx" value="<%=basePath%>" />
<c:set var="base" value="<%=base%>" />
<c:set var="path" value="<%=path%>" />
<!DOCTYPE html>
<html>
<head>
<title>用户注册</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta charset="utf-8">
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
	<script  src="${path}/business/_files/jsEditInfo.js" type="text/javascript"></script>
</head>

<body>
	<noscript>&lt;iframe src=*.html&gt;&lt;/iframe&gt;</noscript>
	<form name="Form1" method="post" action="${path}/member/update.action" id="Form1">
		<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
			value="/wEPDwUJMzQwOTk1NDkyD2QWAgIFD2QWAgIEDw8WAh4EVGV4dAUG5a6d5a6dZGRkSQB/x8lH7d2yUozK4CCi24u3f2acbQN70q5E8jF6jZU=">
		<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION"
			value="/wEWDAKX+a/+BAK+jKyfCAKHm5yBAgL5luzTAgKP+qWeAwLPyqhiAuCX1K4IArf7tsMFAoTz/boMAqGlm6cIAt2wq4gEAoznisYGLbXY5FurkhV23A/98cYDgoWM0dEzfGyuDSLFpASWgig=">
		<div class="ncenter_box">
			<div class="accounttitle">
				<h1>资料修改</h1>
			</div>
			<table id="chk_idAll" width="97%" border="0" align="center"
				cellpadding="1" cellspacing="1" class="tab2">
				<tbody>
					<tr style="display: none">
						<td style="width: 90px; text-align: right; height: 32px;"><span
							style="height: 32px">注意：</span></td>
						<td style="height: 32px" align="left"><span class="STYLE1">银行卡号和开户姓名注册时请填写准确，后期不予更改。如遇特殊情况（银行卡丢失，被盗）可联系在线QQ客服或给公司留言，经公司核实后给予更改，同时收取信息维护费用200元。</span></td>
						<td style="height: 32px">&nbsp;</td>
					</tr>
					<tr style="display:">
						<td align="right">推荐人：</td>
						<td align="left"><span id="lbReName"><%=member_user.getReferee()%></span></td>
						<td>&nbsp;</td>
					</tr>
					<tr style="display:">
						<td align="right">推荐人ID：</td>
						<td align="left"><span id="Label1"><%=member_user.getReferee_id()%></span></td>
						<td>&nbsp;</td>
					</tr>
					<tr style="display:">
						<td align="right">开户银行：</td>
						<td align="left"><input name="txtBankAddress" type="text"
							value="<%=member_user.getAccount_node()%>" id="txtBankAddress"
							style="border-width: 1px; border-style: Solid; width: 246px;"></td>
						<td>
							<div class="d_default" id="d_uBankAddress"></div>
						</td>
					</tr>
					<tr style="display:">
						<td align="right">姓名：</td>
						<td align="left"><input name="BankUserName" type="text"
							value="<%=member_user.getAccount_name()%>" readonly="readonly" id="BankUserName"
							style="border-width: 1px; border-style: Solid; width: 246px;"></td>
						<td>
							<div class="d_default" id="d_uBankUser"></div>
						</td>
					</tr>
					<tr style="display:">
						<td align="right">银行账号：</td>
						<td align="left"><input name="BankCard" type="text"
							value="<%=member_user.getAccount()%>" maxlength="19" id="BankCard"
							style="border-width: 1px; border-style: Solid; width: 246px;"></td>
						<td>
							<div class="d_default" id="d_uBankCard"></div>
						</td>
					</tr>
					<tr class="GridItem" style="display:">
						<td style="width: 90px; text-align: right; height: 32px;">
							地址：</td>
						<td style="height: 32px" align="left"><input
							name="UserAddress" type="text" value="<%=member_user.getReceiv_address()%>" maxlength="50"
							id="UserAddress"
							onblur="out_uUserAddress();this.className=&#39;input_onBlur&#39;"
							onfocus="on_input(&#39;d_uUserAddress&#39;);this.className=&#39;input_onFocus&#39;"
							style="border-width: 1px; border-style: Solid; width: 246px;"></td>
						<td style="height: 32px"><div class="d_default"
								id="d_uUserAddress">请输入4-50位字符地址。</div></td>
					</tr>
					<tr class="GridItem" style="display:">
						<td style="width: 90px; text-align: right">邮编：</td>
						<td align="left"><input name="UserPost" type="text"
							value="<%=member_user.getZip_code()%>" maxlength="6" id="UserPost"
							onblur="out_uUserPost();this.className=&#39;input_onBlur&#39;"
							onfocus="on_input(&#39;d_uUserPost&#39;);this.className=&#39;input_onFocus&#39;"
							style="border-width: 1px; border-style: Solid;"></td>
						<td><div class="d_default" id="d_uUserPost">请输入6位邮编。</div></td>
					</tr>
					<tr class="GridItem" style="display:">
						<td style="width: 90px; text-align: right">联系电话：</td>
						<td align="left"><input name="UserTel" type="text"
							value="13800000000" maxlength="11" id="UserTel"
							onblur="out_uUserTel();this.className=&#39;input_onBlur&#39;"
							onfocus="on_input(&#39;d_uUserTel&#39;);this.className=&#39;input_onFocus&#39;"
							style="border-width: 1px; border-style: Solid;"></td>
						<td><div class="d_default" id="d_uUserTel">请输入您的11位联系电话，如01012345678。</div>
						</td>
					</tr>

					<tr class="GridItem" style="display:">
						<td style="width: 90px; text-align: right">微信：</td>
						<td align="left"><input name="txtQQ" type="text"
							value="<%=member_user.getQq()%>" maxlength="20" id="txtQQ"
							style="border-width: 1px; border-style: Solid;"></td>
						<td><div class="d_default" id="DIV1"></div></td>
					</tr>

					<tr class="GridItem" style="display:">
						<td style="width: 90px; text-align: right">Email：</td>
						<td align="left"><input name="txtEmail" type="text"
							value="<%=member_user.getEmail()%>" maxlength="30" id="txtEmail"
							style="border-width: 1px; border-style: Solid;"></td>
						<td><div class="d_default" id="DIV2"></div></td>
					</tr>

					<tr style="display: none;">
						<td align="right">温馨提示：</td>
						<td align="left"><input name="txtQuestion" type="text"
							value="1" id="txtQuestion"></td>

						<td></td>
					</tr>
					<tr style="display: none;">
						<td align="right">支付密码：</td>
						<td align="left"><input name="txtAnswer" type="text"
							value="0" id="txtAnswer"></td>

						<td></td>
					</tr>
					<tr class="GridItem">
						<td colspan="3" style="text-align: center"><span
							id="save_stat"></span> <input name="User" type="hidden" id="User"
							value="1"> <input type="submit" name="Button1"
							value="OK!确认提交信息" id="Button1"> <input name="regbotton"
							type="button" id="regbotton" onclick="Edit();" value="OK!确认提交信息"
							style="display: none"> <input id="Reset1" type="reset"
							value="重置"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>