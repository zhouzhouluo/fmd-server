package com.fmd.service;

import java.util.List;
import java.util.Map;
import com.fmd.entity.Member_user;

public interface Member_userService extends BaseService<Member_user> {  
    /** 
     * 若BaseService 没有定义的方法，可以在这里添加 
     */  
	Member_user getUserByUserId(String userid);
	String getMaxUserid();
	List<Member_user> queryMember_users(String userid,int pagesize ,int from);
	int countMember_users(String userid);
	Map<Integer, Member_user> getTree(String userid);
	int countTree(String userid);
	List<Member_user> queryMember_Dsp(int state,int pagesize,int from);
	int countMember_Dsp(int state);
}  