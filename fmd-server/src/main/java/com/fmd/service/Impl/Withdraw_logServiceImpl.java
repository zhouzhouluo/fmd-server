package com.fmd.service.Impl;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.fmd.dao.BaseDao;
import com.fmd.entity.User;
import com.fmd.entity.Withdraw_log;
import com.fmd.service.UserService;
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
  
    /** 
     * 若CustomerService 定义了BaseService没有的方法，则可以在这里实现 
     */  
  
}  