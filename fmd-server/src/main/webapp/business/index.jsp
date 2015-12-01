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
<!-- saved from url=(0054)http://xz20141114.dflvip.com/UserAdmin/User_Index.aspx -->
<html>
<head>
<link rel="shortcut icon" href="${path}/images/favicon.ico" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<title></title>
<link href="${path}/business/_files/common.css" rel="stylesheet" media="screen"
	type="text/css">
<link href="${path}/business/_files/style.css" rel="stylesheet" media="screen"
	type="text/css">
<link href="${path}/business/_files/font.css" rel="stylesheet" media="all"
	type="text/css">


<script type="text/javascript" src="${path}/business/_files/jquery.min.js"></script>
<script type="text/javascript" src="${path}/business/_files/jquery.zy.js"></script>
<script type="text/javascript" src="${path}/business/_files/AC_RunActiveContent.js"></script>
<!--[if lt IE 9]><script type="text/javascript" src="../templets/XZ20141114/js/PIE.js"></script><![endif]-->
</head>
<body>
	<div id="layout-header">
		<div class="top_line">
			<!-- <div class="toptab">欢迎您进入会员管理系统！<a href="#">请登录</a> | <a href="#">免费注册</a></div>-->
		</div>
		<div class="header_pag">
			<%-- <div class="logo">
				<img src="${path}/business/_files/logo.png" width="400" height="60">
			</div> --%>
			<div class="top_right">
				<div class="top_title" style="color: #048CC5">
					<div id="nihao">
						<img src="${path}/business/_files/top_time.gif"
							style="float: left; padding-top: 2px">&nbsp;2015年10月27日 星期二&nbsp;&nbsp;
					</div>
				</div>
				<%if(member_user==null){ %>
					<div class="top_user">请登录</div>
				<%} else{%>
					<div class="top_user">欢迎您：<%=member_user.getUserid() %> &nbsp; &nbsp; &nbsp; <%=member_user.getAccount_name() %> &nbsp; &nbsp; &nbsp; </div>
				<%} %>
			</div>
			<script language="javascript">          function settime() {
              var myyear, mymonth, myweek, myday, mytime, mymin, myhour, mysec;
              function initArray() {
                  this.length = initArray.arguments.length;
                  for (var i = 0; i < this.length; i++) {
                      this[i + 1] = initArray.arguments[i];
                  }
              }
              var d = new initArray(" 星期日", " 星期一", " 星期二", " 星期三", " 星期四", " 星期五", " 星期六");
              var mydate = new Date();
              myyear = mydate.getFullYear();
              mymonth = mydate.getMonth() + 1;
              myday = mydate.getDate();
              myhour = mydate.getHours();
              mymin = mydate.getMinutes();
              mysec = mydate.getSeconds();
              mytime = myyear + "年" + mymonth + "月" + myday + "日" + " " + d[mydate.getDay() + 1] + " " + myhour + ":" + mymin + ":" + mysec;
              if (mytime.length < 25) {
                  for (var i = mytime.length; i <= 25; i++) {
                      mytime += "&nbsp;";
                  }
              }
              document.getElementById("nihao").innerHTML = "<img src='${path}/business/_files/top_time.gif'  style='float:left;padding-top:2px' />" + "&nbsp;" + "" + mytime;
              setTimeout('settime()', 1000);
          }
          settime();
