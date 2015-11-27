package com.fmd.service.Impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.fmd.dao.BaseDao;
import com.fmd.dao.Capital_logDao;
import com.fmd.dao.Withdraw_logDao;
import com.fmd.entity.Capital_log;
import com.fmd.entity.User;
import com.fmd.entity.Withdraw_log;
import com.fmd.service.Withdraw_logService;

@Service("withdraw_logService")  
@Transactional  
public class Withdraw_logServiceImpl extends BaseServiceImpl<Withdraw_log> implements Withdraw_logService {  
  
    /** 
     * 注入DAO 
     */  
    @Resource(name = "withdraw_logDao")  
    public void setDao(BaseDao<Withdraw_log> dao) {  
        super.setDao(dao);  
    }  
    @Resource(name = "withdraw_logDao")
    private Withdraw_logDao withdraw_logDao;
    /** 
     * 若CustomerService 定义了BaseService没有的方法，则可以在这里实现 
     */  
    @Override
	public List<Withdraw_log> queryWithdraw_log(String userid, int pagesize, int from) {
		return withdraw_logDao.queryWithdraw_log(userid, pagesize, from);
	}

	@Override
	public int countWithdraw_log(String userid) {
		return withdraw_logDao.countWithdraw_log(userid);
	}

	@Override
	public List<Withdraw_log> queryWithdraw_log_dsp(int state, int pagesize, int from) {
		return withdraw_logDao.queryWithdraw_log_dsp(state, pagesize, from);
	}

	@Override
	public int countWithdraw_log_dsp(int state) {
		return withdraw_logDao.countWithdraw_log_dsp(state);
	}
	
}  