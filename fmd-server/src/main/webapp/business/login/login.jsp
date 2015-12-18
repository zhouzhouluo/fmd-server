<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>
<c:set var="ctx" value="<%=basePath%>" />
<c:set var="base" value="<%=base%>" />
<c:set var="path" value="<%=path%>" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	var NREUMQ = NREUMQ || [];
	NREUMQ.push([ "mark", "firstbyte", new Date().getTime() ]);
	var contextPath = "<%=path%>";
</script>
<title>用户登录</title>
<meta name="description"
	content="途牛旅游网：中国最大的旅游行业在线电子商务网站，为您提供最为周到的旅游服务。途牛旅游网">
<meta name="keywords" content="会员登录">

<link type="text/css" rel="stylesheet" href="./_files/site.css">
<link type="text/css" rel="stylesheet" href="./_files/layer.css"
	id="skinlayercss">
	<script type="text/javascript" src="${path}/business/_files/login.js"></script>
	<script type="text/javascript" src="${path}/business/_files/jquery.js"></script>
	<script src="${path}/business/_files/function.js" type="text/javascript"></script>
</head>
<body background="img/loginbg.jpg"
	style="background-color:#999; background-size:cover; background-position:100% 5%;background-repeat: no-repeat;"
	onload="onlogin();">
	<div id="loginWrap">
		<div id="content" class="content">
			<input type="hidden" id="errLoginType" value="P-N"> <input
				type="hidden" id="errLoginMsg" value="">
			<div id="login-content" class="login-content"
				style="background-color: #fff;">
				<div id="login-box" class="login-box-inner">
					<ul id="login-tab" class="login-tab">
						<li id="login-tab-user" class="cur">会员登录<b></b></li>
					</ul>
					<form name="Form1" method="post" action="${path}/member/login.action"
							id="Form1" onsubmit="return frmchk(this);">
						<input name="login_type" id="login_type" value="P-N" type="hidden">
						<div class="login-tab-content" id="login-tab-content0"
							style="display: block;">
							<table class="login-table">
								<tbody>
									<tr>
										<td class="login-tip">
											<div id="login_error" class="error login_error"
												style="display: none;"></div>
										</td>
									</tr>
									<tr id="line_1" class="line_1">
										<td>
											<div class="input_div">
												<input type="text" name="userid" autocomplete="off" id="userid"
													tabindex="1" class="txt txt-m txt-focus cgrey2"
													style="font-size: 12px;" placeholder="手机号/会员名/邮箱/会员卡号"
													maxlength="6">
											</div>
										</td>
									</tr>
									<tr id="line_2" class="line_2">
										<td>
											<div class="input_div">
												<input type="password" name="pwd" autocomplete="off" id="pwd" tabindex="2" class="txt txt-m">
											</div>
										</td>
									</tr>
									<tr id="line_3" class="line_3">
										<td>
											<div class="input_div">
												<input type="text" id="idcode" name="idcode"
													tabindex="3" class="txt txt-m" style="ime-mode: disabled;"
													maxlength="4">
												<div class="identify_box"> 
													<img src="src='${path}/imgVcode?'+new Date()" height="24" width="24" 
														class="loadingImg" style="display: none;">
														 <a href="javascript:void(0);" title="如验证码无法辨别，点击即可刷新。"
														 	onclick="document.getElementById('imgVcode').src='${path}/imgVcode?'+new Date()"> 
														 <img height="24" width="80"
															class="identify_img" alt="如验证码无法辨别，点击即可刷新。"
															align="absmiddle" style="display: inline;"
															id = "imgVcode"
															src="./_files/1450168076538.8508">
														</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="line2"><input type="hidden"
											name="current_login_url"
											value="https://passport.tuniu.com/login?origin=http://www.tuniu.com/ssoConnect">
											<input type="button" value="登录" name="submit_login"
											tabindex="5" class="sub"></td>
									</tr>

								</tbody>
							</table>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="./_files/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="./_files/layer.min.js"></script>
	<script type="text/javascript" src="./_files/login_check.js"></script>
	<script type="text/javascript">
		$(function() {
			//判断fab是否崩溃 
			var isCrash = 0;
			if (isCrash) {
				ShowCrash();
			}
			function ShowCrash() {
				$("body")
						.append(
								'<div class="TipBoxHackBot">'
										+ '<div class="BackHack"></div>'
										+ '<div class="TipBox">'
										+ '<img class="imgTipBox" src="https://ssl3.tuniucdn.com/img/20151202/login_v2/error.png">'
										+ '</div>' + '</div>');
				$("body .TipBoxHackBot").fadeIn();
				$("body .TipBoxHackBot .TipBox").animate({
					marginTop : '-324px'
				}, 500);
			}

			$("body").delegate("	div.BackHack", "click", function() {
				$("div.TipBoxHackBot").fadeOut(200);
				window.setTimeout(function() {
					$("div.TipBoxHackBot").remove();
				}, 200);
			});

			$("#codeToNormal").bind("click", function() {
				$("#login-code-wrap").hide();
				$("#login-content").show();
			});
			$("#login-code-wrap .login-card-close").click(function() {
				$("#codeToNormal").trigger("click");
			});
			$("#normalToCode").click(function() {
				$("#login-code-wrap").show();
				$("#login-content").hide();
				changeCodeImg();
				checkLogin();
			});
			var checkLoginInterval, changeCodeTimeout;
			$("#refreshCode").click(function() {
				clearTimeout(changeCodeTimeout);
				changeCodeImg();
			});
			function changeCodeImg() {
				if ($("#login-code-wrap").is(":visible")) {
					//后台二维码地址
					$("#codeImg").attr(
							"src",
							"/ajax/qrcode?t="
									+ (new Date().getTime() + Math.random()));
					changeCodeTimeout = setTimeout(function() {
						changeCodeImg();
					}, 90000);
				}
			}
			changeCodeImg();

			function checkLogin() {
				checkLoginInterval = setInterval(function() {
					if ($("#login-code-wrap").is(":visible")) {
						//后台check是否登录
						$.get('/ajax/qrcodeLogin', function(json) {
							try {
								var json = eval("(" + json + ")");
							} catch (e) {
								return;
							}
							if (json.success) {
								window.location.href = '/login';
							} else {
								if (json.errno == -2) {
									clearTimeout(changeCodeTimeout);
									changeCodeImg();
								}
							}
						});
					}
				}, 1500);
			}

		});
	</script>

	<script type="text/javascript">
		if (!window.navigator.cookieEnabled) {
			$("#howEnableCookie").parent().show();
			$("#howEnableCookie")
					.click(
							function() {
								$
										.layer({
											type : 1,
											title : "如何启动COOKIE",
											time : 0,
											shadeClose : true,
											maxHeight : 200,
											page : {
												html : "<div style='padding:10px'><p style='font-size: 18px;font: 20px/47px 'microsoft yahei';'>1. ie浏览器：点击浏览器<b>“工具”</b>——<b>“internet选项”</b>——<b>“隐私”</b>——将<b>“阻止所有cookie”</b>调低级别——点击<b>“保存”</b>——重启浏览器即可正常登录。<br><br>2. chrome浏览器：点击浏览器<b>“设置”</b>——<b>“显示高级设置”</b>——<b>“隐私设置”</b>——<b>“内容设置”</b>——取消<b>“阻止第三方cookie和网站数据”</b>——选择<b>“允许设置本地数据（推荐）”</b>——点击<b>“完成”</b>——重启浏览器即可正常登录。<br><br>3. 火狐浏览器：点击浏览器<b>“选项”</b>——选择<b>“隐私”</b>——<b>“自定义历史记录设置”</b>，取消<b>“始终使用隐私浏览模式”</b>，勾选<b>“接受来自站点的cookie”</b>——点击<b>“确定”</b>——重启浏览器即可生效。</p></div>"
											},
											offset : [ "200px", "" ],
											area : [ "700px", "320px" ]
										})
							})
		};
	</script>

</body>
</html>