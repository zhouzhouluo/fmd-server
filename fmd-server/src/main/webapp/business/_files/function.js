var IsIE5=document.all;
function unselectall()
{
    if(document.myform.chkAll.checked){
	document.myform.chkAll.checked = document.myform.chkAll.checked&0;
    } 	
}

/*
function CheckAll(form)
{
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll")
       e.checked = form.chkAll.checked;
		if(e.type == 'checkbox' && e.name != 'chkAll'){
			var objParentDiv = e.parentNode.parentNode;
			e.checked ? fSetBg(objParentDiv) : fReBg(objParentDiv);
		}
    }
}
*/
function CheckAll(form,iValue)
{
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name = "id")
       e.checked = iValue
    }
}

function openScript(url, width, height){
	//alert(IsIE);
	if (IsIE5){
		var Win = showModelessDialog(url,"openScript",'dialogWidth:' + width + 'px;dialogHeight:' + height + 'px;dialogLeft:300px;dialogTop:100px;center:yes;help:yes;resizable:no;status:yes;scroll:yes') 
	}
	else {
		var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',top=100,left=300,toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no,status=yes' );
	}
	Win.focus();
	return;
}

function submitdate()
{
	var date=document.oblogform.selecty1.value+"-"+document.oblogform.selectm1.value+"-"+document.oblogform.selectd1.value
	var datereg=/^(\d{4})-(\d{1,2})-(\d{1,2})$/
	var datareg=/^(\d){1,2}$/
	if (!datereg.test(date)){
	  alert("开始时间输入格式错误");
	   return false;
	 }
	var r=date.match(datereg)
	var d=new Date(r[1],r[2]-1,r[3])
	if (!(d.getFullYear()==r[1]&&d.getMonth()==r[2]-1&&d.getDate()==r[3])){
	  alert("开始时间输入格式错误");
	   return false;
	 }
	 
	 var edate=document.oblogform.selecty2.value+"-"+document.oblogform.selectm2.value+"-"+document.oblogform.selectd2.value
	var datereg=/^(\d{4})-(\d{1,2})-(\d{1,2})$/
	var datareg=/^(\d){1,2}$/
	if (!datereg.test(edate)){
	  alert("结束时间输入格式错误");
	   return false;
	 }
	var er=edate.match(datereg)
	var ed=new Date(er[1],er[2]-1,er[3])
	if (!(ed.getFullYear()==er[1]&&ed.getMonth()==er[2]-1&&ed.getDate()==er[3])){
	  alert("结束时间输入格式错误");
	   return false;
	 }	
	
	date = date.replace(/\-/g,"\/");
	edate = edate.replace(/\-/g,"\/");	
	if ((new Date(date) > new Date(edate))){
		alert("结束日期不能小于开始日期!");
	return false;
	}
	 
	return true;
}

function del_space(s)
{
	for(i=0;i<s.length;++i)
	{
	 if(s.charAt(i)!=" ")
		break;
	}
	for(j=s.length-1;j>=i;--j)
	{
	 if(s.charAt(j)!=" ")
		break;
	}
	return s.substring(i,++j);
}

function chkcopy()
{
	if (IsIE5){
		var IframeID=frames["oblog_Composition"];
	}
	else{
		var IframeID=document.getElementById("oblog_Composition").contentWindow;
	}
	if(IframeID !=null){ 
		//document.oblogform.edit.value=IframeID.document.body.innerHTML;
		//var tmptext=document.oblogform.edit.createTextRange(); 
		//tmptext.execCommand("Copy");
		var tmptext=IframeID.document.body.innerHTML;
		if (tmptext!=null) {
		window.clipboardData.setData("Text",tmptext);
		}
	}
	
	var ubbid=document.getElementById("ubbedit");
	if(ubbid != null){ 
		if (document.oblogform.ubbedit.value!=null) {
		var tmptext1=document.oblogform.ubbedit.createTextRange(); 
		tmptext1.execCommand("Copy");
		}
	}

}

