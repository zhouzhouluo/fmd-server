package com.fmd.dao.Impl;

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
}  	