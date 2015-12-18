(function(window, $) {
    var cookieArr = document.cookie.split(";");
    var defaultUsername = "";
    for (var i = 0; i < cookieArr.length; i++) {
        if (cookieArr[i].match("login_user_name")) {
            defaultUsername = cookieArr[i].split("=")[1];
        }
    }
    if (defaultUsername) {
        $("[name='username']").val(decodeURIComponent(defaultUsername));
    }

    var normalForm = $("#login-tab-content0"),
        telForm = $("#login-tab-content1"),
        cardForm = $("#login-card-wrap"),
        normalContent = $("#login-content"),
        cardContent = $("#login-card-wrap"),
        identify_codeFlag = false,
        loginType = document.getElementById("errLoginType").value,
        loginMsg = document.getElementById("errLoginMsg").value;
    //普通登录与动态密码登录切换
    $('#login-tab li').on('click', function() {
        var id = $(this).attr('id');
        var siblings = $(this).siblings('li');
        if (id === 'login-tab-user') {
            if (normalForm.is(':visible')) {
                return;
            }
            $(this).addClass('cur');
            siblings.removeClass('cur');
            normalForm.show();
            change_identify_code();
            defaultFocus(normalForm);
            telForm.hide();
        } else {
            if (telForm.is(':visible')) {
                return;
            }
            $(this).addClass('cur');
            siblings.removeClass('cur');
            telForm.show();
            defaultFocus(telForm);
            change_identify_code();
            normalForm.hide();
        }
        identify_codeFlag = false;
        $(".login_error").html('').hide();
    });
    //end

   //合作卡登陆start
    $(".use_card").on("click", function() {
        $(".login_error").html('').hide();
        normalContent.hide();
        cardContent.show();
        change_identify_code();
        defaultFocus(cardContent);
        identify_codeFlag = false;
    });
    //end

    //合作卡登陆的关闭 start
    $('#J-card').on('click', function() {
        $(".login_error").html('').hide();
        cardContent.hide();
        normalContent.show();
        change_identify_code();
        defaultFocus(normalContent);
        identify_codeFlag = false;
    });
    
    $(".login-card-close").on("click", function() {
        $(".login_error").html('').hide();
        cardContent.hide();
        normalContent.show();
        change_identify_code();
        defaultFocus(normalContent);
        identify_codeFlag = false;
    });
    //end

    if (loginType && loginMsg) {
        switch (loginType) {
            case "P-N":
            case "F-N":
                $(".login_error", normalForm).text(loginMsg).show();
                break;
            case "P-M":
            case "F-M":
                $("#login-tab-pass").trigger("click");
                $(".login_error", telForm).text(loginMsg).show();
                break;
            case "P-C":
                $(".use_card").trigger("click");
                $(".login_error", cardForm).text(loginMsg).show();
                break;
            default:
                break;
        }
    }
    var originalValue = '';
    //获取焦点及失去焦点事件
    $("form input").focus(function() {
        $(this).parents('tr').addClass('hover').removeClass("err");
    }).blur(function() {
        $(this).parents('tr').removeClass('hover');
    }).keyup(function(e) {
        if (e.keyCode === 13) {
            $("[name='submit_login']", $(this).parents("form")).trigger("click");
        }
    }).on('input', function(){
        if(this.value == originalValue){
            return;
        }
        originalValue = this.value;
        var flag = checkData(this);
        if (this.id == "telNum" && this.value && new RegExp("^((13[0-9])|(15[0-9])|(18[0-9])|14[0-9]|17[0-9])[0-9]{8,8}$").test(this.value)) {
            $.get("/ajax/isCaptchaRequired?tel=" + this.value, function(json) {
                try {
                    var json = eval("(" + json + ")");
                } catch (e) {
                    $('.login_error', $(element).parents('table')).text("验证码错误").show();
                }
                if (json.success) {
                    $("#line_9").show();
                } else {
                	$("#line_9").hide();
                }
            });
            return;
        }
    });
    //end
    //提交事件
    $("[name='submit_login']").on("click", function() {
        var form = $(this).parents("form");
        var flag = checkData($("input", form), 'noNull');
        if (flag && !$("[name='identify_code']", form).is(":visible") || identify_codeFlag) {
            form[0].submit();
        }
    });
    //end
    //校验数据单个或者整体
    function checkData(ele, noNull) {
        var text = "";
        var returnflag = true;
        $(".login_error").html('').hide();
        if (!ele.length) {
            $(ele).parents('tr').removeClass("err");
            text = errorText(ele, noNull);
            if (text) {
                $('.login_error', $(ele).parents('table')).text(text).show();
                $(ele).parents("tr").addClass("err");
                return false;
            }
        } else {
            $(ele).parents('table').find("tr.err").removeClass("err");
            $.each(ele, function(i, item) {
                text = errorText(item, noNull);
                if (text) {
                    $(item).trigger("focus");
                    $(item).parents("tr").addClass("err");
                    $('.login_error', $(item).parents('table')).text(text).show();
                    returnflag = false;
                    return false;
                }
            });
        }
        return returnflag;
    }

    function errorText(element, noNull) {
            if (!element.value && !noNull) {
                return '';
            }
            if ((noNull === 'noNull' && !element.value) || element.value.length > 32) {
                switch (element.name) {
                    case "username":
                        return "请输入正确的" + element.placeholder;
                        break;
                    case "password":
                        if ($(element).hasClass('tel')) {
                            return "请输入正确的动态密码";
                        } else {
                            return "请输入正确的密码";
                        }
                        break;
                    case "identify_code":
                        if (!element.value && $(element).is(":visible")) {
                            return "请输入正确的验证码";
                        }
                        break;
                    default:
                        return "";
                        break;
                }
            } else if (element.name == "username" && $(element).hasClass('tel')) {
                if (new RegExp("^((13[0-9])|(15[0-9])|(18[0-9])|14[0-9]|17[0-9])[0-9]{8,8}$").test(element.value) == false) {
                    return '请输入正确的手机号码';
                }
            } else if (element.name == "identify_code" && $(element).is(":visible")) {
                if (!/^([a-zA-Z0-9])*$/.test(element.value) || element.value.length != 4) {
                    return "请输入正确的验证码，长度4位字母或者数字。";
                } else {
                    var tmpUrl ="/ajax/checkCaptcha?identify_code=" + element.value + "&t=" + (new Date().getTime() + Math.random());
                    $.get(tmpUrl, function(json) {
                        try {
                            var json = eval("(" + json + ")");
                        } catch (e) {
                            $('.login_error', $(element).parents('table')).text("验证码错误").show();
                        }
                        if (!json.success) {
                            identify_codeFlag = false;
                            $(element).focus();
                            $(element).parents("tr").addClass("err");
                            $('.login_error', $(element).parents('table')).text("验证码错误，请重新输入").show();

                            if ( json.errno == -2 ) {
                                change_identify_code();
                            }
                        } else {
                            identify_codeFlag = true;
                        }
                    });
                }
            } else if (element.name == "password") {
                if ($(element).hasClass("tel")) {
                    if (!/^([0-9])*$/.test(element.value) || element.value.length != 6) {
                        return "请输入正确的手机验证码，长度6位的数字。";
                    }
                } else if (element.value.length < 6) {
                    return "请输入正确的密码，密码长度最少必须6位";
                }
            } else {
                return "";
            }
            return "";
        }
        //end

    //表单的默认focus
    function defaultFocus(ele) {
            var username = $("[name='username']", ele);
            var password = $("[name='password']", ele);
            var identify_code = $("[name='identify_code']", ele);
            if (username.val() == '') {
                username.focus();
            } else if (password.val() == '') {
                password.focus();
            } else {
                identify_code.focus();
            }
        }
        //end

    setTimeout(function() {
        defaultFocus(normalForm);
    }, 200);
    //end



    //点击切换验证码，以及验证码完成隐藏loading
    $(".identify_img").on("click", change_identify_code);
    $(".identify_img").on("load", function() {
        $(".loadingImg").hide();
        $(this).show();
    });
    //end

    //其他方式登录的样式切换
    $(".partner-login li").hover(function() {
        $(this).addClass("cur");
    }, function() {
        $(this).removeClass("cur");
    });
    //end

    //短信验证码的发送
    $(".get-code").bind("click", sendCode);
    //end

    //执行一次初始化
    change_identify_code();
    resizeScreen();
    //end

    //手机发送动态码
    function sendCode() {
            var telFormDiv = $(this).parents('form');
            var flag = checkData($("[name='username'],[name='identify_code']", telFormDiv), "noNull");
            if (flag) {
                $(".get-code,.send-code-again").attr("disabled", true);
                $(".get-code,.send-code-again").unbind("click");
                var postData = {
                    tel: $("[name='username']", telFormDiv).val(),
                    identify_code: $("[name='identify_code']", telFormDiv).val(),
                    is_login: 1
                }
                $.post('/ajax/sendMobileCode', postData, function(json) {
                    try {
                        var json = eval("(" + json + ")");
                    } catch (e) {
                        $(".login_error", telForm).text('动态口令发送失败，请稍候重试。').show();
                        return;
                    }
                    if (json.success) {
                        $.layer({
                            title: 0,
                            closeBtn: 0,
                            time: 3,
                            shadeClose: true,
                            dialog: {
                                type: 1,
                                msg: "&nbsp;&nbsp;&nbsp;&nbsp;动态口令已发送，15分钟内有效！"
                            },
                            offset: ['90px', '']
                        });
                        $(".get-code,.send-code-again").hide();
                        intervalTime(60);
                    } else {
                        $(".get-code,.send-code-again").removeAttr("disabled");
                        $(".get-code,.send-code-again").bind("click", sendCode);
                        switch (json.errno) {
                            case -1:
                                $("[name='username']", telFormDiv).focus();
                                $("[name='username']", telFormDiv).parents("tr").addClass("err");
                                $(".login_error", telForm).text('请输入正确的手机号码').show();
                                return;
                                break;
                            case -2:
                                $("[name='identify_code']", telFormDiv).focus();
                                $("[name='identify_code']", telFormDiv).parents("tr").addClass("err");
                                $(".login_error", telForm).text('请输入正确的验证码').show();
                                $("#line_9").show();
                                change_identify_code();
                                return;
                                break;
                            case -3:
                                $(".login_error", telForm).text('动态口令发送失败，请稍候重试。').show();
                                return;
                                break;
                            case -4:
                                $("[name='username']", telFormDiv).focus();
                                $("[name='username']", telFormDiv).parents("tr").addClass("err");
                                $(".login_error", telForm).text(json.errmsg).show();
                                return;
                                break;
                            default:
                                $.layer({
                                    title: 0,
                                    closeBtn: 0,
                                    time: 3,
                                    shadeClose: true,
                                    dialog: {
                                        type: 1,
                                        msg: "&nbsp;&nbsp;&nbsp;&nbsp;动态口令已发送，15分钟内有效！"
                                    },
                                    offset: ['90px', '']
                                });
                                break;
                        }
                    }
                });
            }
        }
        //end

    function intervalTime(num) {
            var num = parseInt(num);
            var i = 0;
            $(".send-code").css("display", "inline-block");
            $(".send-code span").text(num);
            var inter = setInterval(function() {
                if (i < num) {
                    i++;
                    $('.send-code span').text(num - i);
                } else {
                    clearInterval(inter);
                    $(".send-code-again").css("display", "inline-block").bind("click", sendCode);
                    $(".send-code").hide();
                    $(".send-code span").text(0);
                }
            }, 1000);
        }
        //1200宽度与1000宽度切换
    function resizeScreen() {
            var index1200 = $("#index1200");
            //初始化页面
            if (!isBigThan1280()) {
                index1200.removeClass("index1200").addClass("index1000");
            } else {
                index1200.removeClass("index1000").addClass("index1200");
            }
            //改变屏幕大小
            $(window).resize(function() {
                if (!isBigThan1280()) {
                    if (!index1200.hasClass("index1000")) {
                        index1200.removeClass("index1200").addClass("index1000");
                    }
                } else {
                    if (!index1200.hasClass("index1200")) {
                        index1200.removeClass("index1000").addClass("index1200");
                    }
                }
            });
        }
        //end


    //判断是不是IE6
    function isIE6() {
            if ($.browser.msie && $.browser.version == 6) {
                return true;
            } else {
                return false;
            }
        }
        //end


    //判断宽度
    function isBigThan1280() {
            var w_wd = $(window).width();
            if (w_wd >= 1280) {
                return true;
            } else {
                return false;
            }
        }
        //end


    //更换验证码
    function change_identify_code() {
            $(".loadingImg").css("display", "");
            $('.identify_img').hide().attr('src', '/ajax/captcha/v/' + (new Date().getTime() + Math.random()));
        }
        //end
  //点击 close，关闭弹窗
    $(".d_helpclose").on("click", function(){
    	$(this).parent().parent().hide();
    });
    // 点击我知道了，关闭弹窗
    $(".abtn_helpiknow").on("click", function(){
    	$(this).parent().parent().hide();
    });
    //end
    //合作卡绑定提示
    $("#J-card-help").on("click", function(){
    	$(".df_hezuokahelp_bg").fadeIn();
    });
    
})(window, jQuery, undefined);

