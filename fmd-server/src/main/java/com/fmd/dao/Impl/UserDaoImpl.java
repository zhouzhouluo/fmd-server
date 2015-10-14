package com.fmd.dao.Impl;

import org.springframework.stereotype.Repository;

import com.fmd.dao.UserDao;
import com.fmd.entity.User;

@Repository(value = "userDao")  
public class UserDaoImpl  extends BaseDaoImpl<User> implements UserDao {  
	  
    /** 
     * 若CustomerDao 定义了BaseDAO没有的方法，则可以在这里实现 
     */  
}  	