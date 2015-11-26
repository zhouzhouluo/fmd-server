package com.fmd.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fmd.entity.Member_user;
import com.fmd.entity.User;
import com.fmd.entity.Withdraw_log;
import com.fmd.service.Member_userService;
import com.fmd.service.UserService;
import com.fmd.service.Withdraw_logService;
/**
 * 
 * @author Administrator
 *
 */
@RequestMapping("withdraw")
@Controller
public class Withdraw_logController {
	
	@Resource(name = "withdraw_logService")  
    private Withdraw_logService withdraw_logService;
	
	@Resource(name = "member_userService")  
    private Member_userService member_userService;
	
	@RequestMapping(value="/take",method=RequestMethod.POST)
	public String take(HttpServletRequest request,String pwd3){
		Object obj = request.getSession().getAttribute("loginedUser");
		Member_user member_user = null;
		if(obj!=null){
			member_user = (Member_user)obj;
			if(Integer.valueOf(member_user.getCapital())>=1000){
				Withdraw_log withdraw_log = new Withdraw_log();
				withdraw_log.setCapital(1000);
				withdraw_log.setNumber(member_user.getId());
				withdraw_log.setMember(member_user.getAccount_name());
				withdraw_log.setMember_id(member_user.getUserid());
				withdraw_log.setApply_time(new Date());
				withdraw_log.setOperation(1);
				withdraw_log.setDetail("奖金提现1000");
				withdraw_log.setTax(0);
				withdraw_log.setCapital(1000);
				withdraw_log.setTake(1000);
				withdraw_log.setState(0);
				withdraw_logService.save(withdraw_log);
				String capital = (member_user.getCapital()!=null||!"".equals(member_user.getCapital()))?member_user.getCapital():"0";
        		capital = String.valueOf(Integer.parseInt(capital)-1000);
        		member_user.setCapital(capital);
        		String withdraw = (member_user.getCapital()!=null||!"".equals(member_user.getWithdraw()))?member_user.getWithdraw():"0";
        		withdraw = String.valueOf(Integer.parseInt(withdraw)+1000);
        		member_user.setWithdraw(withdraw);
        		member_userService.update(member_user);
			}else{
				return "/business/currency/User_DistillCurrencies";
			}
		}else{
			return "/business/currency/User_DistillCurrencies";
		}
		return "/business/currency/User_DistillCurrencies";
	}
}
