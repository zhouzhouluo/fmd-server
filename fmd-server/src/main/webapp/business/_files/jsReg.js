var msg	;
function out_uFather(){
	var obj=document.getElementById("d_uFather");
	var str=sl(document.getElementById("FatherName").value);
	var chk=true;
	//alert(str);
	if (str<4 || str>18){chk=false;}
	if (chk)
	{
		
		obj.className="d_ok";
		obj.innerHTML='上节点已经输入。';
		checkFather(1);
	}
	else
	{
		obj.className="d_err";
		obj.innerHTML=msg[0];
	}
	return chk;
}
function ChkFather_callback(response)
{
	var strInfo = response.value;
    var arrKey =strInfo+"";
    var arrobj = arrKey.split(",");
	if (arrobj)
	{
		document.getElementById('chkout_uFather_stat').innerHTML='';
		document.getElementById('d_uFather').innerHTML=arrobj[0];
		document.Form1.FatherName.value=arrobj[2];
		document.getElementById('Fatherbotton').disabled='';
	}
}
function out_uRe(){
	var obj=document.getElementById("d_referee");
	var str=sl(document.getElementById("referee").value);
	var chk=true;
	//alert(str);
	if (str<4 || str>18){chk=false;}
	if (chk)
	{
		obj.className="d_ok";
		obj.innerHTML='推荐人已经输入。';
	}
	else {
	    alert("推荐人" + msg[1]);
//	    document.getElementById("ReName").focus();
		obj.className="d_err";
		obj.innerHTML=msg[1];
	}
	return chk;
}


function out_uname(){
	var obj = document.getElementById("d_userid");
	var str = sl(document.getElementById("userid").value);
	var chk = true;
	//alert(str);
	if (str<4 || str>18){chk=false;}
	if (chk)
	{
		obj.className="d_ok";
		obj.innerHTML='用户名已经输入。';
		chk = IsExistUserName();
		alert(chk);
	}
	else {
	    alert("用户名" + msg[2]);

		obj.className="d_err";
		obj.innerHTML=msg[2];
	}
	return chk;
}
// 调用Ajax方法获取信息			
function IsExistUserName()
{
	// 异步调用GetInfo方法
//	var UserName=document.getElementById("userid").value
//	Member_Reg.IsExistUserName(UserName, IsExistUserName_callback);
	
	var chk = false;
	$.ajax({
		type : "POST",
		async: false,
		contentType:"application/x-www-form-urlencoded;charset=UTF-8",
		url : contextPath + "/member/getUserIdIsExit.action",
		data : {
			userid : $("#userid").val(),
		},
		datatype : "text",// "xml", "html", "script", "json", "jsonp", "text".
		success : function(data) {
			if(data == 0){
				chk = true;
			}
		}
	});
	return chk;
}

// 回调函数,显示返回的信息
function IsExistUserName_callback(response)
{
	var obj=document.getElementById("d_uname");
	var strInfo = response.value;
    var arrKey =strInfo+"";
    var arrobj = arrKey.split(",");
	if (strInfo != undefined && strInfo != "" && strInfo != null)
	{
		if(arrobj[1]==0){obj.className="d_ok";}else{obj.className="d_err";}
		obj.innerHTML=arrobj[0];
	}
}
function out_upwd1(){
	var obj=document.getElementById("d_pwd1");
	var str=document.getElementById("pwd1").value;
	var chk=true;
	if (str=='' || str.length<6 || str.length>16){chk=false;}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='密码已经输入。';
} else {
    alert("密码" + msg[3]);

		obj.className="d_err";
		obj.innerHTML=msg[3];
	}
	return chk;
}

function out_upwd2(){
	var obj=document.getElementById("d_pwd1");
	var str=document.getElementById("pwd1").value;
	var chk=true;
	if (str!=document.getElementById("_pwd1").value||str==''){chk=false;}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='重复密码输入正确。';
} else {
    alert("重复密码" + msg[4]);

		obj.className="d_err";
		obj.innerHTML=msg[4];
	}
	return chk;
}
function out_aupwd1(){
	var obj=document.getElementById("d_pwd2");
	var str=document.getElementById("pwd2").value;
	var chk=true;
	if (str=='' || str.length<6 || str.length>16){chk=false;}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='二级密码已经输入。';
} else {
    alert("二级密码" + msg[5]);

		obj.className="d_err";
		obj.innerHTML=msg[5];
	}
	return chk;
}

