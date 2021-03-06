package com.fmd.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="member_user")
public class Member_user {
	@Id
    @GeneratedValue
	private int Id;
	private String userid;
	private String pwd1;
	private String pwd2;
	private String pwd3;
	private String referee;
	private String referee_id;
	private String node;
	private String node_id;
	private int area;
	private String receiv_address;
	private String zip_code;
	private String qq;
	private String phone_number;
	private String email;
	private String bank_name;
	private String account_name;
	private String account_address;
	private String account_node;
	private String account;
	private String capital;
	private String identity;
	private Date cjsj;
	private Date xgsj;
	private int cjr;
	private int xgr;
	private int state;
	private String leftid;
	private String rightid;
	private String withdraw;
	private String total;
	private int issend;
	private int lastleftcon;
	private int lastrightcon;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd1() {
		return pwd1;
	}
	public void setPwd1(String pwd1) {
		this.pwd1 = pwd1;
	}
	public String getPwd2() {
		return pwd2;
	}
	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}
	public String getPwd3() {
		return pwd3;
	}
	public void setPwd3(String pwd3) {
		this.pwd3 = pwd3;
	}
	public String getReferee() {
		return referee;
	}
	public void setReferee(String referee) {
		this.referee = referee;
	}
	public String getReferee_id() {
		return referee_id;
	}
	public void setReferee_id(String referee_id) {
		this.referee_id = referee_id;
	}
	public String getNode() {
		return node;
	}
	public void setNode(String node) {
		this.node = node;
	}
	public String getNode_id() {
		return node_id;
	}
	public void setNode_id(String node_id) {
		this.node_id = node_id;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public String getReceiv_address() {
		return receiv_address;
	}
	public void setReceiv_address(String receiv_address) {
		this.receiv_address = receiv_address;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	public String getAccount_address() {
		return account_address;
	}
	public void setAccount_address(String account_address) {
		this.account_address = account_address;
	}
	public String getAccount_node() {
		return account_node;
	}
	public void setAccount_node(String account_node) {
		this.account_node = account_node;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getCapital() {
		return capital;
	}
	public void setCapital(String capital) {
		this.capital = capital;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public Date getCjsj() {
		return cjsj;
	}
	public void setCjsj(Date cjsj) {
		this.cjsj = cjsj;
	}
	public Date getXgsj() {
		return xgsj;
	}
	public void setXgsj(Date xgsj) {
		this.xgsj = xgsj;
	}
	public int getCjr() {
		return cjr;
	}
	public void setCjr(int cjr) {
		this.cjr = cjr;
	}
	public int getXgr() {
		return xgr;
	}
	public void setXgr(int xgr) {
		this.xgr = xgr;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getLeftid() {
		return leftid;
	}
	public void setLeftid(String leftid) {
		this.leftid = leftid;
	}
	public String getRightid() {
		return rightid;
	}
	public void setRightid(String rightid) {
		this.rightid = rightid;
	}
	public String getWithdraw() {
		return withdraw;
	}
	public void setWithdraw(String withdraw) {
		this.withdraw = withdraw;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public int getIssend() {
		return issend;
	}
	public void setIssend(int issend) {
		this.issend = issend;
	}
	public int getLastleftcon() {
		return lastleftcon;
	}
	public void setLastleftcon(int lastleftcon) {
		this.lastleftcon = lastleftcon;
	}
	public int getLastrightcon() {
		return lastrightcon;
	}
	public void setLastrightcon(int lastrightcon) {
		this.lastrightcon = lastrightcon;
	}
	
}
