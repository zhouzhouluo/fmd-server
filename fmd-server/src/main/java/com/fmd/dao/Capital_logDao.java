package com.fmd.dao;

import java.util.List;
import java.util.Map;

import com.fmd.entity.Capital_log;

public interface Capital_logDao extends BaseDao<Capital_log> {  
  
    /** 
     * 若BaseDAO 没有定义的方法，可以在这里添加 
     */  
	List<Capital_log> queryCapital_log(String userid,int pagesize ,int from);
	int countCapital_log(String userid);
	List<Map<String, String>> SumCapital_log(String userid);
}