function fSetBg(obj){
	//obj.style.backgroundColor = '#cccccc';
	if (IsIE5){
	obj.className='list_content_mouserover';
	}
}
function fReBg(obj){
	if (IsIE5){
		var objChildCheck = document.getElementById("list")? obj.children[0].children[0] : obj.childNodes[1].childNodes[1];
		if(objChildCheck.checked){
			return false;
		}
		//obj.style.backgroundColor = '';
		obj.className='list_content';
	}
}

function read_radio(rname){   
	var temp=document.getElementsByName(rname);
	for (i=0;i<temp.length;i++){
    if(temp[i].checked){
      return temp[i].value;
      }
 	}
}

function read_checkbox(rname){
	var str=''  
	var temp=document.getElementsByName(rname);
	for (i=0;i<temp.length;i++){
    if(temp[i].checked){
      if (str==''){str=temp[i].value}else{str=str+','+temp[i].value}
      }
 	}
	return str;
}

function doPostBack(pageNum){
	document.Form1.pageNum.value=pageNum;
	document.Form1.submit();
}


function sp(userid,state){
	$.ajax({
		// 提交数据的类型 POST GET
		type : "POST",
		// 提交的网址
		url : contextPath + "/member/sp.action",
		// 提交的数据
		data : {
			userid : userid,
			state : state,
		},
		// 返回数据的格式
		datatype : "text",// "xml", "html", "script", "json", "jsonp", "text".
		// 在请求之前调用的函数
		// beforeSend:function(){$("#msg").html("logining");},
		// 成功返回之后调用的函数
		success : function(data) {
			if(data=="1"){
//				window.location.reload();
				history.go(0);
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

function take(){
	if(capital<1000){
		alert("余额不够1000，未能提现！");
		return false;
	}
	if(confirm('确定申请提现吗！')){
		var pwd3 = document.Form1.pwd3.value;
		$.ajax({
			// 提交数据的类型 POST GET
			type : "POST",
			// 提交的网址
			url : contextPath + "/withdraw/take.action",
			// 提交的数据
			data : {
				pwd3 : pwd3,
			},
			// 返回数据的格式
			datatype : "text",// "xml", "html", "script", "json", "jsonp", "text".
			// 在请求之前调用的函数
			// beforeSend:function(){$("#msg").html("logining");},
			// 成功返回之后调用的函数
			success : function(data) {
				if(data=="1"){
					window.location.reload();
				}else if(data=="2"){
					alert("密码错误");
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
}


function txsp(id,state){
	var text = "确定审批提现吗！";
	if(state==2){
		text = "确定取消提现吗！";
	}
	if(confirm(text)){
		$.ajax({
			// 提交数据的类型 POST GET
			type : "POST",
			// 提交的网址
			url : contextPath + "/withdraw/sp.action",
			// 提交的数据
			data : {
				id : id,
				state : state,
			},
			// 返回数据的格式
			datatype : "text",// "xml", "html", "script", "json", "jsonp", "text".
			// 在请求之前调用的函数
			// beforeSend:function(){$("#msg").html("logining");},
			// 成功返回之后调用的函数
			success : function(data) {
				if(data=="1"){
					window.location.reload();
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
}

function cancel(id,state){
	if(confirm('请确定是否取消提现申请！')){
		$.ajax({
			// 提交数据的类型 POST GET
			type : "POST",
			// 提交的网址
			url : contextPath + "/withdraw/cancel.action",
			// 提交的数据
			data : {
				id : id,
				state : state,
			},
			// 返回数据的格式
			datatype : "text",// "xml", "html", "script", "json", "jsonp", "text".
			// 在请求之前调用的函数
			// beforeSend:function(){$("#msg").html("logining");},
			// 成功返回之后调用的函数
			success : function(data) {
				if(data=="1"){
					window.location.reload();
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
}
