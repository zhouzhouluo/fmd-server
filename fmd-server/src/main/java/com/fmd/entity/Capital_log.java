package com.fmd.entity;

import java.util.Date;

/**
 * 个人资金记录表
 * @author luoyizhou
 *
 */
public class Capital_log {
	private int Id;
	private int number;
	private String member;
	private String member_id;
	private Date time;
	private int operation;
	private String detail;
	private Float payout;
	private Float income;
	private Float temain;
	private int touch_pay;
	private int recommend_pay;
	private int see_paypoint_pay;
	private int state;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getOperation() {
		return operation;
	}
	public void setOperation(int operation) {
		this.operation = operation;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Float getPayout() {
		return payout;
	}
	public void setPayout(Float payout) {
		this.payout = payout;
	}
	public Float getIncome() {
		return income;
	}
	public void setIncome(Float income) {
		this.income = income;
	}
	public Float getTemain() {
		return temain;
	}
	public void setTemain(Float temain) {
		this.temain = temain;
	}
	public int getTouch_pay() {
		return touch_pay;
	}
	public void setTouch_pay(int touch_pay) {
		this.touch_pay = touch_pay;
	}
	public int getRecommend_pay() {
		return recommend_pay;
	}
	public void setRecommend_pay(int recommend_pay) {
		this.recommend_pay = recommend_pay;
	}
	public int getSee_paypoint_pay() {
		return see_paypoint_pay;
	}
	public void setSee_paypoint_pay(int see_paypoint_pay) {
		this.see_paypoint_pay = see_paypoint_pay;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
}
