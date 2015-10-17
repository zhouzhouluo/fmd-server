package com.fmd.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fmd.entity.User;
import com.fmd.service.UserService;
import com.fmd.service.Withdraw_logService;
/**
 * 
 * @author Administrator
 *
 */
@Controller
public class Withdraw_logController {
	
	@Resource(name = "withdraw_logService")  
    private Withdraw_logService withdraw_logService;
	
	
	@RequestMapping("/withdraw/take")
	public String take(){
		
		return null;
	}
}
