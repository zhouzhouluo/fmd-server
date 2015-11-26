package com.fmd.service;

import java.util.List;

import com.fmd.entity.Withdraw_log;

public interface Withdraw_logService extends BaseService<Withdraw_log> {  
    /** 
     * 若BaseService 没有定义的方法，可以在这里添加 
     */  
	List<Withdraw_log> queryCapital_log(String userid, int pagesize, int from);
	int countCapital_log(String userid);
}  