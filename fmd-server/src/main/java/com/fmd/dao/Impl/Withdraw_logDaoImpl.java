package com.fmd.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import com.fmd.dao.Withdraw_logDao;
import com.fmd.entity.Withdraw_log;

@Repository(value = "withdraw_logDao")  
public class Withdraw_logDaoImpl  extends BaseDaoImpl<Withdraw_log> implements Withdraw_logDao {

    /** 
     * 若CustomerDao 定义了BaseDAO没有的方法，则可以在这里实现 
     */
	
	@Override
	public List<Withdraw_log> queryWithdraw_log(String userid, int pagesize, int from) {
		Query query = getSession().createQuery("from Withdraw_log where member_id = "+userid+" order by Id desc");
		query.setFirstResult(from); 
		query.setMaxResults(pagesize); 
		List<Withdraw_log> withdraw_logs = query.list();      
		return withdraw_logs;
	}

	@Override
	public int countWithdraw_log(String userid) {
		Query query = getSession().createQuery("select count(0) from Withdraw_log where member_id = "+userid);
		return Integer.parseInt(query.uniqueResult().toString());
	} 
}  	