package com.fmd.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fmd.entity.Member_user;
import com.fmd.entity.User;
import com.fmd.service.Member_userService;
import com.fmd.service.UserService;
/**
 * 
 * @author Administrator
 *
 */
@RequestMapping("/member")
@Controller
public class Member_userController {
	
	@Resource(name = "member_userService")  
    private Member_userService member_userService;
	
	
	@RequestMapping("/save")
	public String save(Member_user member_user){
		member_user.setCjsj(new Date());
		member_user.setCapital("960");
		member_user.setPwd1("111111");
		member_user.setPwd2("222222");
		member_user.setPwd3("333333");
		member_userService.save(member_user);
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
