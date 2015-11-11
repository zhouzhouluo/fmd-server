package com.fmd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fmd.entity.Member_user;
import com.fmd.service.Member_userService;
/**
 * 
 * @author Administrator
 *
 */
@RequestMapping("member")
@Controller
public class Member_userController {
	
	@Resource(name = "member_userService")  
    private Member_userService member_userService;
	
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String save(Member_user member_user){
		member_user.setCjsj(new Date());
		member_user.setCapital("960");
		member_user.setState(0);
		member_userService.save(member_user);
		return "/business/member_user/my_member";
	}
	@RequestMapping("/member/update")
	public String update(){
		return null;
	}
	@RequestMapping("/grid")
	public String grid(){
		return null;
	}
	@RequestMapping("login")
	@ResponseBody
	public String login(HttpServletRequest request,HttpServletResponse response,String userid,String pwd,String idcode){
		String imgVcode = (String)request.getSession().getAttribute("imgVcode");
		if(!imgVcode.equalsIgnoreCase(idcode)){
			return "2";
		}
		Member_user member_user= member_userService.login(userid);
		if (member_user!=null&&pwd.equals(member_user.getPwd1())) {
			request.getSession().setAttribute("loginedUser", member_user);
			return "1";
		}
		return "3";
	}
}
