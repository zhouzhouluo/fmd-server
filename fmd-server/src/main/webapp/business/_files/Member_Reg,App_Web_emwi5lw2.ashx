addNamespace("Member_Reg");
Member_Reg_class = Class.create();
Object.extend(Member_Reg_class.prototype, Object.extend(new AjaxPro.AjaxClass(), {
	IsExistUserName: function(username) {
		return this.invoke("IsExistUserName", {"username":username}, this.IsExistUserName.getArguments().slice(1));
	},
	SaveReg: function(TreePlace, uLevel, province, BankName, BankAddress, UserNo, FatherName, ReName, UserName, Password, UserPassword, UserPassword2, UserCode, UserAddress, UserPost, UserTel, BankCard, BankUserName, city, RegIP, Email, QQ, No99bill, StrID, StrNum, StrPrice, PayID, BdName, JlName, FaBankUserName, ReBankUserName, kd, Question, Answer, PV, Cash, TID) {
		return this.invoke("SaveReg", {"TreePlace":TreePlace, "uLevel":uLevel, "province":province, "BankName":BankName, "BankAddress":BankAddress, "UserNo":UserNo, "FatherName":FatherName, "ReName":ReName, "UserName":UserName, "Password":Password, "UserPassword":UserPassword, "UserPassword2":UserPassword2, "UserCode":UserCode, "UserAddress":UserAddress, "UserPost":UserPost, "UserTel":UserTel, "BankCard":BankCard, "BankUserName":BankUserName, "city":city, "RegIP":RegIP, "Email":Email, "QQ":QQ, "No99bill":No99bill, "StrID":StrID, "StrNum":StrNum, "StrPrice":StrPrice, "PayID":PayID, "BdName":BdName, "JlName":JlName, "FaBankUserName":FaBankUserName, "ReBankUserName":ReBankUserName, "kd":kd, "Question":Question, "Answer":Answer, "PV":PV, "Cash":Cash, "TID":TID}, this.SaveReg.getArguments().slice(37));
	},
	ChkUser: function(UserName) {
		return this.invoke("ChkUser", {"UserName":UserName}, this.ChkUser.getArguments().slice(1));
	},
	ChkRether: function(UserName, ReBankUserName) {
		return this.invoke("ChkRether", {"UserName":UserName, "ReBankUserName":ReBankUserName}, this.ChkRether.getArguments().slice(2));
	},
	ChkBdther: function(UserName, TID) {
		return this.invoke("ChkBdther", {"UserName":UserName, "TID":TID}, this.ChkBdther.getArguments().slice(2));
	},
	ChkJlther: function(UserName, TID) {
		return this.invoke("ChkJlther", {"UserName":UserName, "TID":TID}, this.ChkJlther.getArguments().slice(2));
	},
	ChkFather: function(UserName, FaBankUserName, TreePlace) {
		return this.invoke("ChkFather", {"UserName":UserName, "FaBankUserName":FaBankUserName, "TreePlace":TreePlace}, this.ChkFather.getArguments().slice(3));
	},
	initialize: function() {
		this.url = '/ajaxpro/Member_Reg,App_Web_emwi5lw2.ashx';
	}
}));
Member_Reg = new Member_Reg_class();

