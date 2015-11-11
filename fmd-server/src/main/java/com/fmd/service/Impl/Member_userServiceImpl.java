package com.fmd.service.Impl;

import java.util.List;

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
    public Member_user login(String userid) {
    	return	member_userDao.login(userid);
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
}  