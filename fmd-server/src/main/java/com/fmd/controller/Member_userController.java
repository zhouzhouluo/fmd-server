package com.fmd.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fmd.entity.User;
import com.fmd.service.Member_userService;
import com.fmd.service.UserService;
/**
 * 
 * @author Administrator
 *
 */
@Controller
public class Member_userController {
	
	@Resource(name = "member_userService")  
    private Member_userService member_userService;
	
	
	@RequestMapping("/member/save")
	public String save(){
		return null;
	}
	@RequestMapping("/member/update")
	public String update(){
		return null;
	}
	@RequestMapping("/member/grid")
	public String grid(){
		return null;
	}
}