function out_aupwd2(){
	var obj=document.getElementById("d_pwd2");
	var str=document.getElementById("pwd2").value;
	var chk=true;
	if (str!=document.getElementById("_pwd2").value||str==''){chk=false;}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='重复二级密码输入正确。';
} else {
    alert("重复二级密码" + msg[6]);

		obj.className="d_err";
		obj.innerHTML=msg[6];
	}
	return chk;
}
function out_uUserCode(){
	var obj=document.getElementById("d_identity");
	var str=document.getElementById("identity").value;
	var chk=false;
	if(validate(str))
	{
		if (str.length==15|| str.length==18){chk=true;}
	}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='身份证号码已经输入。';
} else {
    alert("身份证号码" + msg[7]);

		obj.className="d_err";
		obj.innerHTML=msg[7];
	}
	return chk;
}
function out_uUserAddress(){
	var obj=document.getElementById("d_receiv_address");
	
	var str=sl(document.getElementById("receiv_address").value);
	var chk=true;
	//alert(str);
	if (str<4 || str>50){chk=false;}
	if (chk)
	{
		obj.className="d_ok";
		obj.innerHTML='地址已经输入。';
	}
	else {
	    alert("地址" + msg[8]);

		obj.className="d_err";
		obj.innerHTML=msg[8];
	}
	return chk;
}
function out_uUserPost(){
	var obj=document.getElementById("d_zip_code");
	var str=document.getElementById("zip_code").value;
	var chk=false;
	if (str=='' || str.length!=6){chk=false;}else{if(validate(str)){chk=true;}}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='邮编已经输入。';
} else {
    alert("邮编" + msg[9]);

		obj.className="d_err";
		obj.innerHTML=msg[9];
	}
	return chk;
}
function out_uUserTel(){
	var obj=document.getElementById("d_phone_number");
	var str=document.getElementById("phone_number").value;
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
} else {
    alert("联系电话" + msg[10]);

		obj.className="d_err";
		obj.innerHTML=msg[10];
	}
	return chk;
}
function out_uBankCard(){
	var obj=document.getElementById("d_account");
	var str=document.getElementById("account").value;
	var chk=true;
	if (str=='' || str.length!=19){chk=false;}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='银行卡号已经输入。';
} else {
    alert("银行卡号" + msg[11]);

		obj.className="d_err";
		obj.innerHTML=msg[11];
	}
	return chk;
}
function out_uBankUser(){
	var obj=document.getElementById("d_account_name");
	var str=sl(document.getElementById("account_name").value);
	var chk = true;

	if (!(/[\u4e00-\u9fa5]+/).test(document.getElementById("account_name").value)) {
	    alert("姓名必须是文字！");
	    chk = false;
	}       


	//alert(str);
//	if (str<4 || str>18){chk=false;}
//	if (chk)
//	{
//		obj.className="d_ok";
//		obj.innerHTML='开户姓名已经输入。';
//	}
//	else {
//	    alert("开户姓名" + msg[12]);

//		obj.className="d_err";
//		obj.innerHTML=msg[12];
//	}
	return chk;
}
function out_city(){
	var obj=document.getElementById("d_account_address");
	var str=document.getElementById("account_address").value;
	var chk=true;
	if (str==''){chk=false}
	if (chk){
		obj.className="d_ok";
		obj.innerHTML='您所在的地区已经选择。';
} else {
    alert("您所在的地区" + msg[13]);

		obj.className="d_err";
		obj.innerHTML=msg[13];
	}
	return chk;
}
function out_uJl() {
//    var obj = document.getElementById("d_uJl");
//    var str = sl(document.getElementById("JlName").value);
    var chk = true;
//    //alert(str);
//    if (str > 0) {
//        if (str < 4 || str > 18) { chk = false; }
//
//        if (chk) {
//
//
//            obj.className = "d_ok";
//            obj.innerHTML = '市代已经输入。';
//        }
//        else {
//            alert("请输入市代ID");
//            obj.className = "d_err";
//            obj.innerHTML = msg[1];
//        }
//    }
//    else {
//        chk = false;
//    }
   
    return ;
}

function checkJlName() {
    var chk = true
    if (!out_uJl()) { chk = false }

    if (chk) {
        //alert(arrobj[1]);
        document.getElementById('Jlbotton').disabled = 'disabled';
        document.getElementById('chkout_uJl_stat').innerHTML = '<img src="../images/loading.gif" align="absmiddle" />';
        var bd = document.Form1.JlName.value;
        var TID = document.Form1.txtTID.value;
        Member_Reg.ChkJlther(bd,TID, ChkJlther_callback);
    }
}

