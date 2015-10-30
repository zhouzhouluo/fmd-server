package com.fmd.service.Impl;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.fmd.dao.BaseDao;
import com.fmd.entity.Log;
import com.fmd.entity.User;
import com.fmd.service.LogService;
import com.fmd.service.UserService;

@Service("logService")  
@Transactional  
public class LogServiceImpl extends BaseServiceImpl<Log> implements LogService {  
  
    /** 
     * 注入DAO 
     */  
    @Resource(name = "logDao")  
    public void setDao(BaseDao<Log> dao) {  
        super.setDao(dao);  
    }  
  
    /** 
     * 若CustomerService 定义了BaseService没有的方法，则可以在这里实现 
     */  
  
}  