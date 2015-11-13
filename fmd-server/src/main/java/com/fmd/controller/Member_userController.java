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
	@RequestMapping("/login")
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
	@RequestMapping(value="/pwd2",method=RequestMethod.POST)
	public String pwd2(HttpServletRequest request,String password){
		Object obj = request.getSession().getAttribute("loginedUser");
		if(obj!=null){
			Member_user member_user = (Member_user)obj;
			if (member_user.getPwd2().equals(password)) {
				request.getSession().setAttribute("userPwd2", password);
				return "/business/member_user/my_member";
			}else{
				return "/business/member_user/UserPassword";
			}
		}else{
			return "/business/login";
		}
	}
	
	
	@RequestMapping(value="/changePwd",method=RequestMethod.POST)
	@ResponseBody
	public String changePwd(HttpServletRequest request,String oldpass,String NewPass,int tree){
		Object obj = request.getSession().getAttribute("loginedUser");
		if(obj!=null){
			Member_user member_user = (Member_user)obj;
			if(tree==1){
				if(member_user.getPwd1().equals(oldpass)){
					member_user.setPwd1(NewPass);
				}else {
					return "0";
				}
			}else if(tree==2){
				if(member_user.getPwd2().equals(oldpass)){
					member_user.setPwd2(NewPass);
				}else {
					return "0";
				}
			}else if(tree==3){
				if(member_user.getPwd3().equals(oldpass)){
					member_user.setPwd3(NewPass);
				}else {
					return "0";
				}
			}
			member_userService.update(member_user);
			request.getSession().setAttribute("loginedUser", member_user);
			return "1";
		}else {
			return "99";
		}
	}
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpServletRequest request){
		request.getSession().removeAttribute("loginedUser");
		return "/business/login";
	}
	
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(HttpServletRequest request,String txtBankAddress,String BankUserName,String BankCard,String UserAddress,
						String UserPost,String UserTel,String txtQQ,String txtEmail){
		Object obj = request.getSession().getAttribute("loginedUser");
		if(obj!=null){
			System.out.println("txtBankAddress:1111111111111"+txtBankAddress);
			Member_user member_user = (Member_user)obj;
			member_user.setAccount_node(txtBankAddress);
			member_user.setAccount_name(BankUserName);
			member_user.setAccount(BankUserName);
			member_user.setReceiv_address(UserAddress);
			member_user.setZip_code(UserPost);
			member_user.setPhone_number(UserTel);
			member_user.setQq(txtQQ);
			member_user.setEmail(txtEmail);
			member_userService.update(member_user);
			request.getSession().setAttribute("loginedUser", member_user);
			return "/business/member_user/User_EditInfo";
		}else{
			return "/business/login";
		}
	}
	
}













