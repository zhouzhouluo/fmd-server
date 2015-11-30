package com.fmd.service;

import java.util.List;

import com.fmd.entity.Capital_log;
import com.fmd.entity.Log;
import com.fmd.entity.Member_user;

public interface Capital_logService extends BaseService<Capital_log> {  
    /** 
     * 若BaseService 没有定义的方法，可以在这里添加 
     */  
	void refereeCapital(Log log,Member_user member_user);
	void managerCapital(Log log,Member_user member_user);
	void codeCaptital(Log log,Member_user member_user);
	List<Capital_log> queryCapital_log(String userid,int pagesize ,int from);
	int countCapital_log(String userid);
}  