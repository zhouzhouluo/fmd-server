var msg	;
function out_uUserAddress(){
	var obj=document.getElementById("d_uUserAddress");
	var str=sl(document.getElementById("UserAddress").value);
	var chk=true;
	//alert(str);
	if (str<4 || str>50){chk=false;}
	if (chk)
	{
		obj.className="d_ok";
		obj.innerHTML='地址已经输入。';
	}
	else
	{
		obj.className="d_err";
		obj.innerHTML=msg[0];
	}
	return chk;
}
function out_uUserPost(){
	var obj=document.getElementById("d_uUserPost");
	var str=document.getElementById("UserPost").value;
	var chk=false;
	if (str=='' || str.length!=6){chk=false;}else{if(validate(str)){chk=true;}}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='邮编已经输入。';
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[1];
	}
	return chk;
}
function out_uUserTel(){
	var obj=document.getElementById("d_uUserTel");
	var str=document.getElementById("UserTel").value;
	var chk=false;
	if (str!='')
	{
		if(chktel(str,obj))
		{
			chk=true;
		}
	}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='联系电话已经输入。';
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[2];
	}
	return chk;
}
function out_uBankUser(){
	var obj=document.getElementById("d_uBankUser");
	var str=sl(document.getElementById("BankUserName").value);
	var chk=true;
	//alert(str);
	if (str<4 || str>14){chk=false;}
	if (chk)
	{
		obj.className="d_ok";
		obj.innerHTML='开户姓名已经输入。';
	}
	else
	{
		obj.className="d_err";
		obj.innerHTML=msg[3];
	}
	return chk;
}

function out_uBankCard() {
    var obj = document.getElementById("d_uBankCard");
    var str = document.getElementById("BankCard").value;
    var chk = true;
    if (str == '' || str.length != 19) { chk = false; }
    if (chk) {
        obj.className = "d_ok";
        obj.innerHTML = '银行卡号已经输入。';
    } else {
        obj.className = "d_err";
        obj.innerHTML = msg[5];
    }
    return chk;
}
function out_uBankAddress() {
    var obj = document.getElementById("d_uBankAddress");
    var str = document.getElementById("txtBankAddress").value;
    var chk = true;
    if (str == '' ) { chk = false; }
    if (chk) {
        obj.className = "d_ok";
        obj.innerHTML = '开户银行已经输入。';
    } else {
        obj.className = "d_err";
        obj.innerHTML = msg[6];
    }
    return chk;
}

function out_city(){
	var obj=document.getElementById("d_ucity");
	var str=document.getElementById("city").value;
	var chk=true;
	if (str==''){chk=false}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='您所在的地区已经选择。';
	}else{
		obj.className="d_err";
		obj.innerHTML=msg[4];
	}
	return chk;
}
function init_reg(){
	msg=new Array(
	"请输入4-50位字符地址。",
	"请输入6位邮编。",
	"请输入您的11位联系电话，如01012345678。",
	"请输入开户姓名。",
	"请选择开户城市。",
	"请输入银行卡号。",
	"请输入开户银行。"

	)
	document.getElementById("d_uUserAddress").innerHTML=msg[0];
	document.getElementById("d_uUserPost").innerHTML=msg[1];
	document.getElementById("d_uUserTel").innerHTML=msg[2];
	//document.getElementById("d_uBankUser").innerHTML=msg[3];
	//document.getElementById("d_ucity").innerHTML=msg[4];
}
init_reg();
function on_input(objname){
	var strtxt;
	var obj=document.getElementById(objname);
	obj.className="d_on";
	//alert(objname);
	switch (objname){
		case "d_uUserAddress":
			strtxt=msg[0];
			break;
		case "d_uUserPost":
			strtxt=msg[1];
			break;
		case "d_uUserTel":
			strtxt=msg[2];
			break;
			break;
		case "d_uBankUser":
			strtxt=msg[3];
			break;
		case "d_ucity":
			strtxt=msg[4];
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
function validate(sDouble)
{
  var re = /^\d+(?=\.{0,1}\d+$|$)/
  return re.test(sDouble)
}
function chktel(phone,obj)
{
	var p1 = /^[0-9]{11}$|^(0130|0131|0132|0133|0134|0135|0136|0137|0138|0139|0159|0158)\d{8}$/;
	//var p1 = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
	var me = false;
	if (p1.test(phone))
	{
		me=true;
	}
	else
	{	
		obj.className="d_err";
		obj.innerHTML=msg[2];
		me=false;
	}
	return me;
}
function Edit()
{
	var chk=true
	if (!out_uUserAddress()){chk=false}
	if (!out_uUserPost()){chk=false}
	if (!out_uUserTel()){chk=false}
	if (!out_uBankUser()){chk=false}
	if (!out_uBankCard()) { chk = false }
	if (!out_uBankAddress()) { chk = false }
	//return (chk);
	if(chk)
	{
		document.getElementById('save_stat').innerHTML='<img src=../images/loading.gif align="absmiddle" />数据提交中……请稍候……'
		//document.getElementById('regbotton').disabled='disabled';
		//var province=document.Form1.province.value;
		//var BankName=document.Form1.BankName.value;
		//var BankAddress=document.Form1.BankAddress.value;
		var UserAddress=document.Form1.UserAddress.value;
		var UserPost=document.Form1.UserPost.value;
		var UserTel=document.Form1.UserTel.value;
		var BankUserName = document.Form1.BankUserName.value;
		var BankAddress = document.Form1.txtBankAddress.value;
		var BankCard = document.Form1.BankCard.value;
		var QQ = document.Form1.txtQQ.value;
		var Email = document.Form1.txtEmail.value;

		//var city=document.Form1.city.value;
		var UID = document.Form1.User.value;
		Member_User_EditInfo.EditInfo(UID, UserAddress, UserPost, UserTel, QQ,Email, BankUserName, BankCard, BankAddress, EditInfo_callback);
	}
}
function EditInfo_callback(response)
{
    var strInfo = response.value;
    var arrKey =strInfo+"";
    var arrobj = arrKey.split(",");
	if (arrobj)
	{
		//alert(arrobj[2]);
	    //alert(href);
	    href = "window.location='User_EditInfo.aspx'";

	    //href = 'User_EditInfo.aspx';
		var oDialog = new dialog("");
		oDialog.init();
		oDialog.set('src',arrobj[1]);
		oDialog.event(arrobj[0],'');
		oDialog.button('dialogOk',href);
//		document.getElementById('save_stat').innerHTML='';
//		document.getElementById('regbotton').disabled='';
	}
}