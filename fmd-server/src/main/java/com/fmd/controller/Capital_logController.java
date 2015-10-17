package com.fmd.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fmd.entity.User;
import com.fmd.service.Capital_logService;
import com.fmd.service.UserService;
/**
 * 
 * @author Administrator
 *
 */
@Controller
public class Capital_logController {
	
	@Resource(name = "capital_logService")  
    private Capital_logService capital_logService;
	
	
	@RequestMapping("/capital/query")
	public String query(){
		return null;
	}
}