////方法：change_card_tpl(sel_opt)
////合作卡激活-图片的版权控制
////chenjinlong 2011-11-23
////============================================
function change_card_tpl() {
    $("#errmsg").html('');
    var sel_opt = $("#sel_membcard_name").val();
    if (sel_opt == "请选择合作卡类型") {
        $("#card-box-inner").css('background', "url('http://www.tuniu.com/img/membcard_type/default_card.jpg') no-repeat scroll 225px center transparent");
        $("#card-box-inner #txt_membcard_id").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #errmsg").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #card_id").html("请输入您的会籍卡号:").css({
            "color": "#000",
            "font-weight": "normal",
            "font-size": "14px",
            "line-height": "normal"
        });
        $("#card-box-inner #register").html("<input type='image' src='https://ssl1.tuniucdn.com/u/user/2011/img/next.png' onclick='active_membcard();'/>");
    } else if (sel_opt == "建行途牛联名卡") {
        $("#card-box-inner").css('background', "url('http://www.tuniu.com/img/membcard_type/ccb_card.jpg') no-repeat scroll 225px center transparent");
        $("#card-box-inner #txt_membcard_id").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #errmsg").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #card_id").html("请输入您的会籍卡号:").css({
            "color": "#000",
            "font-weight": "normal",
            "font-size": "14px",
            "line-height": "normal"
        });
        $("#card-box-inner #register").html("<input type='image' src='https://ssl1.tuniucdn.com/u/user/2011/img/next.png' onclick='active_membcard();'/>");
    } else if (sel_opt == "中信途牛联名卡") {
        $("#card-box-inner").css('background', "url('http://www.tuniu.com/img/membcard_type/ecitic_card.jpg') no-repeat scroll 225px center transparent");
        $("#card-box-inner #txt_membcard_id").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #errmsg").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #card_id").html("请输入您的会籍卡号:").css({
            "color": "#000",
            "font-weight": "normal",
            "font-size": "14px",
            "line-height": "normal"
        });
        $("#card-box-inner #register").html("<input type='image' src='https://ssl1.tuniucdn.com/u/user/2011/img/next.png' onclick='active_membcard();'/>");
    } else if (sel_opt == "会购途牛联名卡") {
        $("#card-box-inner").css('background', "url('https://ssl1.tuniucdn.com/u/user/2011/mbcard/5higo_card.jpg') no-repeat scroll 225px center transparent");
        $("#card-box-inner #txt_membcard_id").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #errmsg").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #card_id").html("请输入您的会籍卡号:").css({
            "color": "#000",
            "font-weight": "normal",
            "font-size": "14px",
            "line-height": "normal"
        });
        $("#card-box-inner #register").html("<input type='image' src='https://ssl1.tuniucdn.com/u/user/2011/img/next.png' onclick='active_membcard();'/>");
    } else if (sel_opt == "维络城途牛联名卡") {
        $("#card-box-inner").css('background', "url('https://ssl1.tuniucdn.com/u/user/2011/mbcard/velo_card.jpg') no-repeat scroll 225px center transparent");
        $("#card-box-inner #txt_membcard_id").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #errmsg").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #card_id").html("请输入您的会籍卡号:").css({
            "color": "#000",
            "font-weight": "normal",
            "font-size": "14px",
            "line-height": "normal"
        });
        $("#card-box-inner #register").html("<input type='image' src='https://ssl1.tuniucdn.com/u/user/2011/img/next.png' onclick='active_membcard();'/>");
    } else if (sel_opt == "江苏银行途牛联名卡") {
        $("#card-box-inner").css('background', "url('https://ssl1.tuniucdn.com/site/images/user_login/jsb_card_new.jpg') no-repeat scroll 245px center transparent");
        $("#card-box-inner #txt_membcard_id").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #errmsg").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #card_id").html("请输入您的会籍卡号:").css({
            "color": "#000",
            "font-weight": "normal",
            "font-size": "14px",
            "line-height": "normal"
        });
        $("#card-box-inner #register").html("<input type='image' src='https://ssl1.tuniucdn.com/u/user/2011/img/next.png' onclick='active_membcard();'/>");
    } else if (sel_opt == "光大银行信用卡专享活动") {
        $("#card-box-inner").css('background', "url('http://www.tuniu.com/img/membcard_type/gd_card.jpg') no-repeat scroll 225px center transparent");
        $("#card-box-inner #txt_membcard_id").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #errmsg").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #card_id").html("请输入您的会籍卡号:").css({
            "color": "#000",
            "font-weight": "normal",
            "font-size": "14px",
            "line-height": "normal"
        });
        $("#card-box-inner #register").html("<input type='image' src='https://ssl1.tuniucdn.com/u/user/2011/img/next.png' onclick='active_membcard();'/>");
    } else if (sel_opt == "广发银行真情信用卡VIP") {
        $("#card-box-inner").css('background', "url('http://www.tuniu.com/img/membcard_type/gf_card.jpg') no-repeat scroll 225px center transparent");
        $("#card-box-inner #txt_membcard_id").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #errmsg").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #card_id").html("请输入您的会籍卡号:").css({
            "color": "#000",
            "font-weight": "normal",
            "font-size": "14px",
            "line-height": "normal"
        });
        $("#card-box-inner #register").html("<input type='image' src='https://ssl1.tuniucdn.com/u/user/2011/img/next.png' onclick='active_membcard();'/>");
    } else if (sel_opt == "2015广发真情俱乐部金、银钻会员"
            || sel_opt == "2015广发真情俱乐部粉钻会员"
            || sel_opt == "2015广发车主俱乐部会员"
            || sel_opt == "2015广发铂金俱乐部会员"
    ) {
        $("#card-box-inner").css('background', "url('https://ssl4.tuniucdn.com/img/20150723/user_login/gdcode.jpg') no-repeat scroll 235px center transparent");
        $("#card-box-inner #txt_membcard_id").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #errmsg").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #card_id").html("请输入您的会籍卡号:").css({
            "color": "#000",
            "font-weight": "normal",
            "font-size": "14px",
            "line-height": "normal"
        });
        $("#card-box-inner #register").html("<input type='image' src='https://ssl1.tuniucdn.com/u/user/2011/img/next.png' onclick='active_membcard();'/>");
    } else if (sel_opt == "招商银行杭州分行M卡专属优惠") {
        $("#card-box-inner").css('background', "url('http://www.tuniu.com/img/membcard_type/zsm_card.jpg') no-repeat scroll 225px center transparent");
        $("#card-box-inner #txt_membcard_id").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #errmsg").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #card_id").html("请输入您的会籍卡号:").css({
            "color": "#000",
            "font-weight": "normal",
            "font-size": "14px",
            "line-height": "normal"
        });
        $("#card-box-inner #register").html("<input type='image' src='https://ssl1.tuniucdn.com/u/user/2011/img/next.png' onclick='active_membcard();'/>");
    } else {
        $("#card-box-inner").css('background', "url('http://www.tuniu.com/img/membcard_type/default_card.jpg') no-repeat scroll 225px center transparent");
        $("#card-box-inner #txt_membcard_id").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #errmsg").parent().css({
            "height": "30px",
            "display": "block"
        });
        $("#card-box-inner #card_id").html("请输入您的会籍卡号:").css({
            "color": "#000",
            "font-weight": "normal",
            "font-size": "14px",
            "line-height": "normal"
        });
        $("#card-box-inner #register").html("<input type='image' src='https://ssl1.tuniucdn.com/u/user/2011/img/next.png' onclick='active_membcard();'/>");
    }
}

