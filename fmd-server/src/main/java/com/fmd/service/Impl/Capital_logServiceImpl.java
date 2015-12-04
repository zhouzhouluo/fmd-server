package com.fmd.service.Impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.omg.CORBA.INTERNAL;
import org.springframework.stereotype.Service;

import com.fmd.dao.BaseDao;
import com.fmd.dao.Capital_logDao;
import com.fmd.dao.LogDao;
import com.fmd.dao.Member_userDao;
import com.fmd.entity.Capital_log;
import com.fmd.entity.Log;
import com.fmd.entity.Member_user;
import com.fmd.entity.User;
import com.fmd.service.Capital_logService;
import com.fmd.service.UserService;
import com.fmd.util.utils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Service("capital_logService")  
@Transactional  
public class Capital_logServiceImpl extends BaseServiceImpl<Capital_log> implements Capital_logService {  
	private Gson gson = new GsonBuilder().create();
    /** 
     * 注入DAO 
     */  
    @Resource(name = "capital_logDao")  
    public void setDao(BaseDao<Capital_log> dao) {  
        super.setDao(dao);  
    }
    @Resource(name = "member_userDao")  
    private Member_userDao member_userDao;
    
    @Resource(name = "capital_logDao")
    private Capital_logDao capital_logDao;
    
    @Resource(name = "logDao")
    private LogDao logDao;
    
    /** 
     * 若CustomerService 定义了BaseService没有的方法，则可以在这里实现 
     */
    
    
    /**
     *管理奖 
     */
    @Override
	public void managerCapital(Log log,Member_user member_user) {
    	Member_user p_user = member_user;
    	if(p_user.getNode_id()!=null){
			
		}
    	for(;;){
    		p_user = member_userDao.getUserByUserId(p_user.getNode_id());
    		if(p_user==null||p_user.getNode_id()==null||"".equals(p_user.getNode_id())){
    			break;
    		}
        	String nodes = member_userDao.getNodeList(p_user.getUserid());
        	String nodelist[] = nodes.split(",");
        	if(nCF2(nodelist.length)){
        		String capital = (p_user.getCapital()!=null&&!"".equals(p_user.getCapital()))?p_user.getCapital():"0";
        		capital = String.valueOf(Integer.parseInt(capital)+utils.TOUCH_PAY);
        		p_user.setCapital(capital);
        		String total = (p_user.getTotal()!=null&&!"".equals(p_user.getTotal()))?p_user.getTotal():"0";
        		total = String.valueOf(Integer.parseInt(total)+utils.TOUCH_PAY);
        		p_user.setTotal(total);
        		Capital_log capital_log = new Capital_log();
        		capital_log.setNumber(p_user.getId());
        		capital_log.setIncome(""+utils.TOUCH_PAY);
        		capital_log.setTouch_pay(utils.TOUCH_PAY);
        		capital_log.setDetail("管理奖收入"+utils.TOUCH_PAY+"元");
        		capital_log.setMember(p_user.getAccount_name());
        		capital_log.setMember_id(""+p_user.getUserid());
        		capital_log.setOperation(2);
        		capital_log.setState(1);
        		capital_log.setRemain(capital);
        		capital_log.setTotal(total);
        		capital_log.setTime(new Date());
        		save(capital_log);
        		Log _log = log.clone();
        		_log.setOperation_time(new Date());
        		_log.setType(LogServiceImpl.TYPE_CREATE);
        		_log.setDetail(gson.toJson(capital_log));
        		_log.setTablename("capital_log");
        		_log.setOperation(p_user.getUserid()+"管理奖收入"+utils.TOUCH_PAY+"元");
        		logDao.save(_log);
        		member_userDao.update(p_user);
        		_log = log.clone();
        		_log.setType(LogServiceImpl.TYPE_UPDATE);
        		_log.setDetail(gson.toJson(p_user));
        		_log.setTablename("member_user");
        		_log.setOperation(p_user.getUserid()+"更新余额为"+p_user.getCapital());
        		logDao.save(_log);
        	}else{
        		break;
        	}
    	}
	}

