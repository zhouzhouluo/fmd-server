package com.fmd.service.Impl;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.fmd.dao.BaseDao;
import com.fmd.entity.Capital_log;
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
  
    /** 
     * 若CustomerService 定义了BaseService没有的方法，则可以在这里实现 
     */  
  
}  