function ChkJlther_callback(response) {
    var strInfo = response.value;
    var arrKey = strInfo + "";
    var arrobj = arrKey.split(",");
    if (arrobj) {
        //        var oDialog = new dialog("");
        //        oDialog.init();
        //        oDialog.set('src', arrobj[1]);
        //        oDialog.event(arrobj[0], '');
        //        oDialog.button('dialogOk', "document.getElementById('Bdbotton').disabled=''");

        alert(arrobj[0]);
        document.getElementById('Jlbotton').disabled = '';
        document.getElementById('chkout_uJl_stat').innerHTML = '';
        document.Form1.JlName.value = arrobj[2];
    }
}

function out_email() {


    var UserPost = document.Form1.email.value;
    var reg1 = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.(?:com|cn)$/;
    if (UserPost != "") {
        if (!reg1.test(UserPost.toLocaleLowerCase())) {
            alert("温馨提示您： \n\n请输入正确的邮箱地址！");
            // document.form1.UserPost.focus();
            return false;
        }
        else {
            return true;
        }
    }
    else {
        return true;
    }

  }


       
function out_Question()
         {
             var temp = document.getElementById("txtQuestion").value;
            if (temp=='') {
                alert('提示\n\n请输入密保问题！');
                return false;
            }
            else {
                return true;
            }
        }
function out_Answer()
         {
             var temp = document.getElementById("txtAnswer").value;
            if (temp=='') {
                alert('提示\n\n请输入密保答案！');
                return false;
            }
            else {
                return true;
            }
        }



