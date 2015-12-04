package com.fmd.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 个人资金记录表
 * @author Administrator
 *
 */
@Entity
@Table(name="capital_log")
public class Capital_log {
	@Id
    @GeneratedValue
	private int Id;
	private int number;
	private String member;
	private String member_id;
	private Date time;
	private int operation;
	private String detail;
	private String payout;
	private String income;
	private String remain;
	private int touch_pay;
	private int recommend_pay;
	private int see_paypoint_pay;
	private int state;
	private String total;
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
	public String getPayout() {
		return payout;
	}
	public void setPayout(String payout) {
		this.payout = payout;
	}
	public String getIncome() {
		return income;
	}
	public void setIncome(String income) {
		this.income = income;
	}
	public String getRemain() {
		return remain;
	}
	public void setRemain(String remain) {
		this.remain = remain;
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
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
}
