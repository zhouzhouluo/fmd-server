package com.fmd.service.Impl;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.fmd.dao.BaseDao;
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
  
    /** 
     * 若CustomerService 定义了BaseService没有的方法，则可以在这里实现 
     */  
  
}  