function init_reg(){
	  msg=new Array(
	"请输入4-18位字符，英文、数字的组合。",
	"请输入4-18位字符，英文、数字的组合。",
	"请输入4-18位字符，英文、数字的组合。",
	"请输入6位以上字符，不允许空格。",
	"请重复输入上面的密码。",
	"请输入6位以上字符，不允许空格。",
	"请重复输入上面的密码。",
	"请输入15或18位身份证号码。",
	"请输入4-50位字符地址。",
	"请输入6位邮编。",
	"请输入您的11或12位联系电话。",
	"请输入19位银行卡号。",
	"请输入开户姓名。",
	"请选择开户城市。"
	)
	
	
//	document.getElementById("d_node").innerHTML=msg[0];
//	document.getElementById("d_referee").innerHTML=msg[1];
//	document.getElementById("d_userid").innerHTML=msg[2];
//	document.getElementById("d_pwd1").innerHTML=msg[3];
//	document.getElementById("d_pwd2").innerHTML=msg[4];
//	document.getElementById("d_identity").innerHTML=msg[7];
//	document.getElementById("d_uUserAddress").innerHTML=msg[8];
//	document.getElementById("d_zip_code").innerHTML=msg[9];
//	document.getElementById("d_phone_number").innerHTML=msg[10];
//	document.getElementById("d_account").innerHTML=msg[11];
//	document.getElementById("d_account_name").innerHTML=msg[12];
//	document.getElementById("d_account_address").innerHTML = msg[13];

}
function on_input(objname){
	var strtxt;
	var obj=document.getElementById(objname);
	obj.className="d_on";
	//alert(objname);
	switch (objname){
		case "d_uFather":
			strtxt=msg[0];
			break;
		case "d_uRe":
			strtxt=msg[1];
			break;

        case "d_uBd":
             strtxt = msg[14];
             break;

		case "d_uname":
			strtxt=msg[2];
			break;
		case "d_upwd1":
			strtxt=msg[3];
			break;
		case "d_upwd2":
			strtxt=msg[4];
			break;
		case "d_aupwd1":
			strtxt=msg[5];
			break;
		case "d_aupwd2":
			strtxt=msg[6];
			break;
		case "d_uUserCode":
			strtxt=msg[7];
			break;
		case "d_uUserAddress":
			strtxt=msg[8];
			break;
		case "d_uUserPost":
			strtxt=msg[9];
			break;
		case "d_uUserTel":
			strtxt=msg[10];
			break;
		case "d_uBankCard":
			strtxt=msg[11];
			break;
		case "d_uBankUser":
			strtxt=msg[12];
			break;
		case "d_ucity":
			strtxt=msg[13];
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
	var p1 = /^[0-9]{12}$|^(0130|0131|0132|0133|0134|0135|0136|0137|0138|0139|0159|0158)\d{8}$/;
	//var p1 = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
	var me = false;
	if (p1.test(phone))
	{
		me=true;
	}
	else
	{	
	    var p2 = /^[0-9]{11}$|^(0130|0131|0132|0133|0134|0135|0136|0137|0138|0139|0159|0158)\d{8}$/;
		if (p2.test(phone))
		{
			me=true;
		}
		else
		{
			obj.className="d_err";
			obj.innerHTML=msg[10];
			me=false;
		}
	}
	return me;
}
function checkssn()
{
	var chk=true
	if (!out_uname()){chk=false}
	
	if(chk)
	{
		document.getElementById('ssnbotton').disabled='disabled';
		document.getElementById('chkssn_stat').innerHTML='<img src="../images/loading.gif" align="absmiddle" />';
		var ssn=document.Form1.UserName.value;
		Member_Reg.ChkUser(ssn, ChkUser_callback);
	}
}
function ChkUser_callback(response){
    var strInfo = response.value;
    var arrKey =strInfo+"";
    var arrobj = arrKey.split(",");
	if (arrobj)
	{
//		var oDialog = new dialog("");
//		oDialog.init();
//		oDialog.set('src',arrobj[1]);
//		oDialog.event(arrobj[0],'');
//		oDialog.button('dialogOk', "document.getElementById('ssnbotton').disabled=''");


		alert(arrobj[0]);
		document.getElementById('ssnbotton').disabled = '';

		document.getElementById('chkssn_stat').innerHTML='';
	}
}
function checkReName()
{
	var chk=true
	if (!out_uRe()){chk=false}
	
	if(chk)
	{
		document.getElementById('rebotton').disabled='disabled';
		document.getElementById('chkout_uRe_stat').innerHTML='<img src="../images/loading.gif" align="absmiddle" />';
		var re = document.Form1.ReName.value;
		var re1 = document.Form1.RetxtBankUserName.value;
		Member_Reg.ChkRether(re,re1, ChkRether_callback);
	}
}
function checkBdName() {
    var chk = true

    if (chk) {
        document.getElementById('Bdbotton').disabled = 'disabled';
        document.getElementById('chkout_uBd_stat').innerHTML = '<img src="../images/loading.gif" align="absmiddle" />';
        var bd = document.Form1.BdName.value;
        var TID = document.Form1.txtTID.value;
        Member_Reg.ChkBdther(bd,TID, ChkBdther_callback);
    }
}

function ChkRether_callback(response){
    var strInfo = response.value;
    var arrKey =strInfo+"";
    var arrobj = arrKey.split(",");
	if (arrobj){
//		var oDialog = new dialog("");
//		oDialog.init();
//		oDialog.set('src',arrobj[1]);
//		oDialog.event(arrobj[0],'');
//		//oDialog.button('dialogOk',"document.getElementById('rebotton').disabled=''");
		//$("#rebotton").attr("disabled", "");

		alert(arrobj[0]);
		document.getElementById('rebotton').disabled = '';
		document.getElementById('chkout_uRe_stat').innerHTML='';
		document.Form1.ReName.value = arrobj[2];
	}
}

function ChkBdther_callback(response) {
    var strInfo = response.value;
    var arrKey = strInfo + "";
    var arrobj = arrKey.split(",");
    if (arrobj) {
//        var oDialog = new dialog("");
//        oDialog.init();
//        oDialog.set('src', arrobj[1]);
//        oDialog.event(arrobj[0], '');
//        oDialog.button('dialogOk', "document.getElementById('Bdbotton').disabled=''");

        alert(arrobj[0]);
        document.getElementById('Bdbotton').disabled = '';
        document.getElementById('chkout_uBd_stat').innerHTML = '';
        document.Form1.BdName.value = arrobj[2];
    }
}

function checkFatherName()
{
	var chk=true
	if (!out_uFather()){chk=false}
	
	if(chk)
	{
		checkFather(0);
	}
}
function checkFather(key)
{
	document.getElementById('Fatherbotton').disabled='disabled';
	document.getElementById('chkout_uFather_stat').innerHTML='<img src="../images/loading.gif" align="absmiddle" />';
	var Father = document.Form1.FatherName.value;
	var re1 = document.Form1.FatxtBankUserName.value;
	var TreePlace=0;
	var radiolist ="TreePlace";   
	for(var   i=0;i<document.getElementById(radiolist).rows.length;i++)   
	{   
		for(var   x=0;x<document.getElementById(radiolist).rows[i].cells.length;x++)   
		{   
			if(document.getElementById(radiolist).rows[i].cells[x].firstChild!="undefine")   
			{     
				if(document.getElementById(radiolist).rows[i].cells[x].firstChild.checked)   
				{ 
				   TreePlace=document.getElementById(radiolist).rows[i].cells[x].firstChild.value;
				   //alert(document.getElementById(radiolist).rows[i].cells[x].firstChild.value);   
				 }                                   
			}   
		}   
	}
	if(key==1)
	{
	    Member_Reg.ChkFather(Father, re1,TreePlace, ChkFather_callback);
	}
	else
	{
	    Member_Reg.ChkFather(Father, re1,TreePlace, ChkFatherName_callback);
	}
}
function ChkFatherName_callback(response)
{
    var strInfo = response.value;
    var arrKey =strInfo+"";
    var arrobj = arrKey.split(",");
	if (arrobj)
	{
//		var oDialog = new dialog("");
//		oDialog.init();
//		oDialog.set('src',arrobj[1]);
//		oDialog.event(arrobj[0],'');
//		oDialog.button('dialogOk', "document.getElementById('Fatherbotton').disabled=''");

		alert(arrobj[0]);
		document.getElementById('Fatherbotton').disabled = '';
		document.getElementById('chkout_uFather_stat').innerHTML='';
		document.Form1.FatherName.value=arrobj[2];
		document.getElementById('Fatherbotton').disabled='';
	}
}
function out_refree(){
	var str=document.getElementById("referee").value;
	var chk=true;
	if (str==''){chk=false;}
	if (!chk){
		alert('请输入正确的节点人');
	}
	return chk;
}
function out_node(){
	var str=document.getElementById("node").value;
	var chk=true;
	if (str==''){chk=false;}
	if (!chk){
		alert('请输入正确的推荐人');
	}
	return chk;
}
/**
 * 
 * @returns {Boolean}
 */
function chk_reg()
{
	var chk=true
	//if (!out_uFather()){chk=false}
	if (!out_uRe()) { chk = false }
	//if (!out_uBd()) { chk = false }
	if (!out_uname()) { chk = false }
	if (!out_upwd1()){chk=false}
	if (!out_upwd2()){chk=false}
	if (!out_aupwd1()){chk=false}
	if (!out_aupwd2()){chk=false}
//	if (!out_uUserCode()){chk=false}
	if (!out_uUserAddress()){chk=false}
//	if (!out_uUserPost()){chk=false}
	if (!out_uUserTel()){chk=false}
//	if (!out_uBankCard()){chk=false}
	if (!out_uBankUser()){chk=false}
	if (!out_city()) { chk = false }
	if (!out_Question()) { chk = false }
	if (!out_Answer()) { chk = false }
	if (!out_email()) { chk = false }
	if (!out_refree()) { chk = false }
	if (!out_node()) { chk = false }
//	var obj = document.getElementById("d_uJl");
//	var str = sl(document.getElementById("JlName").value);
//	if (str > 0) {
//	    if (!out_uJl()) { chk = false }
//	}
	//return(chk);
	if(chk)
	{
		//document.getElementById('regbotton').disabled='disabled';
//		alert(uLevel);
//		return false;
//		
//		var province=document.Form1.province.value;
//		var BankName=document.Form1.BankName.value;
//		var BankAddress=document.Form1.BankAddress.value;
//		var UserNo=document.Form1.lbUserNo.value;
//		var FatherName=document.Form1.FatherName.value;
		var userid=document.Form1.userid.value;
		var pwd1=document.Form1.pwd1.value;
		var pwd2 = document.Form1.pwd2.value;
		var pwd3 = document.Form1.pwd3.value;
		var zip_code = document.Form1.zip_code.value;
		var referee_id=document.Form1.referee_id.value;
		var referee=document.Form1.referee.value;
		var node_id=document.Form1.node_id.value;
		var node=document.Form1.node.value;
		var area=document.Form1.area.value;
		var identity=document.Form1.identity.value;
		var receiv_address=document.Form1.receiv_address.value;
		var qq = document.Form1.qq.value;
		var phone_number = document.Form1.phone_number.value;
		var email = document.Form1.email.value;
		var bank_name = document.Form1.bank_name.value;
		var account_name = document.Form1.account_name.value;
		var account_address = document.Form1.account_address.value;
		var account = document.Form1.account.value;
		
//		alert("userid="+userid+","+"pwd1="+pwd1+","+"pwd2="+pwd2+","+"pwd3="+pwd3+","+"zip_code="+zip_code+","+"referee_id="+referee_id+","+"referee="+referee+","+
//				"node_id="+node_id+","+"node="+node+","+"area="+area+","+"identity="+identity+","+"receiv_address="+receiv_address+","+"qq="+qq+","+"phone_number="+phone_number+","+
//				"email="+email+","+"bank_name="+bank_name+","+"account_name="+account_name+","+"account_address="+account_address+","+"account="+account+",");
		
		
//		var BdName = document.Form1.BdName.value;
//		var JlName = document.Form1.JlName.value;
//
//		var FaBankUserName = document.Form1.FatxtBankUserName.value;
//		var ReBankUserName = document.Form1.RetxtBankUserName.value;
//
//		var Question = document.Form1.txtQuestion.value;
//		var Answer = document.Form1.txtAnswer.value;
//		var Cash = document.Form1.txtCash.value;
//
//		var PV = document.Form1.txtPV.value;
//		var kd = 0;
//		var TID = document.Form1.txtTID.value;
//		if (document.Form1.kd.checked)
//		    kd = 1;

		//alert(Cash + "--" + PV);
//		if (uLevel < 7 && kd==0) {
//		    if (StrID == "") {

//		        alert("请选择产品！");
//		        return false;
//		    }
//		    if ((uLevel == 1 && Cash > 1300) || (uLevel == 2 && Cash > 3900) || (uLevel == 3 && Cash > 13800) || (uLevel == 4 && Cash > 17280) || (uLevel == 5 && Cash > 37280) || (uLevel == 6 && Cash > 270000)) {
//		        alert("请选择跟等级对应金额的产品！");
//		        return false;


//		    }
//		}

		document.getElementById('save_stat').innerHTML = '<img src=../Images/loading.gif align="absmiddle" />数据提交中……请稍候……'

//		alert(Cash);
//				return false;
		//if (confirm("溫馨提示：請仔細核對資料，推荐人:" + ReName + ",接点人:" + FatherName + "接点人姓名：" + FaBankUserName + ",確定提交嗎？")) {
		if (confirm("温馨提示：请仔细核对资料，推荐人:" + referee + ",确定提交吗？")) {
//		    Member_Reg.SaveReg(TreePlace, uLevel, province, BankName, BankAddress, UserNo, FatherName, ReName, UserName, Password, UserPassword, UserPassword2, UserCode, UserAddress, UserPost, UserTel, BankCard, BankUserName, city, RegIP, Email, QQ, No99bill, StrID, strNum, strPrice, PayID, BdName, JlName, FaBankUserName, ReBankUserName, kd, Question, Answer, PV,Cash,TID, SaveInfo_callback);
			document.Form1.submit();
		}
		else {
		    return false;
		}
		

	}
}
function SaveInfo_callback(response)
{
    var strInfo = response.value;
    var arrKey =strInfo+"";
    var arrobj = arrKey.split(",");
    var href = "window.location='" + window.location.href.substring(0, window.location.href.lastIndexOf("/")) + "/" + "User_treeviewall.aspx'";
	//alert(arrobj[1]);
	if (arrobj){
		switch (arrobj[1]){
			case '8':
			href="window.location='"+window.location.href.substring(0,window.location.href.lastIndexOf("/"))+"/"+""+arrobj[2]+"'";
			break;
			case 'Reg.aspx':
			href='';
			case '1':
			href='';
			break;
		}
		if(arrobj[1]=='8')
		{
             window.location=arrobj[2];
		}
		else
		{	
		    //alert(arrobj[2]);
			//alert(href);
			if(href==''){href+="document.getElementById('regbotton').disabled='';";}
//			var oDialog = new dialog("");
//			oDialog.init();
//			oDialog.set('src',arrobj[1]);
//			oDialog.event(arrobj[0],'');
//			oDialog.button('dialogOk', href);

			alert(arrobj[0]);

			document.getElementById('save_stat').innerHTML='';
			//document.getElementById('regbotton').disabled='';
		}
	}
}
function changeArea(areaValue){
	alert(areaValue);
	document.Form1.area.value = areaValue;
	alert(document.Form1.area.value );
}
