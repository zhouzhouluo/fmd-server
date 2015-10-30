package com.fmd.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.fmd.entity.Member_user;
import com.fmd.service.Member_userService;
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
	
	
	@RequestMapping(value="save",method=RequestMethod.POST)
	public String save(Member_user member_user){
		member_user.setCjsj(new Date());
		member_user.setCapital("960");
		member_user.setState(1);
		member_userService.save(member_user);
		return "/business/member_user/register";
	}
	@RequestMapping("/member/update")
	public String update(){
		return null;
	}
	@RequestMapping("/member/grid")
	public String grid(){
		return null;
	}
	@RequestMapping("login")
	public String login(String userid,String pwd){
		System.out.println("-----------------------------------------userid:"+userid);
		System.out.println("-----------------------------------------pwd:"+pwd);
		Member_user member_user= member_userService.login(userid);
		if (member_user!=null&&pwd.equals(member_user.getPwd1())) {
			return "business/member_user/my_member";
		}
		return "business/login";
	}
}
