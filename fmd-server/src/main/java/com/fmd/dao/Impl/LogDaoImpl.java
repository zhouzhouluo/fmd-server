package com.fmd.dao.Impl;

import org.springframework.stereotype.Repository;

import com.fmd.dao.LogDao;
import com.fmd.entity.Log;

@Repository(value = "logDao")  
public class LogDaoImpl  extends BaseDaoImpl<Log> implements LogDao {  
	  
    /** 
     * 若CustomerDao 定义了BaseDAO没有的方法，则可以在这里实现 
     */  
}  	