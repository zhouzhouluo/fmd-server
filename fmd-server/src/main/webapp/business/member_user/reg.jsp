<%@page import="com.fmd.entity.Member_user"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.fmd.service.Member_userService"%>
<%@page import="com.fmd.util.ApplicationContextManagement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
//	Member_userService member_userService= (Member_userService)ApplicationContextManagement.getApplicationContext().getBean("member_userService");
	WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	Member_userService member_userService =(Member_userService)wac.getBean("member_userService");
	String userid = member_userService.getMaxUserid();
	Object obj = request.getSession().getAttribute("loginedUser");
	Member_user member_user = null;
	if(obj!=null){
		member_user = (Member_user)obj;
	}
	String nodeuserid = request.getParameter("nodeuserid");
	String nodename =  member_userService.getUserByUserId(nodeuserid).getAccount_name();
	String aere = request.getParameter("aere");
%>
<c:set var="path" value="<%=path%>" />
<c:set var="ctx" value="<%=basePath%>" />
<c:set var="base" value="<%=base%>" />
<!DOCTYPE html>
<!-- saved from url=(0044)http://xz20141114.dflvip.com/Member/Reg.aspx -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>户注册</title> 
	<script src="${path}/business/_files/Pro.js"></script>
	<script src="${path}/business/_files/jsReg.js" type="text/javascript"></script>
	<script src="${path}/business/_files/chkPWD.js" type="text/javascript"></script>
	<script src="${path}/business/_files/getcity.js" type="text/javascript"></script>
	<link href="${path}/business/_files/WdatePicker.css" rel="stylesheet" type="text/css">
	<script src="${path}/business/_files/main.js" type="text/javascript"></script>
	<script src="${path}/business/_files/meizzDate.js" type="text/javascript"></script>
	<script type="text/javascript" src="${path}/business/_files/fckeditor.js"></script>
	<script src="${path}/business/_files/function.js" type="text/javascript"></script>
	<script src="${path}/business/_files/menu.js" type="text/javascript"></script>
	<script type="text/javascript" src="${path}/business/_files/WdatePicker.js"></script>
	<link href="${path}/business/_files/common.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${path}/business/_files/style.css" rel="stylesheet" media="screen" type="text/css">
	<link href="${path}/business/_files/font.css" rel="stylesheet" media="all" type="text/css">
