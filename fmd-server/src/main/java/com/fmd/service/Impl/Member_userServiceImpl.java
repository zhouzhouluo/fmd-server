package com.fmd.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.fmd.dao.BaseDao;
import com.fmd.dao.Member_userDao;
import com.fmd.entity.Member_user;
import com.fmd.entity.User;
import com.fmd.service.Member_userService;
import com.fmd.service.UserService;

@Service("member_userService")  
@Transactional  
public class Member_userServiceImpl extends BaseServiceImpl<Member_user> implements Member_userService {  
  
    /** 
     * 注入DAO 
     */  
    @Resource(name = "member_userDao")  
    public void setDao(BaseDao<Member_user> dao) {  
        super.setDao(dao);  
    }  
    @Resource(name = "member_userDao")  
    private Member_userDao member_userDao;
    /** 
     * 若CustomerService 定义了BaseService没有的方法，则可以在这里实现 
     */  
    @Override
    public Member_user getUserByUserId(String userid) {
    	return	member_userDao.getUserByUserId(userid);
	}
	@Override
	public String getMaxUserid() {
		String max = member_userDao.getMaxUserid();	
		max = String.valueOf(Integer.valueOf(max)+1);
		int l = max.length();
		for(int i=0;i<6-l;i++){
			max = "0"+max;
		}
		return max;
		
	}
	@Override
	public List<Member_user> queryMember_users(String userid,int pagesize ,int from) {
		return member_userDao.queryMember_users(userid,pagesize ,from);
	}
	@Override
	public int countMember_users(String userid) {
		return member_userDao.countMember_users(userid);
	}
	@Override
	public Map<Integer, Member_user> getTree(String userid) {
		Member_user member_user = member_userDao.getUserByUserId(userid);
		Map<Integer, Member_user> hashMap = new HashMap<Integer, Member_user>();
	 	int i=1;
        Queue<Member_user> q=new LinkedList<Member_user>();  
        q.add(member_user);
        hashMap.put(i,member_user);
        while(!q.isEmpty()){  
        	i++;
        	Member_user temp =  q.poll();  
            if(temp.getLeftid()!=null&&!"".equals(temp.getLeftid())){
            	member_user = member_userDao.getUserByUserId(temp.getLeftid());
            	if(member_user!=null){
            		hashMap.put(i,member_user);
                	q.add(member_user); 
            	}
            }
            i++;
            if(temp.getRightid()!=null&&!"".equals(temp.getRightid())){
            	member_user = member_userDao.getUserByUserId(temp.getRightid());
            	if(member_user!=null){
            		hashMap.put(i,member_user);
                	q.add(member_user); 
            	}
            }
            if(i>=15){
            	break;
            }
        } 
		return hashMap;
	}
	
	private void preOrderTraverse(String userid){
		System.out.println("userid："+userid);  
		Member_user member_user = member_userDao.getUserByUserId(userid);
		if(member_user!=null&&member_user.getLeftid()!=null&&!"".equals(member_user.getLeftid())){
			preOrderTraverse(member_user.getLeftid());
		}
		if(member_user!=null&&member_user.getRightid()!=null&&!"".equals(member_user.getRightid())){
			preOrderTraverse(member_user.getRightid());
		}
	} 
	
	@Override
	public int countTree(String userid) {
		// TODO Auto-generated method stub
		int h1, h2;
		int level;
		int count=1;
		Member_user member_user = member_userDao.getUserByUserId(userid);
		if (member_user == null) {
			level = 0;
		} else {
			h1 = countTree(member_user.getLeftid());
			h2 = countTree(member_user.getRightid());
			level = (h1 < h2) ? h2 + 1 : h1 + 1;
		}
		for(int i=1;i<=level;i++){
			count = count*2;
		}
		return count-1;
	}
	 
}  











