package com.fmd.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.fmd.dao.Member_userDao;
import com.fmd.dao.UserDao;
import com.fmd.entity.Member_user;
import com.fmd.entity.User;

@Repository(value = "member_userDao")  
public class Member_userDaoImpl  extends BaseDaoImpl<Member_user> implements Member_userDao {
	/** 
     * 若CustomerDao 定义了BaseDAO没有的方法，则可以在这里实现 
     */
	
	@Override
	public Member_user getUserByUserId(String userid) {
		// TODO Auto-generated method stub
		Query query = getSession().createQuery("from Member_user where userid = '"+userid+"'");
		List<Member_user> member_users = query.list();      
        if(member_users!=null&&member_users.size()>0){
        	return member_users.get(0);
        }
		return null;
	}

	@Override
	public String getMaxUserid() {
		// TODO Auto-generated method stub
		Query query = getSession().createQuery("select max(userid) from Member_user");
		return query.uniqueResult().toString();
	}

	@Override
	public List<Member_user> queryMember_users(String userid,int pagesize ,int from) {
		String hql = "from Member_user where referee_id = '"+userid+"' order by userid desc";
		if("000001".equals(userid)){
			hql = "from Member_user order by userid desc";
		}
		Query query = getSession().createQuery(hql);
		query.setFirstResult(from); 
		query.setMaxResults(pagesize); 
		List<Member_user> member_users = query.list();      
		return member_users;
	}

	@Override
	public int countMember_users(String userid) {
		String hql = "select count(0) from Member_user where referee_id = '"+userid+"'";
		if("000001".equals(userid)){
			hql = "select count(0) from Member_user";
		}
		Query query = getSession().createQuery(hql);
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public List<Member_user> queryMember_Dsp(int state, int pagesize, int from) {
		Query query = getSession().createQuery("from Member_user where state = "+state);
		query.setFirstResult(from); 
		query.setMaxResults(pagesize); 
		List<Member_user> member_users = query.list();      
		return member_users;
	}

	@Override
	public int countMember_Dsp(int state) {
		Query query = getSession().createQuery("select count(0) from Member_user where state = "+state);
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public String getNodeList(String userid,int state) {
		Query query = getSession().createSQLQuery("select  getChildList('"+userid+"')");
		return query.uniqueResult().toString();
	}
	@Override
	public int getNodeRealCont(String userid,int state) {
		Query query = getSession().createSQLQuery("select  getChildListReal('"+userid+"')");
		String nodes = query.uniqueResult().toString();
		String nodelist[] = nodes.split(",");
		if(nodelist.length==2){
			Query query2 = getSession().createQuery("select count(0) from Member_user where userid = '"+userid+"' and state = "+state);
			return Integer.parseInt(query2.uniqueResult().toString());
		}
		return nodelist.length-1;
	}
	@Override
	public List<Member_user> queryMember_Send(int isSend, int pagesize, int from) {
		String sql= "from Member_user";
		if(isSend != 99){
			sql = sql+" where issend = "+isSend;
		}
		Query query = getSession().createQuery(sql);
		query.setFirstResult(from); 
		query.setMaxResults(pagesize); 
		List<Member_user> member_users = query.list();      
		return member_users;
	}

	@Override
	public int countMember_Send(int isSend) {
		String sql= "select count(0) from Member_user";
		if(isSend != 99){
			sql = sql+" where issend = "+isSend;
		}
		Query query = getSession().createQuery(sql);
		return Integer.parseInt(query.uniqueResult().toString());
	}  
	
}  	