function createRequest() {
	var t=$("#userid").val();
	var z= /^[0-9]*$/;
	if(z.test(t)){
//	   alert("是数字");
	}else{
	   alert("用户id只能是数字");
	};

	$.ajax({
		// 提交数据的类型 POST GET
		type : "POST",
		// 提交的网址
		url : contextPath + "/member/login.action",
		// 提交的数据
		data : {
			userid : $("#userid").val(),
			pwd : $("#pwd").val(),
			idcode : $("#idcode").val()
		},
		// 返回数据的格式
		datatype : "html",// "xml", "html", "script", "json", "jsonp", "text".
		// 在请求之前调用的函数
		// beforeSend:function(){$("#msg").html("logining");},
		// 成功返回之后调用的函数
		success : function(data) {
			if(data=="1"){
//				alert(window.parent);
//				alert(window.parent.location);
//				window.parent.location.reload();
				window.parent.location.href=contextPath + "/business/index.jsp";
			}else if(data=="2"){
				alert("验证码错误");
			}else{
				alert("用户名或密码错误");
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