    /**
     * 推荐奖
     */
	@Override
	public void refereeCapital(Log log,Member_user member_user) {
		Member_user referee_user = member_userDao.getUserByUserId(member_user.getReferee_id());
		String capital = (referee_user.getCapital()!=null&&!"".equals(referee_user.getCapital()))?referee_user.getCapital():"0";
		capital = String.valueOf(Integer.parseInt(capital)+utils.RECOMMEND_PAY);
		referee_user.setCapital(capital);
		String total = (referee_user.getTotal()!=null&&!"".equals(referee_user.getTotal()))?referee_user.getTotal():"0";
		total = String.valueOf(Integer.parseInt(total)+utils.RECOMMEND_PAY);
		referee_user.setTotal(total);
		Capital_log capital_log = new Capital_log();
		capital_log.setNumber(referee_user.getId());
		capital_log.setIncome(""+utils.RECOMMEND_PAY);
		capital_log.setRecommend_pay(utils.RECOMMEND_PAY);
		capital_log.setDetail("直接推荐奖收入"+utils.RECOMMEND_PAY+"元");
		capital_log.setMember(referee_user.getAccount_name());
		capital_log.setMember_id(""+referee_user.getUserid());
		capital_log.setOperation(1);
		capital_log.setState(1);
		capital_log.setRemain(capital);
		capital_log.setTotal(total);
		capital_log.setTime(new Date());
		save(capital_log);
		Log _log = log.clone();
		_log.setOperation_time(new Date());
		_log.setType(LogServiceImpl.TYPE_CREATE);
		_log.setDetail(gson.toJson(capital_log));
		_log.setTablename("capital_log");
		_log.setOperation(referee_user.getUserid()+"直接推荐奖收入"+utils.RECOMMEND_PAY+"元");
		logDao.save(_log);
		member_userDao.update(referee_user);
		_log = log.clone();
		_log.setType(LogServiceImpl.TYPE_UPDATE);
		_log.setDetail(gson.toJson(referee_user));
		_log.setTablename("member_user");
		_log.setOperation(referee_user.getUserid()+"更新余额为"+referee_user.getCapital());
		logDao.save(_log);
	}

	/**
	 * 见点奖
	 */
	@Override
	public void codeCaptital(Log log,Member_user member_user) {
		for(int i=0;i<15;i++){
			if(member_user.getNode_id()==null||"".equals(member_user.getNode_id())){
				break;
			}
			member_user = member_userDao.getUserByUserId(member_user.getNode_id());
			if(member_user==null){
				break;
			}
			String capital = (member_user.getCapital()!=null&&!"".equals(member_user.getCapital()))?member_user.getCapital():"0";
			capital = String.valueOf(Integer.parseInt(capital)+utils.SEE_PAYPOINT_PAY);
			member_user.setCapital(capital);
			String total = (member_user.getTotal()!=null&&!"".equals(member_user.getTotal()))?member_user.getTotal():"0";
    		total = String.valueOf(Integer.parseInt(total)+utils.SEE_PAYPOINT_PAY);
    		member_user.setTotal(total);
			Capital_log capital_log = new Capital_log();
			capital_log.setNumber(member_user.getId());
			capital_log.setIncome(""+utils.SEE_PAYPOINT_PAY);
			capital_log.setSee_paypoint_pay(utils.SEE_PAYPOINT_PAY);
			capital_log.setDetail("见点奖收入"+utils.SEE_PAYPOINT_PAY+"元");
			capital_log.setMember(member_user.getAccount_name());
			capital_log.setMember_id(""+member_user.getUserid());
			capital_log.setOperation(3);
			capital_log.setState(1);
			capital_log.setRemain(capital);
			capital_log.setTotal(total);
			capital_log.setTime(new Date());
			save(capital_log);
			Log _log = log.clone();
			_log.setOperation_time(new Date());
			_log.setType(LogServiceImpl.TYPE_CREATE);
			_log.setDetail(gson.toJson(capital_log));
			_log.setTablename("capital_log");
			_log.setOperation(member_user.getUserid()+"见点奖收入"+utils.SEE_PAYPOINT_PAY+"元");
			logDao.save(_log);
			member_userDao.update(member_user);
			_log = log.clone();
			_log.setType(LogServiceImpl.TYPE_UPDATE);
			_log.setDetail(gson.toJson(member_user));
			_log.setTablename("member_user");
			_log.setOperation(member_user.getUserid()+"更新余额为"+member_user.getCapital());
			logDao.save(_log);
		}
	}
	
	/**
	 * 判断是否2的那次方
	 * @param n
	 * @return
	 */
	public boolean nCF2(int n){  
	    boolean b = false;  
	    int x = 2;  
	    while(true){  
	        if(x==n){  
	            b=true;  
	            break;  
	        }if(x<n){  
	            x=2*x;  
	        }else{  
	            b=false;  
	            break;  
	        }  
	    }  
	    return b;  
	}

	@Override
	public List<Capital_log> queryCapital_log(String userid, int pagesize, int from) {
		return capital_logDao.queryCapital_log(userid, pagesize, from);
	}

	@Override
	public int countCapital_log(String userid) {
		return capital_logDao.countCapital_log(userid);
	}
	
	
}  