var msg	;
//--------------------------------------------------------------密码修改
function out_oldupwd1(){
	var obj=document.getElementById("d_oldupwd1");
	var str=document.getElementById("txtpass1").value;
	var chk=true;
	if (str=='' || str.length<6 || str.length>16){chk=false;}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='旧密码已经输入。';
		document.getElementById("Password").removeAttribute("disabled");
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[0];
	}
	return chk;
}

function out_oldupwd2(){
	var obj=document.getElementById("d_oldupwd2");
	var str=document.getElementById("txtpass2").value;
	var chk=true;
	if (str==''){chk=false;}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='旧二级密码已经输入。';
		document.getElementById("UserPassword").removeAttribute("disabled");
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[1];
	}
	return chk;
}
function out_upwd1(){
	var obj=document.getElementById("d_upwd1");
	var str=document.getElementById("Password").value;
	var chk=true;
	if (str=='' || str.length<6 || str.length>16){chk=false;}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='密码已经输入。';
		document.getElementById("Password1").removeAttribute("disabled");
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[2];
	}
	return chk;
}

function out_upwd2(){
	var obj=document.getElementById("d_upwd2");
	var str=document.getElementById("Password1").value;
	var chk=true;
	if (str!=document.getElementById("Password").value||str==''){chk=false;}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='重复密码输入正确。';
		document.getElementById("button1").removeAttribute("disabled");     
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[3];
		document.getElementById("button1").disabled="disabled";     
	}
	return chk;
}
function out_aupwd1(){
	var obj=document.getElementById("d_aupwd1");
	var str=document.getElementById("UserPassword").value;
	var chk=true;
	if (str=='' || str.length<6 || str.length>16){chk=false;}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='二级密码已经输入。';
		document.getElementById("UserPassword1").removeAttribute("disabled");
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[4];
	}
	return chk;
}

function out_aupwd2(){
	var obj=document.getElementById("d_aupwd2");
	var str=document.getElementById("UserPassword1").value;
	var chk=true;
	if (str!=document.getElementById("UserPassword").value||str==''){chk=false;}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='重复二级密码输入正确。';
		document.getElementById("button2").removeAttribute("disabled");
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[5];
		document.getElementById("button2").disabled="disabled";   
	}
	return chk;
}
function init_reg(){
	msg=new Array(
	"请输入6位以上字符，不允许空格。",
	"请输入6位以上字符，不允许空格。",
	"请输入6位以上字符，不允许空格。",
	"请重复输入上面的密码。",
	"请输入6位以上字符，不允许空格。",
	"请重复输入上面的密码。"
	)
	document.getElementById("d_oldupwd1").innerHTML=msg[0];
	document.getElementById("d_oldupwd2").innerHTML=msg[1];
	document.getElementById("d_upwd1").innerHTML=msg[2];
	document.getElementById("d_upwd2").innerHTML=msg[3];
	document.getElementById("d_aupwd1").innerHTML=msg[4];
	document.getElementById("d_aupwd2").innerHTML=msg[5];
}
//init_reg();
function on_input1(objname){
	var strtxt;
	var obj=document.getElementById(objname);
	obj.className="d_on";
	//alert(objname);
	switch (objname){
		case "d_oldupwd1":
			strtxt=msg[0];
			break;
		case "d_upwd1":
			strtxt=msg[2];
			break;
		case "d_upwd2":
			strtxt=msg[3];
			break;

	}
	obj.innerHTML=strtxt;
}
function on_input2(objname){
	var strtxt;
	var obj=document.getElementById(objname);
	obj.className="d_on";
	//alert(objname);
	switch (objname){
		case "d_oldupwd2":
			strtxt=msg[1];
			break;
		case "d_aupwd1":
			strtxt=msg[4];
			break;
		case "d_aupwd2":
			strtxt=msg[5];
			break;
	}
	obj.innerHTML=strtxt;
}

function sl(st){
	sl1=st.length;
	strLen=0;
	for(i=0;i<sl1;i++){
		if(st.charCodeAt(i)>255) strLen+=2;
	 else strLen++;
	}
	return strLen;
}

