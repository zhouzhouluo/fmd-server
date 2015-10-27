function GetStr(Num,LanguageType)
{
    //alert(ArrProPrice[2][1]+'|'+Num+'--'+1);
	//document.getElementById('ProStr').innerHTML='';
    var StrTitle = new Array("选择", "&nbsp;", "进货价", "pv", "数量");
	var Str='';
	Str +='                        <table border=0 cellpadding=0 cellspacing=0 width=\"100%\">';
	Str +='                            <tr>';
	Str +='                                <td><strong>'+StrTitle[0]+'</strong></td>'+ "\r\n";
	Str +='                                <td><strong>'+StrTitle[1]+'</strong></td>'+ "\r\n";
	Str +='                                <td><strong>'+StrTitle[2]+'</strong></td>'+ "\r\n";
	Str += '                                <td><strong>' + StrTitle[3] + '</strong></td>' + "\r\n";
	Str += '                                <td><strong>' + StrTitle[4] + '</strong></td>' + "\r\n";
	Str += '                           </tr>' + "\r\n";
	for (var i=1;i<ArrProName.length;i++)
	{
		Str +='                        <tr>';
		Str +='                             <td><INPUT id=\"chkSelect\" name=\"chkSelect\" onClick=\"ExtTr();\" value=\"'+ArrProID[i]+'\" type=\"checkbox\"></td>'+ "\r\n";
		Str +='                             <td>'+ArrProName[i]+'</td>'+ "\r\n";
		Str += '                             <td>' + ArrProPrice[i][2] + '<input  id=\"ProPriceo' + i + '\" name=\"ProPriceo' + i + '\" value=\"' + ArrProPrice[i][2] + '\" type="hidden" /></td>' + "\r\n";
        
        Str += '                             <td>' + ArrProPrice[i][Num] + '<input  id=\"ProPrice' + i + '\" name=\"ProPrice' + i + '\" value=\"' + ArrProPrice[i][Num] + '\" type="hidden" /></td>' + "\r\n";
		Str +='                             <td><input name=\"pnum'+i+'\" id=\"pnum'+i+'\"  width=\"30\" onblur=\"ExtTr();\" onfocus=\"ExtTr();\" Style=\"Solid\" border=\"1px\" type=\"text\" value=\"1\" /></td>'+ "\r\n";
		Str +='                        </tr>'+ "\r\n";
	}
	Str +='                           </table>'+ "\r\n";
	document.getElementById('ProStr').innerHTML=Str; 
	SelectedStrID();
	//document.getElementById('ProStr').innerHTML='111'; 
	//document.write(Str);
	//alert(Str);
}
function SelectedStrID()
{
    var Objchk=document.getElementsByName('chkSelect');
	var StrID=document.getElementById('txtStrID').value;
	var ArrStr=StrID.split(",");
	var StrNum=document.getElementById('StrNum').value;
	var ArrNum=StrNum.split(",");
	for (var i=0;i<Objchk.length;i++) 
	{
	    num=i+1;
		var e=Objchk[i];
		for (var j=0;j<ArrStr.length;j++) 
		{
		  if(e.value==ArrStr[j])
		  {
		     e.checked=true;
			 document.getElementById('pnum'+num).value=ArrNum[j];
		  }
		}
	}
    ExtTr();
}
//GetStr(1);
function ExtTr()
{

	//var AllNum=document.form1.chkSelect.length;
	var Objchk=document.getElementsByName('chkSelect');
	var AllNum=Objchk.length;
	var Price = new Array(AllNum);
	var Priceo = new Array(AllNum);
	var ProNum=new Array(AllNum);
	var StrID=new Array(AllNum);
	var StrPrice='';
	var AllPrice = 0;
	var AllPV = 0;
	var StrID='';
	var StrNum='';
	for (var i=0;i<AllNum;i++) 
	{
		var num=i+1;
		//var e=document.form1.chkSelect[i];
		var e=document.getElementsByName("chkSelect")[i];
		if(e.checked) {

		   //Price[num]=document.getElementById('Price'+num).value;
		   //ProNum[num]=document.getElementById('Repeater1__ctl'+num+'_txtNum').value;
		    Price[num] = document.getElementById('ProPrice' + num).value;
		    Priceo[num] = document.getElementById('ProPriceo' + num).value;
		   ProNum[num]=document.getElementById('pnum'+num).value;
		   //alert(ProNum[num]);
		   if(ProNum[num]>0)
		   {
		       AllPV += Price[num] * ProNum[num];
		       AllPrice += Priceo[num] * ProNum[num];
		       
			   StrID  +=e.value+',';
			   StrNum +=ProNum[num]+',';
			   StrPrice +=Priceo[num]+',';
		   }
		 }
	}
	if (StrID.length > 0)
	{
	    //alert(StrID);
		StrID = StrID.substring(0, StrID.length - 1);
	}
	if (StrNum.length > 0)
	{
	    //alert(StrID);
		StrNum = StrNum.substring(0, StrNum.length - 1);
		//alert(StrID);
	}
	if (StrPrice.length > 0)
	{
	    //alert(StrID);
		StrPrice = StrPrice.substring(0, StrPrice.length - 1);
		//alert(StrID);
	}
	//alert(AllPrice);
	document.getElementById('StrNum').value=StrNum;
	document.getElementById('StrPrice').value=StrPrice;
	document.getElementById('txtStrID').value=StrID;
	document.getElementById('txtCash').value = AllPrice;
	document.getElementById('txtPV').value = AllPV;
	
	document.getElementById('cash').className="d_ok";
	document.getElementById('cash').innerHTML = 'PV：' + AllPV + ''; 
	   
}