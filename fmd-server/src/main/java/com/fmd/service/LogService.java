package com.fmd.service;

import java.util.List;

import javax.xml.soap.Detail;

import com.fasterxml.jackson.annotation.JsonSubTypes.Type;
import com.fmd.entity.Log;

public interface LogService extends BaseService<Log> {  
    /** 
     * 若BaseService 没有定义的方法，可以在这里添加 
     */  
	public final static int TYPE_CREATE = 1;
	public final static int TYPE_DELETE = 2;
	public final static int TYPE_UPDATE = 3;
	public final static int TYPE_SELECT = 4;
	public final static int TYPE_LOGIN = 5;
	public final static int TYPE_CHANGEPWD = 6;
	public final static int TYPE_LOGINPWD2 = 7;
	void saveLog(String userid,String username,int type,String detail,String ip,String table,String operation);
	List<Log> queryLog(String userid,String startTime,String endTime,int pagesize,int from);
	int countLog(String userid,String startTime,String endTime);
}  