</head>
<body onload="init_reg();">
	<form name="Form1" method="post" action="${path}/member/save.action"
		id="Form1">
		<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
			value="/wEPDwUKMTU1NjcyODM2MQ9kFgICAQ9kFhgCAg8PZBYCHgV2YWx1ZQUGMTExMTExZAIDDw9kFgIfAAUGMTExMTExZAIEDw9kFgIfAAUGMjIyMjIyZAIFDw9kFgIfAAUGMjIyMjIyZAIGDw9kFgIfAAUGMzMzMzMzZAIHDw9kFgIfAAUGMzMzMzMzZAIQDw8WAh4EVGV4dAUIODMxMTQyNTNkZAIRDxBkDxYCZgIBFgIQBQblt6bljLoFATBnEAUG5Y+z5Yy6BQExZ2RkAhIPEGQPFgZmAgECAgIDAgQCBRYGEAUP5raI6LS55Y2hKDEwMDApBQExZxAFD3ZscOS8muWRmCgzMDAwKQUBMmcQBRPph5HljaHkvJrlkZgoMTAwMDApBQEzZxAFE+mSu+WNoeS8muWRmCgyMDAwMCkFATRnEAUQ56S+5Yy65bqXKDMwMDAwKQUBNWcQBRTluILnuqfku6PnkIYoMTAwMDAwKQUBNmdkZAIgDxAPZBYCHghvbmNoYW5nZQULU2VsZWN0ZWQoKTtkZGQCIg8QD2QWAh8CBRVzZXRjaXR5KCk7b3V0X2NpdHkoKTtkZGQCIw8QD2QWAh8CBQtTZWxlY3RlZCgpO2RkZGTmy74PWaNS9tcVm1DpM5rrXQJTedO6gNiJnXdN2lMEAg==">
		<div class="ncenter_box">
			<div class="accounttitle">
				<h1>会员注册</h1>
			</div>
			<table id="chk_idAll" width="97%" border="0" align="center"
				cellpadding="1" cellspacing="1" class="tab2">
				<tbody>
					<tr bgcolor="#99CCFF" style="display:">
						<td align="center" colspan="4" height="30">
							账号信息（默认登录密码：111111 二级密码：222222 三级密码：333333）</td>
					</tr>
					<tr>
						<td style="width: 90px; text-align: right">用户ID：</td>
						<td colspan="2" align="left"><input name="userid" type="text" readOnly="true"
							value="<%=userid %>" maxlength="14" id="userid"
							style="border-width: 1px; border-style: Solid;"><font
							color="red">*必须填写</font> <span id="chkssn_stat"></span>
						</td>
						<td style="display: none">
							<div class="d_default" id="d_userid">请输入4-18位字符，英文、数字的组合。</div>
						</td>
					</tr>
					<tr style="display:">
						<td style="width: 90px; text-align: right">一级密码：</td>
						<td colspan="2" align="left"><input name="pwd1"
							type="password" maxlength="16" id="pwd1"
							onkeyup="EvalPwdStrength(this.value);" value="111111"
							style="border-width: 1px; border-style: Solid;">
							默认密码111111</td>
						<td style="display: none"><div class="d_default" id="d_pwd1">请输入6位以上字符，不允许空格。</div></td>
					</tr>
					<tr style="display:">
						<td style="width: 90px; text-align: right">再次确认：</td>
						<td align="left"><input name="_pwd1" type="password"
							maxlength="16" id="_pwd1" value="111111"
							style="border-width: 1px; border-style: Solid;"></td>
						<td><nobr>
								<div class="ob_pws" id="pws">
									<div class="ob_pws0" id="idSM1" style="display: none">
										<span style="FONT-SIZE: 1px">&nbsp;</span><span id="idSMT1">弱</span>
									</div>
									<div class="ob_pws0" id="idSM2"
										style="display: none; BORDER-LEFT: #dedede 1px solid">
										<span style="FONT-SIZE: 1px">&nbsp;</span><span id="idSMT2">中</span>
									</div>
									<div class="ob_pws0" id="idSM3"
										style="display: none; BORDER-LEFT: #dedede 1px solid">
										<span style="FONT-SIZE: 1px">&nbsp;</span><span id="idSMT3"
											style="display: none">强</span>
									</div>
								</div>
							</nobr></td>
						<td style="display: none"><div class="d_default" id="d_upwd2">请重复输入上面的密码。</div></td>
					</tr>
					<tr style="display:">
						<td style="width: 90px; text-align: right">二级密码：</td>
						<td colspan="2" align="left"><input name="pwd2"
							type="password" maxlength="16" id="pwd2"
							onkeyup="EvalPwdStrength(this.value);" value="222222"
							style="border-width: 1px; border-style: Solid;">
							默认密码222222,一级密码和二级密码（二级密码）不能输入相同</td>
						<td style="display: none"><div class="d_default" id="d_pwd2">请输入6位以上字符，不允许空格。</div></td>
					</tr>
					<tr style="display:">
						<td style="width: 90px; text-align: right">再次确认：</td>
						<td colspan="2" align="left"><input name="_pwd2"
							type="password" maxlength="16" id="_pwd2" value="222222"
							style="border-width: 1px; border-style: Solid;"></td>
						<td style="display: none"><div class="d_default" id="d__pwd2">请重复输入上面的密码。</div></td>
					</tr>

					<tr style="display:">
						<td style="width: 90px; text-align: right">三级密码：</td>
						<td colspan="2" align="left"><div>
								<input name="pwd3" type="password" maxlength="16" id="pwd3"
									onkeyup="EvalPwdStrength(this.value);" value="333333"
									style="border-width: 1px; border-style: Solid;">
								默认密码333333,一级密码和二级密码（二级密码）不能输入相同
							</div></td>
						<td style="display: none"><div class="d_default" id="DIV2"></div></td>
					</tr>
					<tr style="display:">
						<td style="width: 90px; text-align: right">再次确认：</td>
						<td colspan="2" align="left"><input name="_pwd3"
							type="password" maxlength="16" id="_pwd3" value="333333"
							style="border-width: 1px; border-style: Solid;"></td>
						<td style="display: none"><div class="d_default" id="DIV3"></div></td>
					</tr>

					<tr style="display: none">
						<td style="width: 90px; text-align: right">温馨提示：</td>
						<td colspan="2"><input name="txtQuestion" type="text"
							value="1" maxlength="16" id="txtQuestion"
							style="border-width: 1px; border-style: Solid;"></td>
						<td style="display: none"><div class="d_default" id="DIV4"></div></td>
					</tr>

					<tr style="display: none">
						<td style="width: 90px; text-align: right">支付密码：</td>
						<td colspan="2"><input name="txtAnswer" type="text" value="1"
							maxlength="16" id="txtAnswer"
							style="border-width: 1px; border-style: Solid;"></td>
						<td style="display: none"><div class="d_default" id="DIV5"></div></td>
					</tr>
					<tr style="display:">
						<td align="center" colspan="4" bgcolor="#99CCFF" height="30">
							个人信息</td>
					</tr>

					<tr style="display:">
						<td style="width: 90px; text-align: right">推荐人ID：</td>
						<td colspan="2" align="left"><input name="referee_id"
							type="text" value="<%=member_user.getUserid() %>" maxlength="18"
							id="referee_id" readOnly="true"
							style="border-width: 1px; border-style: Solid; width: 160px;">
							姓名：<input name="referee" type="text"
							value="<%=member_user.getAccount_name()%>" maxlength="10" readOnly="true"
							id="referee"
							style="border-width: 1px; border-style: Solid; width: 80px; display:">
							<span id="chkout_uRe_stat"></span></td>
						<td style="display: none"><div class="d_default"
								id="d_referee">请输入4-18位字符，英文、数字的组合。</div></td>
					</tr>

					<tr style="display:">
						<td style="width: 90px; text-align: right">接点人ID：</td>
						<td colspan="2" align="left"><input name="node_id"
							type="text" value="<%=nodeuserid%>" maxlength="18" readOnly="true"
							id="node_id"
							style="border-width: 1px; border-style: Solid; width: 160px;">
							姓名：<input name="node" type="text" readOnly="true"
							value="<%=nodename%>" maxlength="10"
							id="node"
							style="border-width: 1px; border-style: Solid; width: 80px; display:">
							<span id="chkout_uFather_stat"></span></td>
						<td style="display: none"><span>
								<table border="0" cellpadding="0" cellspacing="0"
									style="width: 100%; height: 100%">
									<tbody>
										<tr>
											<td><div class="d_default" id="d_node">请输入4-18位字符，英文、数字的组合。</div></td>
										</tr>
									</tbody>
								</table>
						</span></td>
					</tr>
					<tr style="display:;">
						<td height="16" style="width: 90px; text-align: right"><span
							style="display: none">会员编号：<input name="lbUserNo"
								type="text" value="83114253" id="lbUserNo" disabled="disabled"
								style="border-width: 1px; border-style: Solid;"></span> 业务区域：</td>
						<td colspan="2" align="left">
							<table id="TreePlace" border="0" style="height: 15px;">
								<tbody>
									<tr>
										<td><input id="TreePlace_0" type="radio" disabled="disabled"
											name="TreePlace" value="0" <%="0".equals(aere)?"checked='checked'":"" %> onclick="changeArea('0');">
											<label for="TreePlace_0" >左区</label></td>
										<td><input id="TreePlace_1" type="radio" disabled="disabled"
											name="TreePlace" value="1" <%="1".equals(aere)?"checked='checked'":"" %> onclick="changeArea('1');">
											<label for="TreePlace_1">右区</label></td>
										<input id="area" type="hidden" name="area" value="<%=aere%>">
									</tr>
								</tbody>
							</table>
						</td>
						<td style="display: none">&nbsp;</td>
					</tr>
					<tr style="display:">
						<td style="width: 90px; text-align: right">姓名：</td>
						<td colspan="2" align="left"><input name="account_name"
							type="text" maxlength="14" id="account_name"
							style="border-width: 1px; border-style: Solid;"></td>
						<td style="display: none"><div class="d_default"
								id="d_account_name">请输入开户姓名。</div></td>
					</tr>
					<tr style="display:">
						<td style="width: 90px; text-align: right;">身份证号：</td>
						<td colspan="2" align="left"><input name="identity"
							type="text" value="" maxlength="18" id="identity"
							style="border-width: 1px; border-style: Solid; width: 246px;"></td>
						<td style="display: none"><div class="d_default"
								id="d_identity">请输入15或18位身份证号码。</div></td>
					</tr>
					<tr style="display:">
						<td style="width: 90px; text-align: right; height: 32px;">
							收件地址：</td>
						<td colspan="2" style="height: 32px" align="left"><input
							name="receiv_address" type="text" value="" maxlength="50"
							id="receiv_address"
							style="border-width: 1px; border-style: Solid; width: 246px;"></td>
						<td style="display: none"><div class="d_default"
								id="d_receiv_address">请输入4-50位字符地址。</div></td>
					</tr>

					<tr style="display:">
						<td style="width: 90px; text-align: right; height: 32px;">
							QQ：</td>
						<td colspan="2" style="height: 32px" align="left"><input
							name="qq" type="text" maxlength="20" id="qq"
							style="border-width: 1px; border-style: Solid; width: 246px;"></td>
						<td style="display: none"><div class="d_default" id="DIV1"></div></td>
					</tr>
					<tr style="display: none">
						<td style="width: 90px; text-align: right">邮编：</td>
						<td colspan="2" align="left"><input name="zip_code"
							type="text" value="111111" maxlength="6" id="zip_code"
							style="border-width: 1px; border-style: Solid;"></td>
						<td style="display: none"><div class="d_default"
								id="d_zip_code">请输入6位邮编。</div></td>
					</tr>
					<tr style="display:">
						<td style="width: 90px; text-align: right">联系电话：</td>
						<td colspan="2" align="left"><input name="phone_number"
							type="text" maxlength="12" id="phone_number"
							style="border-width: 1px; border-style: Solid;"></td>
						<td style="display: none"><div class="d_default"
								id="d_phone_number">请输入您的11或12位联系电话。</div></td>
					</tr>
					<tr style="display:;">
						<td style="width: 90px; text-align: right">Email：</td>
						<td colspan="2" align="left"><input name="email" type="text"
							maxlength="30" id="email"
							style="border-width: 1px; border-style: Solid; width: 246px;"></td>
						<td style="display: none"></td>
					</tr>
					<tr style="display:">
						<td style="width: 90px; text-align: right">开户银行：</td>
						<td colspan="2" align="left"><select name="bank_name"
							id="bank_name" onchange="Selected();" style="width: 163px;">
								<option selected="selected" value="中国工商银行">中国工商银行</option>
								<option value="中国农业银行">中国农业银行</option>
								<option value="中国建设银行">中国建设银行</option>
								<option value="中国银行">中国银行</option>
						</select> &nbsp;</td>
						<td style="display: none"></td>
					</tr>
					<tr style="display:">
						<td style="width: 90px; text-align: right">开户地址：</td>
						<td colspan="2" align="left">省份 <select name="province"
							id="province" onchange="setcity();out_city();">
								<option value="">--省份--</option>
								<option value="安徽">安徽</option>
								<option selected="selected" value="北京">北京</option>
								<option value="重庆">重庆</option>
								<option value="福建">福建</option>
								<option value="甘肃">甘肃</option>
								<option value="广东">广东</option>
								<option value="广西">广西</option>
								<option value="贵州">贵州</option>
								<option value="海南">海南</option>
								<option value="河北">河北</option>
								<option value="黑龙江">黑龙江</option>
								<option value="河南">河南</option>
								<option value="香港">香港</option>
								<option value="湖北">湖北</option>
								<option value="湖南">湖南</option>
								<option value="江苏">江苏</option>
								<option value="江西">江西</option>
								<option value="吉林">吉林</option>
								<option value="辽宁">辽宁</option>
								<option value="澳门">澳门</option>
								<option value="内蒙古">内蒙古</option>
								<option value="宁夏">宁夏</option>
								<option value="青海">青海</option>
								<option value="山东">山东</option>
								<option value="上海">上海</option>
								<option value="山西">山西</option>
								<option value="陕西">陕西</option>
								<option value="四川">四川</option>
								<option value="台湾">台湾</option>
								<option value="天津">天津</option>
								<option value="新疆">新疆</option>
								<option value="西藏">西藏</option>
								<option value="云南">云南</option>
								<option value="浙江">浙江</option>
								<option value="海外">海外</option>

						</select> 城市 <select name="account_address" id="account_address"
							onchange="Selected();">
								<option selected="selected" value="东城">东城</option>

						</select> <span style="display:"> 银行点 <input name="account_node"
								type="text" value="11" maxlength="50" id="account_node"
								style="border-width: 1px; border-style: Solid; width: 150px;"></span>
						</td>
						<td style="display: none"><div class="d_default"
								id="d_account_address">请选择开户城市。</div></td>
					</tr>

					<tr style="display:">
						<td style="width: 90px; text-align: right">银行卡号：</td>
						<td colspan="2" align="left"><input name="account"
							type="text" value="" maxlength="19" id="account"
							style="border-width: 1px; border-style: Solid; width: 246px;"></td>
						<td style="display: none"><div class="d_default"
								id="d_account">请输入19位银行卡号。</div></td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center"><span
							id="save_stat"></span> <input name="RegIP" type="hidden"
							id="RegIP" value="120.236.169.4"> <input
							style="background-image: url(${path}/business/templets/XZ20140517/images/btn2.jpg); border: 0; width: 80px; height: 30px; color: #990302; font-size: 14px; text-align: center; background-color: transparent; font-weight: bold;"
							name="regbotton" type="button" id="regbotton"
							onclick="chk_reg();" value="确定"> <input
							style="background-image: url(${path}/business/templets/XZ20140517/images/btn2.jpg); width: 80px; height: 30px; color: #990302; border: 0; font-size: 14px; text-align: center; font-weight: bold;"
							id="Reset1" type="reset" value="重置"> <input type="hidden"
							name="txtTID" id="txtTID" value="0"></td>
					</tr>
				</tbody>
			</table>

		</div>
	</form>

	<script language="javascript">
   /*  GetStr(3, 1);*/
    Selected();
    function Selected() {
        var bankname = document.Form1["bank_name"].value;
        var province = document.Form1["province"].value;
        var city = document.Form1["account_address"].value;
        document.Form1["account_node"].value = bankname + province + city + "分行";
        //    switch (bankname)
        //	{
        //       case "中国工商银行" :
        //        document.Form1["BankCard"].value="95588";
        //        break;
        //       case "中国农业银行" :
        //	    document.Form1["BankCard"].value="95599";
        //	    break;
        //	   default:
        //		document.Form1["BankCard"].value="95588";
        //		break;
        //	}
    } 
function Fatherbotton_onclick() {

}

</script>
</body>
</html>