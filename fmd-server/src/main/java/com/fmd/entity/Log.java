package com.fmd.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 日志
 * @author Administrator
 *
 */
@Entity
@Table(name="log")
public class Log {
	@Id
    @GeneratedValue
	private int Id;
	private String user_id;
	private String user_name;
	private int type;
	private String detail;
	private Date  operation_time;
	private int state;
	private String ip;
	private String tablename;
	private String operation;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Date getOperation_time() {
		return operation_time;
	}
	public void setOperation_time(Date operation_time) {
		this.operation_time = operation_time;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	
	public Log clone(){
		Log _log = new Log();
		_log.setIp(this.getIp());
		_log.setOperation_time(this.getOperation_time());
		_log.setUser_id(this.getUser_id());
		_log.setUser_name(this.getUser_name());
		_log.setOperation_time(new Date());
		_log.setState(1);
		return _log;
	}
	
}
