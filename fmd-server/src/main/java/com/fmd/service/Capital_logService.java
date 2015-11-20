package com.fmd.service;

import com.fmd.entity.Capital_log;
import com.fmd.entity.Member_user;

public interface Capital_logService extends BaseService<Capital_log> {  
    /** 
     * 若BaseService 没有定义的方法，可以在这里添加 
     */  
	void refereeCapital(Member_user member_user);
	void managerCapital(Member_user member_user);
	void codeCaptital(Member_user member_user);
}  