package com.fmd.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fmd.entity.Capital_log;
import com.fmd.entity.Member_user;
import com.fmd.entity.User;
import com.fmd.entity.Withdraw_log;
import com.fmd.service.Capital_logService;
import com.fmd.service.LogService;
import com.fmd.service.Member_userService;
import com.fmd.service.UserService;
import com.fmd.service.Withdraw_logService;
import com.fmd.util.utils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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

	@Resource(name = "capital_logService")
	private Capital_logService capital_logService;

	@Resource(name = "member_userService")
	private Member_userService member_userService;

	@Resource(name = "logService")
	private LogService logService;

	private Gson gson = new GsonBuilder().create();

	@RequestMapping(value = "/take", method = RequestMethod.POST)
	@ResponseBody
	public String take(HttpServletRequest request, String pwd3) {
		Object obj = request.getSession().getAttribute("loginedUser");
		Member_user member_user = null;
		if (obj != null) {
			member_user = (Member_user) obj;
			if (Integer.valueOf(member_user.getCapital()) >= 1000) {
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
				logService.saveLog(member_user.getUserid(), member_user.getAccount_name(), LogService.TYPE_CREATE,
						gson.toJson(withdraw_log), utils.getIpAddrByRequest(request), "withdraw_log",
						member_user.getUserid() + "奖金提现1000");
				String capital = (member_user.getCapital() != null || !"".equals(member_user.getCapital()))
						? member_user.getCapital() : "0";
				capital = String.valueOf(Integer.parseInt(capital) - 1000);
				member_user.setCapital(capital);
				String withdraw = (member_user.getCapital() != null || !"".equals(member_user.getWithdraw()))
						? member_user.getWithdraw() : "0";
				withdraw = String.valueOf(Integer.parseInt(withdraw) + 1000);
				member_user.setWithdraw(withdraw);
				member_userService.update(member_user);
				logService.saveLog(member_user.getUserid(), member_user.getAccount_name(), LogService.TYPE_UPDATE,
						gson.toJson(member_user), utils.getIpAddrByRequest(request), "member_user",
						member_user.getUserid() + "更新"+member_user.getUserid()+"余额为" + member_user.getCapital());
				Capital_log capital_log = new Capital_log();
				capital_log.setMember_id(member_user.getUserid());
				capital_log.setMember(member_user.getAccount_name());
				capital_log.setNumber(member_user.getId());
				capital_log.setOperation(4);
				capital_log.setPayout("" + 1000);
				capital_log.setDetail("奖金提现1000");
				capital_log.setState(2);
				capital_log.setRemain(capital);
				capital_log.setTime(new Date());
				capital_log.setIncome("" + 0);
				capital_logService.save(capital_log);
				logService.saveLog(member_user.getUserid(), member_user.getAccount_name(), LogService.TYPE_CREATE,
						gson.toJson(capital_log), utils.getIpAddrByRequest(request), "capital_log", member_user.getUserid() + "奖金支出记录-1000");
			}
		}
		return "1";
	}

	@RequestMapping(value = "/sp", method = RequestMethod.POST)
	@ResponseBody
	public String sp(HttpServletRequest request, int id, int state) {
		Object obj = request.getSession().getAttribute("loginedUser");
		if (obj != null) {
			Member_user loginedUser = (Member_user) obj;
			if ("000001".equals(loginedUser.getUserid())) {
				Withdraw_log withdraw_log = withdraw_logService.getById(id);
				withdraw_log.setState(state);
				withdraw_log.setApprove(loginedUser.getAccount_name());
				withdraw_log.setApprove_id(loginedUser.getUserid());
				withdraw_log.setApprove_time(new Date());
				withdraw_logService.update(withdraw_log);
				logService.saveLog(loginedUser.getUserid(), loginedUser.getAccount_name(), LogService.TYPE_UPDATE,
						gson.toJson(withdraw_log), utils.getIpAddrByRequest(request), "withdraw_log",loginedUser.getUserid()+"奖金审批"+state);
				if (state == 2) {
					Member_user member_user = member_userService.getUserByUserId(withdraw_log.getMember_id());
					String capital = (member_user.getCapital() != null || !"".equals(member_user.getCapital()))
							? member_user.getCapital() : "0";
					capital = String.valueOf(Integer.parseInt(capital) + 1000);
					String withdraw = (member_user.getWithdraw() != null || !"".equals(member_user.getWithdraw()))
							? member_user.getWithdraw() : "0";
					withdraw = String.valueOf(Integer.parseInt(withdraw) - 1000);
					member_user.setCapital(capital);
					member_user.setWithdraw(withdraw);
					member_userService.update(member_user);
					logService.saveLog(loginedUser.getUserid(), loginedUser.getAccount_name(), LogService.TYPE_UPDATE,
							gson.toJson(member_user), utils.getIpAddrByRequest(request), "member_user",loginedUser.getUserid() + "更新"+member_user.getUserid()+"余额为" + member_user.getCapital());
					Capital_log capital_log = new Capital_log();
					capital_log.setMember_id(member_user.getUserid());
					capital_log.setMember(member_user.getAccount_name());
					capital_log.setNumber(member_user.getId());
					capital_log.setOperation(0);
					capital_log.setIncome("" + 1000);
					capital_log.setDetail("奖金提现1000--审批不通过");
					capital_log.setState(1);
					capital_log.setRemain(capital);
					capital_log.setTime(new Date());
					capital_logService.save(capital_log);
					logService.saveLog(loginedUser.getUserid(), loginedUser.getAccount_name(), LogService.TYPE_CREATE,
							gson.toJson(capital_log), utils.getIpAddrByRequest(request), "capital_log",loginedUser.getUserid() + "审批"+member_user.getUserid()+"提现不通过，奖金收入记录+1000");
				}
			}
		}
		return "1";
	}

	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	@ResponseBody
	public String cancel(HttpServletRequest request, int id, int state) {
		Object obj = request.getSession().getAttribute("loginedUser");
		if (obj != null) {
			Member_user loginedUser = (Member_user) obj;
			Withdraw_log withdraw_log = withdraw_logService.getById(id);
			withdraw_log.setState(state);
			withdraw_log.setApprove(loginedUser.getAccount_name());
			withdraw_log.setApprove_id(loginedUser.getUserid());
			withdraw_log.setApprove_time(new Date());
			withdraw_logService.update(withdraw_log);
			logService.saveLog(loginedUser.getUserid(), loginedUser.getAccount_name(), LogService.TYPE_UPDATE,
					gson.toJson(withdraw_log), utils.getIpAddrByRequest(request), "withdraw_log",loginedUser.getUserid() + "提现取消");
			String capital = (loginedUser.getCapital() != null || !"".equals(loginedUser.getCapital()))
					? loginedUser.getCapital() : "0";
			capital = String.valueOf(Integer.parseInt(capital) + 1000);
			String withdraw = (loginedUser.getWithdraw() != null || !"".equals(loginedUser.getWithdraw()))
					? loginedUser.getWithdraw() : "0";
			withdraw = String.valueOf(Integer.parseInt(withdraw) - 1000);
			loginedUser.setCapital(capital);
			loginedUser.setWithdraw(withdraw);
			member_userService.update(loginedUser);
			logService.saveLog(loginedUser.getUserid(), loginedUser.getAccount_name(), LogService.TYPE_UPDATE,
					gson.toJson(loginedUser), utils.getIpAddrByRequest(request), "member_user",loginedUser.getUserid() + "更新"+loginedUser.getUserid()+"余额为" + loginedUser.getCapital());
			Capital_log capital_log = new Capital_log();
			capital_log.setMember_id(loginedUser.getUserid());
			capital_log.setMember(loginedUser.getAccount_name());
			capital_log.setNumber(loginedUser.getId());
			capital_log.setOperation(0);
			capital_log.setIncome("" + 1000);
			capital_log.setDetail("奖金提现1000--取消");
			capital_log.setState(1);
			capital_log.setRemain(capital);
			capital_log.setTime(new Date());
			capital_logService.save(capital_log);
			logService.saveLog(loginedUser.getUserid(), loginedUser.getAccount_name(), LogService.TYPE_CREATE,
					gson.toJson(capital_log), utils.getIpAddrByRequest(request), "capital_log",loginedUser.getUserid() + "提现取消，奖金收入记录+1000");
		}
		return "1";
	}
}
