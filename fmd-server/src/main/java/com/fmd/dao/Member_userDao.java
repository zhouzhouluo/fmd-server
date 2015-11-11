package com.fmd.dao;

import java.util.List;

import com.fmd.entity.Member_user;
import com.fmd.entity.User;

public interface Member_userDao extends BaseDao<Member_user> {  
  
    /** 
     * 若BaseDAO 没有定义的方法，可以在这里添加 
     */  
	Member_user login(String userid);
	String getMaxUserid();
	List<Member_user> queryMember_users(String userid,int pagesize,int from);
	int countMember_users(String userid);
}