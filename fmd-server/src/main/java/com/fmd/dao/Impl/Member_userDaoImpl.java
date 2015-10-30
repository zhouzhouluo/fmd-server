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

	@Override
	public Member_user login(String userid) {
		// TODO Auto-generated method stub
		Query query = getSession().createQuery("from Member_user where userid = "+userid);
        List<Member_user> member_users = query.list();      
        if(member_users!=null&&member_users.size()>0){
        	return member_users.get(0);
        }  
		return null;
	}  
	  
    /** 
     * 若CustomerDao 定义了BaseDAO没有的方法，则可以在这里实现 
     */  
}  	