</script>
			<ul id="jsddm">

				<li><a href="${path}/index.html">首页</a></li>
					<%if(member_user!=null){ %>
				<li><a
					href="#"
					class="">资料管理</a>
				<ul style="visibility: hidden;">
						<li><a
							href="${path}/business/member_user/User_EditInfo.jsp"
							target="content3">资料修改</a></li>
						<li><a
							href="${path}/business/member_user/User_EditPassword.jsp"
							target="content3">密码修改</a></li>
					</ul></li>
				<li></li>
				<li><a
					href="#">会员管理</a>
				<ul>
						<%-- <li><a 
							href="${path}/business/member_user/reg.jsp" 
							target="content3">会员注册</a></li> --%>
						<li><a
							href="${path}/business/member_user/User_treeview.jsp?userid=<%=member_user.getUserid() %>"
							target="content3">团队网络</a></li>
						<li><a
							href="${path}/business/member_user/my_member.jsp"
							target="content3">我的会员</a></li>
						<%if(member_user!=null&&"000001".equals(member_user.getUserid())) {%>	
						<li><a
							href="${path}/business/manager/Admin_Member1.jsp"
							target="content3">会员审核</a></li>
						<%} %>	
					</ul></li>
				<li></li>
				<li><a
					href="#">奖金管理</a>
				<ul>
						<li><a
							href="${path}/business/bonus/BonusHis.jsp"
							target="content3">奖金记录</a></li>
						<%-- <li><a
							href="${path}/business/bonus/User_BonusList.html"
							target="content3">总奖金明细</a></li> --%>
						<li><a
							href="${path}/business/currency/User_DistillCurrencies.jsp"
							target="content3">奖金提现</a></li>
						<%if(member_user!=null&&"000001".equals(member_user.getUserid())) {%>
						<li><a
							href="${path}/business/manager/User_DistillCurrenciesSp.jsp"
							target="content3">提现审核</a></li>	
							<%}%>
					</ul></li>
				<li></li>
				<%-- <li><a
					href="#">货币管理</a>
				<ul>
						<li><a
							href="${path}/business/currency/User_DistillCurrencies.html"
							target="content3">金币提现</a></li>
						<li><a
							href="${path}/business/currency/BonusHis_esle.html"
							target="content3">总资金动态</a></li>
						<li><a
							href="${path}/business/currency/User_LoanCurrencies.html"
							target="content3">金币转账</a></li>
					</ul></li> --%>
				<li></li>
				<%if(member_user!=null&&"000001".equals(member_user.getUserid())) {%>
				<li><a
					href="#"
					class="">系统管理</a>
				<ul style="visibility: hidden;">
						<li><a
							href="${path}/business/manager/AdminLog.jsp"
							target="content3">系统日志</a></li>
					</ul></li>
					<%} %>
				<li><a id="ctl00_lbtc"
					href="${path}/member/logout.action"
					target="content3">退出</a>
				</li>
				<%}%>
			</ul>

			<script type="text/javascript">    $(document).ready(function () {

        $('#jsddm > li').bind('mouseover || click', jsddm_open);

        $('#jsddm > li').bind('mouseout', jsddm_timer);

        $('#jsddm > li > a').hover(function () {

            $('#jsddm > li > a').removeClass("lihover");

            $(this).addClass("lihover");

        });

        $('#jsddm > li > ul > li').click(function () {

            $('#jsddm > li > ul').css('visibility', 'hidden');

        });

    }); 
</script>


		</div>
	</div>
	<div id="layout-content3">
		<div id="layout-right">
			<div>
				<%if(member_user!=null){ %>
				<iframe id="content3" style="z-index: 1; width: 100%"
					name="content3" src="${path}/business/member_user/User_treeview.jsp" frameborder="0"
					height="1966"></iframe>
				<%}else{ %>
				<iframe id="content3" style="z-index: 1; width: 100%"
					name="content3" src="${path}/business/login.jsp" frameborder="0"
					height="1966"></iframe>
				<%} %>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div id="footer">

		<div class="foor1">

			<!-- <a href="">碧生源</a> | <a href="">2</a> | <a href="">ren</a> | <a
				href="">北京航空</a> | <a href="">百度</a> -->
		</div>

		<div class="foor2">@2014 All Rights Reserved</div>
	</div>


	<script src="${path}/business/_files/jquery.scrollTo.js">
        </script>
	<script src="${path}/business/_files/jquery.nav.min.js">
        
        </script>

	<script>            $(document).ready(function () {
                $('#slide-nav').onePageNav({
                    filter: ':not(.external)',
                    scrollThreshold: 0.25
                });

            });
</script>



	<script language="javascript">    function turnHeight(iframe) {
        var frm = document.getElementById(iframe);
        frm.height = 600;
        var subWeb = document.frames ? document.frames[iframe].document : frm.contentDocument;
        if (frm != null && subWeb != null) {
            if (subWeb.body.scrollHeight < 600) {
                frm.height = 600;
            } else {
                frm.height = subWeb.body.scrollHeight + 20;
            }
        }
    }
</script>

</body>
</html>