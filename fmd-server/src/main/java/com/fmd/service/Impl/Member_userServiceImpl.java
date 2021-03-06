package com.fmd.service.Impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
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
     * 
     * @param userid
     */
	public void updateMember_user(String userid) {
		String updateL = "update member_user set leftid = ''  where leftid ='"+userid+"'";
		String updateR = "update member_user set rightid = '' where rightid ='"+userid+"'";
		member_userDao.updateMember_user(updateL);
		member_userDao.updateMember_user(updateR);
	}
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
		Member_user member_user1;
		Member_user member_user2;
		Member_user member_user3;
		Member_user member_user4;
		Member_user member_user5;
		Member_user member_user6;
		Member_user member_user7;
		
		Member_user member_user = member_userDao.getUserByUserId(userid);
		Map<Integer, Member_user> map = new HashMap<Integer, Member_user>();
		if(member_user!=null){
			map.put(1, member_user);
			if(member_user.getLeftid()!=null){
				member_user = member_userDao.getUserByUserId(member_user.getLeftid());
				if(member_user.getLeftid()!=null){
					map.put(2, member_user);
				}
			}
			if(member_user.getRightid()!=null){
				member_user = member_userDao.getUserByUserId(member_user.getLeftid());
				if(member_user.getLeftid()!=null){
					map.put(3, member_user);
				}
			}
		}
		return map;
	}
	
	private void preOrderTraverse(String userid){
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
	@Override
	public List<Member_user> queryMember_Dsp(int state, int pagesize, int from) {
		return member_userDao.queryMember_Dsp(state,pagesize ,from);
	}
	@Override
	public int countMember_Dsp(int state) {
		return member_userDao.countMember_Dsp(state);
	}
	
	/**
	 * 获取子数目
	 */
	@Override
	public int countChildList(String userid,int state) {
		if(userid==null||"".equals(userid)){
			return 0;
		}
		String nodes = member_userDao.getNodeList(userid,state);
		String nodelist[] = nodes.split(",");
		return nodelist.length-1;
	}
	/**
	 * 获取99的子数目
	 */
	@Override
	public int countChildList(String userid) {
		return countChildList(userid,99);
	}
	@Override
	public List<Member_user> queryMember_Send(int isSend, int pagesize, int from) {
		return member_userDao.queryMember_Send(isSend,pagesize ,from);
	}
	@Override
	public int countMember_Send(int isSend) {
		return member_userDao.countMember_Send(isSend);
	}
	/**
	 * 更新子数目
	 */
	@Override
	public void updateChildCon(Member_user member_user) {
		Member_user p_user = member_user;
		for(;;){
			p_user = member_userDao.getUserByUserId(p_user.getNode_id());
			boolean isupdate =false;
			if(p_user.getLastleftcon()==0&&p_user.getLeftid()!=null&&!"".equals(p_user.getLeftid())){
				int leftcount = member_userDao.getNodeRealCont(p_user.getLeftid(),1);
				if(leftcount!=0){
					p_user.setLastleftcon(leftcount);
					isupdate=true;
				}
			}
			if(p_user.getLastrightcon()==0&&p_user.getRightid()!=null&&!"".equals(p_user.getRightid())){
				int rightcount = member_userDao.getNodeRealCont(p_user.getRightid(),1);
				if(rightcount!=0){
					p_user.setLastrightcon(rightcount);
					isupdate=true; 
				}
			}
			if(isupdate){
				p_user.setXgsj(new Date());
				member_userDao.update(p_user);
			}
			if(p_user.getNode_id()==null||"0".equals(p_user.getNode_id())){
				break;
			}
		}
	}
	
}  











