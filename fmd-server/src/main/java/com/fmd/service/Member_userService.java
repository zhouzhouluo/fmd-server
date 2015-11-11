package com.fmd.service;

import java.util.List;

import javax.persistence.criteria.From;

import com.fmd.entity.Member_user;

public interface Member_userService extends BaseService<Member_user> {  
    /** 
     * 若BaseService 没有定义的方法，可以在这里添加 
     */  
	Member_user login(String userid);
	String getMaxUserid();
	List<Member_user> queryMember_users(String userid,int pagesize ,int from);
	int countMember_users(String userid);
}  