<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>
<c:set var="basePath" value="<%=basePath%>" />
<c:set var="base" value="<%=base%>" />
<c:set var="path" value="<%=path%>" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
	<title>无标题页</title>
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
	<script src="${path}/business/_files/chkPWD.js" type="text/javascript"></script>
	<script src="${path}/business/_files/jsEditPass.js"type="text/javascript"></script>
	<script type="text/javascript" src="${path}/business/_files/jquery.js"></script>
<script type="text/javascript">
	var contextPath = "<%=path%>";
</script>
</head>
<body onload="init_reg();">
	<noscript>&lt;iframe src=*.html&gt;&lt;/iframe&gt;</noscript>
				<form name="form1" id="form1">
					<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
						value="/wEPDwULLTEwNzA3MjIzMDhkZHDXHSRtp+KbyIxd1o6y2ngnH3nknSfANrdMyfDLWGY5">
						<input
						type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION"
						value="/wEWDQL2gY/UDALKw/ZKAtLF4JEPAs70moQNAoznisYGAsrDurkGAsiTss0OAoWQtIMBArursYYIAsrDzpQPAoLrx5YFAqKvxYsDAtaUz5sCrdpsq2GxxnyMgj5JSRZ8aNZrh4zs/L3Xajpnb1ibFD8=">
							<div class="ncenter_box">
								<div class="accounttitle">
									<h1>密码修改</h1>
								</div>
								<table width="98%" border="0" cellpadding="5" cellspacing="5"
									class="tab2">
									<tbody>
										<tr>
											<td style="width: 90px; text-align: right">原一级密码：</td>
											<td colspan="2" align="left"><input name="txtpass1" 
												type="password" maxlength="16" id="txtpass1"
												onblur="out_oldupwd1();this.className='input_onBlur'"
												onfocus="on_input1('d_oldupwd1');this.className='input_onFocus'"
												style="border-width: 1px; border-style: Solid;"></td>
											<td><div class="d_default" id="d_oldupwd1">请输入6位以上字符，不允许空格。</div></td>
										</tr>
										<tr>
											<td style="width: 90px; text-align: right">新一级密码：</td>
											<td colspan="2" align="left"><input name="Password" disabled="disabled"
												type="password" maxlength="16" id="Password" 
												onblur="out_upwd1();this.className='input_onBlur'"
												onkeyup="EvalPwdStrength(this.value);"
												onfocus="on_input1('d_upwd1');this.className='input_onFocus'"
												style="border-width: 1px; border-style: Solid;"></td>
											<td><div class="d_default" id="d_upwd1">请输入6位以上字符，不允许空格。</div>
											</td>
										</tr>
										<tr>
											<td style="width: 90px; text-align: right">重复一级密码：</td>
											<td align="left"><input name="Password1" type="password" disabled="disabled"
												maxlength="16" id="Password1"
												onblur="out_upwd2();this.className='input_onBlur'"
												onfocus="on_input1('d_upwd2');this.className='input_onFocus'"
												style="border-width: 1px; border-style: Solid;"></td>
											<td><nobr>
												<div class="ob_pws" id="pws">
													<div class="ob_pws0" id="idSM1">
														<span style="FONT-SIZE: 1px">&nbsp;</span><span
															id="idSMT1">弱</span>
													</div>
													<div class="ob_pws0" id="idSM2"
														style="BORDER-LEFT: #dedede 1px solid">
														<span style="FONT-SIZE: 1px">&nbsp;</span><span
															id="idSMT2">中</span>
													</div>
													<div class="ob_pws0" id="idSM3"
														style="BORDER-LEFT: #dedede 1px solid">
														<span style="FONT-SIZE: 1px">&nbsp;</span><span
															id="idSMT3">强</span>
													</div>
												</div>
												</nobr></td>
											<td><div class="d_default" id="d_upwd2">请重复输入上面的密码。</div>
											</td>
										</tr>
										<tr>
											<td style="width: 90px; text-align: right">&nbsp;</td>
											<td colspan="2" align="left"><input name="button1"  id="button1" disabled="disabled"
												type="button" onclick="editpass1();" value=" 修改 "
												style="display: "><span id="save_stat1"></span></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="width: 90px; text-align: right">原二级密码：</td>
											<td colspan="2" align="left"><input name="txtpass2"
												type="password" maxlength="16" id="txtpass2"
												onblur="out_oldupwd2();this.className='input_onBlur'"
												onfocus="on_input2('d_oldupwd2');this.className='input_onFocus'"
												style="border-width: 1px; border-style: Solid;"></td>
											<td><div class="d_default" id="d_oldupwd2">请输入6位以上字符，不允许空格。</div></td>
										</tr>
										<tr>
											<td style="width: 90px; text-align: right">新二级密码：</td>
											<td colspan="2" align="left"><div>
													<input name="UserPassword" type="password" maxlength="16"
														id="UserPassword"  disabled="disabled"
														onblur="out_aupwd1();this.className='input_onBlur'"
														onkeyup="EvalPwdStrength(this.value);"
														onfocus="on_input2('d_aupwd1');this.className='input_onFocus'"
														style="border-width: 1px; border-style: Solid;">
												</div></td>
											<td><div class="d_default" id="d_aupwd1">请输入6位以上字符，不允许空格。</div>
											</td>
										</tr>
										<tr>
											<td style="width: 90px; text-align: right">重复二级密码：</td>
											<td colspan="2" align="left"><input name="UserPassword1" disabled="disabled"
												type="password" maxlength="16" id="UserPassword1"
												onblur="out_aupwd2();this.className='input_onBlur'"
												onfocus="on_input2('d_aupwd2');this.className='input_onFocus'"
												style="border-width: 1px; border-style: Solid;"></td>
											<td><div class="d_default" id="d_aupwd2">请重复输入上面的密码。</div></td>
										</tr>
										<tr>
											<td style="width: 90px; text-align: right"><label>
													<input name="User" type="hidden" id="User" value="1">
											</label></td>
											<td colspan="2" align="left"><input name="button2" id="button2" disabled="disabled"
												type="button" onclick="editpass2();" value=" 修改 "
												style="display: "><span id="save_stat2"></span></td>
											<td>&nbsp;</td>
											<td></td>
										</tr>


										<!----------------->
										<tr style="display:;">
											<td style="width: 90px; text-align: right">原三级密码：</td>
											<td colspan="2" align="left"><input name="txtpass3" 
												type="password" maxlength="16" id="txtpass3"
												onblur="out_oldupwd3();this.className='input_onBlur'"
												onfocus="on_input3('d_oldupwd3');this.className='input_onFocus'"
												style="border-width: 1px; border-style: Solid;"></td>
											<td><div class="d_default" id="d_oldupwd3"></div></td>
										</tr>
										<tr style="display:;">
											<td style="width: 90px; text-align: right">新三级密码：</td>
											<td colspan="2" align="left"><div>
													<input name="Treepassword" type="password" maxlength="16"
														id="Treepassword" disabled="disabled"
														onblur="out_trpwd1();this.className='input_onBlur'"
														onkeyup="EvalPwdStrength(this.value);"
														onfocus="on_input3('d_trpwd1');this.className='input_onFocus'"
														style="border-width: 1px; border-style: Solid;">
												</div></td>
											<td><div class="d_default" id="d_trpwd1"></div></td>
										</tr>
										<tr style="display:;">
											<td style="width: 90px; text-align: right">重复三级密码：</td>
											<td colspan="2" align="left"><input name="Treepassword1" disabled="disabled"
												type="password" maxlength="16" id="Treepassword1"
												onblur="out_trpwd2();this.className='input_onBlur'"
												onfocus="on_input3('d_trpwd2');this.className='input_onFocus'"
												style="border-width: 1px; border-style: Solid;"></td>
											<td><div class="d_default" id="d_trpwd2"></div></td>
										</tr>
										<tr style="display:;">
											<td style="width: 90px; text-align: right"><label>

											</label></td>
											<td colspan="2"><input name="button3" type="button" id="button3" disabled="disabled"
												onclick="editpass3();" value=" 修改 " style="display: "><span id="save_stat3"></span></td>
											<td>&nbsp;</td>
											<td></td>
										</tr>


									</tbody>
								</table>




							</div>
				</form>
</body>
</html>