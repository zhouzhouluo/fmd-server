package com.fmd.service.Impl;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.fmd.dao.BaseDao;
import com.fmd.dao.Member_userDao;
import com.fmd.entity.Capital_log;
import com.fmd.entity.Member_user;
import com.fmd.entity.User;
import com.fmd.service.Capital_logService;
import com.fmd.service.UserService;

@Service("capital_logService")  
@Transactional  
public class Capital_logServiceImpl extends BaseServiceImpl<Capital_log> implements Capital_logService {  
  
    /** 
     * 注入DAO 
     */  
    @Resource(name = "capital_logDao")  
    public void setDao(BaseDao<Capital_log> dao) {  
        super.setDao(dao);  
    }
    @Resource(name = "member_userDao")  
    private Member_userDao member_userDao;
    /** 
     * 若CustomerService 定义了BaseService没有的方法，则可以在这里实现 
     */  
    
    @Override
	public void managerCapital(Member_user member_user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void refereeCapital(Member_user member_user) {
		Member_user referee_user = member_userDao.getUserByUserId(member_user.getReferee_id());
		String capital = (referee_user.getCapital()!=null||!"".equals(referee_user.getCapital()))?referee_user.getCapital():"0";
		capital = String.valueOf(Integer.parseInt(capital)+200);
		referee_user.setCapital(capital);
		member_userDao.update(referee_user);
		Capital_log capital_log = new Capital_log();
		capital_log.setIncome(""+200);
		capital_log.setRecommend_pay(200);
		capital_log.setDetail("直接推荐奖收入200元");
		capital_log.setMember(referee_user.getAccount_name());
		capital_log.setMember_id(referee_user.getUserid());
		capital_log.setOperation(1);
		capital_log.setState(1);
		capital_log.setRemain(capital);
		save(capital_log);
	}

	@Override
	public void codeCaptital(Member_user member_user) {
		for(int i=0;i<15;i++){
			if(member_user.getReferee_id()==null||"".equals(member_user.getReferee_id())){
				break;
			}
			member_user = member_userDao.getUserByUserId(member_user.getReferee_id());
			String capital = (member_user.getCapital()!=null||!"".equals(member_user.getCapital()))?member_user.getCapital():"0";
			capital = String.valueOf(Integer.parseInt(capital)+200);
			member_user.setCapital(capital);
			member_userDao.update(member_user);
			Capital_log capital_log = new Capital_log();
			capital_log.setIncome(""+2);
			capital_log.setRecommend_pay(2);
			capital_log.setDetail("见点奖收入2元");
			capital_log.setMember(member_user.getAccount_name());
			capital_log.setMember_id(member_user.getUserid());
			capital_log.setOperation(3);
			capital_log.setState(1);
			capital_log.setRemain(capital);
			save(capital_log);
		}
		
	} 
}  