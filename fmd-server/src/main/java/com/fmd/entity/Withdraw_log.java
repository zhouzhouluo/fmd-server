package com.fmd.entity;

import java.util.Date;

public class Withdraw_log {
	int Id;
	int number;
	String member;
	int member_id;
	Date apply_time;
	int operation;
	String detail;
	float capital;
	float tax;
	float take;
	Date approve_time;
	String approve;
	int approve_id;
	int state;
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
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public Date getApply_time() {
		return apply_time;
	}
	public void setApply_time(Date apply_time) {
		this.apply_time = apply_time;
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
	public float getCapital() {
		return capital;
	}
	public void setCapital(float capital) {
		this.capital = capital;
	}
	public float getTax() {
		return tax;
	}
	public void setTax(float tax) {
		this.tax = tax;
	}
	public float getTake() {
		return take;
	}
	public void setTake(float take) {
		this.take = take;
	}
	public Date getApprove_time() {
		return approve_time;
	}
	public void setApprove_time(Date approve_time) {
		this.approve_time = approve_time;
	}
	public String getApprove() {
		return approve;
	}
	public void setApprove(String approve) {
		this.approve = approve;
	}
	public int getApprove_id() {
		return approve_id;
	}
	public void setApprove_id(int approve_id) {
		this.approve_id = approve_id;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
}
