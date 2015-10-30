package com.fmd.dao.Impl;

import org.springframework.stereotype.Repository;

import com.fmd.dao.UserDao;
import com.fmd.dao.Withdraw_logDao;
import com.fmd.entity.User;
import com.fmd.entity.Withdraw_log;

@Repository(value = "withdraw_logDao")  
public class Withdraw_logDaoImpl  extends BaseDaoImpl<Withdraw_log> implements Withdraw_logDao {  
	  
    /** 
     * 若CustomerDao 定义了BaseDAO没有的方法，则可以在这里实现 
     */  
}  	