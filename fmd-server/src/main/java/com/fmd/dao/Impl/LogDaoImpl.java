package com.fmd.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.fmd.dao.LogDao;
import com.fmd.entity.Log;

@Repository(value = "logDao")  
public class LogDaoImpl  extends BaseDaoImpl<Log> implements LogDao {

    /** 
     * 若CustomerDao 定义了BaseDAO没有的方法，则可以在这里实现 
     */  
	@Override
	public List<Log> queryLog(String userid,String startTime, String endTime, int pagesize, int from) {
		String hql = "from Log where state = 1 ";
		if(userid!=null&&!"".equals(userid)){
			hql=hql+" and user_id='"+userid+"'";
		}
		if(startTime!=null&&!"".equals(startTime)){
			hql=hql+" and operation_time>'"+startTime+"'";
		}
		if(endTime!=null&&!"".equals(endTime)){
			hql=hql+" and operation_time<'"+endTime+"'";
		}
		hql=hql+" order by Id desc";
		Query query = getSession().createQuery(hql);
		query.setFirstResult(from); 
		query.setMaxResults(pagesize); 
		List<Log> logs = query.list();
		return logs;
	}

	@Override
	public int countLog(String userid,String startTime, String endTime) {
		String hql = "select count(0) from Log where state = 1 ";
		if(userid!=null&&!"".equals(userid)){
			hql=hql+" and user_id='"+userid+"'";
		}
		if(startTime!=null&&!"".equals(startTime)){
			hql=hql+" and operation_time>'"+startTime+"'";
		}
		if(endTime!=null&&!"".equals(endTime)){
			hql=hql+" and operation_time<'"+endTime+"'";
		}
		Query query = getSession().createQuery(hql);
		return Integer.parseInt(query.uniqueResult().toString());
	}
}  	