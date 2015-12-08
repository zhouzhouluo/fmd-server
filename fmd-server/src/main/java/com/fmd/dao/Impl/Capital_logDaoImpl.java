package com.fmd.dao.Impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import com.fmd.dao.Capital_logDao;
import com.fmd.entity.Capital_log;

@Repository(value = "capital_logDao")  
public class Capital_logDaoImpl  extends BaseDaoImpl<Capital_log> implements Capital_logDao {

    /** 
     * 若CustomerDao 定义了BaseDAO没有的方法，则可以在这里实现 
     */  
	@Override
	public List<Capital_log> queryCapital_log(String userid,int pagesize ,int from) {
		Query query = getSession().createQuery("from Capital_log where member_id = '"+userid+"' order by Id desc");
		query.setFirstResult(from); 
		query.setMaxResults(pagesize); 
		List<Capital_log> capital_logs = query.list();      
		return capital_logs;
	}

	@Override
	public int countCapital_log(String userid) {
		Query query = getSession().createQuery("select count(0) from Capital_log where member_id = '"+userid+"'");
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public List<Map<String, String>> SumCapital_log(String userid) {
		Query query = getSession().createQuery("select sum(income) sum,operation from capital_log where member_id = '"+userid+"' group by operation");
		List<Map<String, String>> capital_logs = query.list();
		return capital_logs;
	}  
	
}  	