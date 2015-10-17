package com.fmd.dao.Impl;

import org.springframework.stereotype.Repository;

import com.fmd.dao.Capital_logDao;
import com.fmd.entity.Capital_log;

@Repository(value = "capital_logDao")  
public class Capital_logDaoImpl  extends BaseDaoImpl<Capital_log> implements Capital_logDao {  
	  
    /** 
     * 若CustomerDao 定义了BaseDAO没有的方法，则可以在这里实现 
     */  
}  	