function changePwd(oldpass,NewPass,tree){
	$.ajax({
		// 提交数据的类型 POST GET
		type : "POST",
		// 提交的网址
		url : contextPath + "/member/changePwd.action",
		// 提交的数据
		data : {
			oldpass : oldpass,
			NewPass : NewPass,
			tree : tree
		},
		// 返回数据的格式
		datatype : "html",// "xml", "html", "script", "json", "jsonp", "text".
		// 在请求之前调用的函数
		// beforeSend:function(){$("#msg").html("logining");},
		// 成功返回之后调用的函数
		success : function(data) {
			if(data=="1"){
				alert("修改成功");
			}else if(data=="0"){
				alert("修改失败,旧密码错误");
			}else{
				alert("修改失败");
			}
			document.getElementById('save_stat1').innerHTML="";
			document.getElementById('save_stat2').innerHTML="";
			document.getElementById('save_stat3').innerHTML="";
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

function editpass1()
{
	var chk=true
	if (!out_oldupwd1()){chk=false}
	if (!out_upwd1()){chk=false}
	if (!out_upwd2()){chk=false}
	//return(chk);
	if(chk)
	{
		document.getElementById('save_stat1').innerHTML='<img src=../Images/loading.gif align="absmiddle" />数据提交中……请稍候……'
	    var oldpass = document.getElementById("txtpass1").value;
	    var NewPass = document.getElementById("Password").value;
		var ID = document.getElementById("User").value;
//	    Member_User_EditPassword.EditPass(oldpass,NewPass,0,ID,EditInfo_callback);
		changePwd(oldpass,NewPass,1)
	}
}
function editpass2()
{
	var chk=true
	if (!out_oldupwd2()){chk=false}
	if (!out_aupwd1()){chk=false}
	if (!out_aupwd2()){chk=false}
	//return(chk);
	if(chk)
	{
		document.getElementById('save_stat2').innerHTML='<img src=../Images/loading.gif align="absmiddle" />数据提交中……请稍候……'
	    var oldpass = document.getElementById("txtpass2").value;
	    var NewPass = document.getElementById("UserPassword").value;
		var ID = document.getElementById("User").value;
//	    Member_User_EditPassword.EditPass(oldpass,NewPass,1,ID,EditInfo_callback);
		changePwd(oldpass,NewPass,2)
	}
}

function editpass3() {
    var chk = true
    if (!out_oldupwd3()) { chk = false }
    if (!out_trpwd1()) { chk = false }
    if (!out_trpwd2()) { chk = false }
    //return(chk);
    if (chk) {
        document.getElementById('save_stat3').innerHTML = '<img src=../Images/loading.gif align="absmiddle" />数据提交中……请稍候……'
        var oldpass = document.getElementById("txtpass3").value;
        var NewPass = document.getElementById("Treepassword").value;
        var ID = document.getElementById("User").value;
//        Member_User_EditPassword.EditPass(oldpass, NewPass, 2, ID, EditInfo_callback);
        changePwd(oldpass,NewPass,3)
    }
}
function out_oldupwd3() {
    var obj = document.getElementById("d_oldupwd3");
    var str = document.getElementById("txtpass3").value;
    var chk = true;
    if (str == '') { chk = false; }
    if (chk) {
        obj.className = "d_ok";
        obj.innerHTML = '旧三级密码已经输入。';
        document.getElementById("Treepassword").removeAttribute("disabled");
    } else {
        obj.className = "d_err";
        obj.innerHTML = msg[1];
    }
    return chk;
}
//==============
function out_trpwd1() {
    var obj = document.getElementById("d_trpwd1");
    var str = document.getElementById("Treepassword").value;
    var chk = true;
    if (str == '' || str.length < 6 || str.length > 16) { chk = false; }
    if (chk) {
        obj.className = "d_ok";
        obj.innerHTML = '三级密码已经输入。';
        document.getElementById("Treepassword1").removeAttribute("disabled");
    } else {
        obj.className = "d_err";
        obj.innerHTML = msg[4];
    }
    return chk;
}
function out_trpwd2() {
    var obj = document.getElementById("d_trpwd2");
    var str = document.getElementById("Treepassword1").value;
    var chk = true;
    if (str != document.getElementById("Treepassword").value || str == '') { chk = false; }
    if (chk) {
        obj.className = "d_ok";
        obj.innerHTML = '重复三密码输入正确。';
        document.getElementById("button3").removeAttribute("disabled");
    } else {
        obj.className = "d_err";
        obj.innerHTML = msg[5];
        document.getElementById("button3").disabled="disabled";   
    }
    return chk;
}
function EditInfo_callback(response)
{
    var strInfo = response.value;
    var arrKey =strInfo+"";
    var arrobj = arrKey.split(",");
	if (arrobj[0] != undefined && arrobj[0] != "" && arrobj[0] != null)
	{

	    href = "window.location='User_EditPassword.aspx'";

		//alert(strInfo);
		var oDialog = new dialog("");
		oDialog.init();
		oDialog.set('src',arrobj[1]);
		oDialog.event(arrobj[0],'');
		oDialog.button('dialogOk', href);
		document.getElementById('save_stat').innerHTML=arrobj[0];
	}
}

//--------------------------------------------------------------密码修改
