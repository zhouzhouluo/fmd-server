package com.fmd.dao;

import java.util.List;
import com.fmd.entity.Withdraw_log;

public interface Withdraw_logDao extends BaseDao<Withdraw_log> {  
  
    /** 
     * 若BaseDAO 没有定义的方法，可以在这里添加 
     */  
	List<Withdraw_log> queryWithdraw_log(String userid,int pagesize ,int from);
	int countWithdraw_log(String userid);
}
