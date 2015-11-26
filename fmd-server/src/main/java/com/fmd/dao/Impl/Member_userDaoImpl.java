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
		Query query = getSession().createQuery("from Member_user where userid = "+userid);
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
		Query query = getSession().createQuery("from Member_user where referee_id = "+userid);
		query.setFirstResult(from); 
		query.setMaxResults(pagesize); 
		List<Member_user> member_users = query.list();      
		return member_users;
	}

	@Override
	public int countMember_users(String userid) {
		Query query = getSession().createQuery("select count(0) from Member_user where referee_id = "+userid);
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
	public String getNodeList(String userid) {
		Query query = getSession().createSQLQuery("select  getChildList('"+userid+"')");
		return query.uniqueResult().toString();
	}  
}  	