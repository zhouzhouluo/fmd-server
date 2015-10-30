package com.fmd.service.Impl;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import com.fmd.dao.BaseDao;
import com.fmd.entity.User;
import com.fmd.service.UserService;

@Service("userService")  
@Transactional  
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {  
  
    /** 
     * 注入DAO 
     */  
    @Resource(name = "userDao")  
    public void setDao(BaseDao<User> dao) {  
        super.setDao(dao);  
    }  
  
    /** 
     * 若CustomerService 定义了BaseService没有的方法，则可以在这里实现 
     */  
  
}  