package com.fmd.dao;

import java.util.List;

import com.fmd.entity.Log;
import com.fmd.entity.Member_user;

public interface LogDao extends BaseDao<Log> {  
  
    /** 
     * 若BaseDAO 没有定义的方法，可以在这里添加 
     */  
	List<Log> queryLog(String userid,String startTime,String endTime,int pagesize,int from);
	int countLog(String userid,String startTime,String endTime);
}