//合作卡激活
function active_membcard() {
        var membcard_name = $("#sel_membcard_name").val();
        var membcard_id = $("#txt_membcard_id").val();
        var url = '/ajax/membercard';
        var p = {
            'card_type': membcard_name,
            'card_id': membcard_id
        };
        var error_msg = '';
        $.post(url, p, function(result) {
            try {
                var result = eval("(" + result + ")");
            } catch (e) {
                $("#errmsg").html("服务器错误，请稍后重试。");
            }
            if (result.success) {
                window.location.href = "http://www.tuniu.com/main.php?do=user_membcard_bind&login_type=" + escape(encodeURI(membcard_name)) + "&login_id=" + membcard_id; //跳转至激活成功后的注册绑定会员页面
                return true;
            } else {
                $("#errmsg").html(result.errmsg);
            }
            // switch (parseInt(result)) {
            //     case 1:
            //         window.location.href = "http://www.tuniu.com/main.php?do=user_membcard_bind&login_type=" + escape(encodeURI(membcard_name)) + "&login_id=" + membcard_id; //跳转至激活成功后的注册绑定会员页面
            //         return true;
            //     case 2:
            //         error_msg = '您输入的合作卡号不存在';
            //         break;
            //     case 3:
            //         error_msg = '您输入的合作卡已激活';
            //         break;
            //     case 4:
            //         error_msg = '您输入的合作卡类型与卡号不匹配';
            //         break;
            //     default:
            //         error_msg = '请选择合作卡类型及填写合作卡号';
            //         break;
            // }
            // $("#errmsg").html(error_msg);
            // return false;
        });
    }
    //end





