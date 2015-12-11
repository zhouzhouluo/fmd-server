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
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.fmd.entity.Log;
import com.fmd.entity.Member_user;
import com.fmd.service.Capital_logService;
import com.fmd.service.LogService;
import com.fmd.service.Member_userService;
import com.fmd.util.EncryptUtil;
import com.fmd.util.utils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import jdk.nashorn.api.scripting.JSObject;

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

	@Resource(name = "capital_logService")
	private Capital_logService capital_logService;

	@Resource(name = "logService")
	private LogService logService;

	private Gson gson = new GsonBuilder().create();

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Member_user member_user) {
		Object obj = request.getSession().getAttribute("loginedUser");
		if (obj != null) {
			Member_user loginedUser = (Member_user) obj;
			Member_user p_user = member_userService.getUserByUserId(member_user.getNode_id());
			if (member_user.getArea() == 0) {
				if (p_user.getLeftid() == null || "".equals(p_user.getLeftid())) {
					p_user.setLeftid(member_user.getUserid());
				} else {
					return "/business/member_user/my_member";
				}
			} else {
				if (p_user.getRightid() == null || "".equals(p_user.getRightid())) {
					p_user.setRightid(member_user.getUserid());
				} else {
					return "/business/member_user/my_member";
				}
			}
			member_user.setCjsj(new Date());
			member_user.setState(0);
			member_user.setCapital("0");
			member_user.setTotal("0");
			member_user.setIssend(0);
			try {
				member_user.setPwd1(EncryptUtil.encode(member_user.getPwd1()));
				member_user.setPwd2(EncryptUtil.encode(member_user.getPwd2()));
				member_user.setPwd3(EncryptUtil.encode(member_user.getPwd3()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			member_userService.save(member_user);
			member_userService.updateChildCon(member_user);
			logService.saveLog(loginedUser.getUserid(), loginedUser.getAccount_name(), LogService.TYPE_CREATE,
					gson.toJson(member_user), utils.getIpAddrByRequest(request), "member_user",
					loginedUser.getUserid() + "注册新用户" + member_user.getUserid());
			member_userService.update(p_user);
			logService.saveLog(loginedUser.getUserid(), loginedUser.getAccount_name(), LogService.TYPE_UPDATE,
					gson.toJson(p_user), utils.getIpAddrByRequest(request), "member_user", loginedUser.getUserid() + "更新用户"+p_user.getUserid());
		}
		return "/business/member_user/my_member";
	}

	@RequestMapping("/login")
	@ResponseBody
	public String login(HttpServletRequest request, HttpServletResponse response, String userid, String pwd,
			String idcode) {
		String imgVcode = (String) request.getSession().getAttribute("imgVcode");
		if (!imgVcode.equalsIgnoreCase(idcode)) {
			return "2";
		}
		Member_user member_user = member_userService.getUserByUserId(userid);
		try {
//			System.out.println("pwd-----------------:"+EncryptUtil.encode(pwd));
//			System.out.println("member_user.getPwd1()-----------------:"+member_user.getPwd1());
			if (member_user != null && EncryptUtil.encode(pwd).equals(member_user.getPwd1())) {
				request.getSession().setAttribute("loginedUser", member_user);
				logService.saveLog(userid, member_user.getAccount_name(), LogService.TYPE_LOGIN, "userid:" + userid + "//pwd:" + pwd + "//" + "登录",
						utils.getIpAddrByRequest(request), "member_user", userid + "登录系统成功");
				return "1";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logService.saveLog(userid, member_user!=null?member_user.getAccount_name():"", LogService.TYPE_LOGIN, "userid:" + userid + "//pwd:" + pwd + "//" + "登录",
				utils.getIpAddrByRequest(request), "member_user", userid + "登录系统失败");
		return "3";
	}

	@RequestMapping(value = "/pwd2", method = RequestMethod.POST)
	public String pwd2(HttpServletRequest request, String password) {
		Object obj = request.getSession().getAttribute("loginedUser");
		if (obj != null) {
			Member_user member_user = (Member_user) obj;
			logService.saveLog(member_user.getUserid(), member_user.getAccount_name(), LogService.TYPE_LOGINPWD2,
					"password：" + password + "//二次密码登录:", utils.getIpAddrByRequest(request), "member_user",
					member_user.getUserid() + "二次密码登录");
			try {
				if (member_user.getPwd2().equals(EncryptUtil.encode(password))) {
					request.getSession().setAttribute("userPwd2", password);
					return "/business/member_user/User_treeview";
				} else {
					return "/business/member_user/UserPassword";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "/business/member_user/UserPassword";
			}
		} else {
			return "/business/login";
		}
	}

	@RequestMapping(value = "/changePwd", method = RequestMethod.POST)
	@ResponseBody
	public String changePwd(HttpServletRequest request, String oldpass, String NewPass, int tree) {
		Object obj = request.getSession().getAttribute("loginedUser");
		if (obj != null) {
			Member_user member_user = (Member_user) obj;
			logService.saveLog(member_user.getUserid(), member_user.getAccount_name(), LogService.TYPE_CHANGEPWD,
					"oldpass:" + oldpass + "//NewPass:" + NewPass + "//tree:" + tree, utils.getIpAddrByRequest(request),
					"member_user", member_user.getUserid() + "修改密码");
			if (tree == 1) {
				try {
					if (member_user.getPwd1().equals(EncryptUtil.encode(oldpass))) {
						member_user.setPwd1(EncryptUtil.encode(NewPass));
					} else {
						return "0";
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (tree == 2) {
				try {
					if (member_user.getPwd2().equals(EncryptUtil.encode(oldpass))) {
						member_user.setPwd2(EncryptUtil.encode(NewPass));
					} else {
						return "0";
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (tree == 3) {
				try {
					if (member_user.getPwd3().equals(EncryptUtil.encode(oldpass))) {
						member_user.setPwd3(EncryptUtil.encode(NewPass));
					} else {
						return "0";
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			member_userService.update(member_user);
			request.getSession().setAttribute("loginedUser", member_user);
			request.getSession().setAttribute("userPwd2", member_user.getPwd2());
			return "1";
		} else {
			return "99";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("loginedUser");
		return "/business/login";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, String txtBankAddress, String BankUserName, String BankCard,
			String UserAddress, String UserPost, String UserTel, String txtQQ, String txtEmail) {
		Object obj = request.getSession().getAttribute("loginedUser");
		if (obj != null) {
			Member_user member_user = (Member_user) obj;
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
			logService.saveLog(member_user.getUserid(), member_user.getAccount_name(), LogService.TYPE_UPDATE,
					gson.toJson(member_user), utils.getIpAddrByRequest(request), "member_user",member_user.getUserid() + "更新数据");
			return "/business/member_user/User_EditInfo";
		} else {
			return "/business/login";
		}
	}

	@RequestMapping(value = "/sp", method = RequestMethod.POST)
	@ResponseBody
	public String sp(HttpServletRequest request, String userid, int state) {
		Object obj = request.getSession().getAttribute("loginedUser");
		if (obj != null) {
			Member_user loginedUser = (Member_user) obj;
			if ("000001".equals(loginedUser.getUserid())) {
				Member_user member_user = member_userService.getUserByUserId(userid);
				if (99 == state) {
					member_userService.delete(member_user.getId());
					logService.saveLog(loginedUser.getUserid(), loginedUser.getAccount_name(), LogService.TYPE_DELETE,
							gson.toJson(member_user), utils.getIpAddrByRequest(request), "member_user",
							loginedUser.getUserid() + "删除用户" + member_user.getUserid());
				} else if(1 == state){
					member_user.setState(state);
					member_userService.update(member_user);
					logService.saveLog(loginedUser.getUserid(), loginedUser.getAccount_name(), LogService.TYPE_UPDATE,
							gson.toJson(member_user), utils.getIpAddrByRequest(request), "member_user",
							loginedUser.getUserid() + "审核用户" + member_user.getUserid());
					Log log = new Log();
					log.setUser_id(loginedUser.getUserid());
					log.setUser_name(loginedUser.getAccount_name());
					log.setIp(utils.getIpAddrByRequest(request));
					log.setState(1);
					capital_logService.refereeCapital(log, member_user);
					capital_logService.codeCaptital(log, member_user);
					capital_logService.managerCapital(log, member_user);
					// new Thread(new Runnable() {
					//
					// @Override
					// public void run() {
					// capital_logService.refereeCapital(member_user);
					// capital_logService.codeCaptital(member_user);
					// capital_logService.managerCapital(member_user);
					// }
					// }).start();
				}
			}
		}
		return "1";
	}
	
	@RequestMapping(value = "/getNode", method = RequestMethod.POST)
//	@ResponseBody
	public void getNode(HttpServletResponse response,String userid,int area) {
		response.setContentType("text/html;charset=UTF-8");  
		Member_user member_user = member_userService.getUserByUserId(userid);
		String name = "0";
		if(area==0&&member_user!=null&&member_user.getState()==1&&(member_user.getLeftid()==null||"".equals(member_user.getLeftid()))){
			name =  member_user.getAccount_name();
		}else if(area==1&&member_user!=null&&member_user.getState()==1&&(member_user.getRightid()==null||"".equals(member_user.getRightid()))){
			name =  member_user.getAccount_name();
		}else {
			name =  "0";
		}
		response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");  
        PrintWriter out;
		try {
			out = response.getWriter();//输出中文，这一句一定要放到response.setContentType("text/html;charset=utf-8"),  response.setHeader("Cache-Control", "no-cache")后面，否则中文返回到页面是乱码  
			out.print(name);
	        out.flush();
	        out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	@RequestMapping(value = "/getRefree", method = RequestMethod.POST)
//	@ResponseBody
	public void getRefree(HttpServletResponse response,String userid) {
		Member_user member_user = member_userService.getUserByUserId(userid);
		String name = "0";
		if(member_user!=null&&member_user.getState()==1){
			name = member_user.getAccount_name();
		}else {
			name = "0";
		}
		response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");  
        PrintWriter out;
		try {
			out = response.getWriter();//输出中文，这一句一定要放到response.setContentType("text/html;charset=utf-8"),  response.setHeader("Cache-Control", "no-cache")后面，否则中文返回到页面是乱码  
			out.print(name);
	        out.flush();
	        out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	@RequestMapping(value = "/fh", method = RequestMethod.POST)
	@ResponseBody
	public String fh(HttpServletRequest request, String userid, int send) {
		Object obj = request.getSession().getAttribute("loginedUser");
		if (obj != null) {
			Member_user loginedUser = (Member_user) obj;
			if ("000001".equals(loginedUser.getUserid())) {
				Member_user member_user = member_userService.getUserByUserId(userid);
				if(1 == send){
					member_user.setIssend(send);
					member_userService.update(member_user);
					logService.saveLog(loginedUser.getUserid(), loginedUser.getAccount_name(), LogService.TYPE_UPDATE,
							gson.toJson(member_user), utils.getIpAddrByRequest(request), "member_user",
							loginedUser.getUserid() + "发货" + member_user.getUserid()+member_user.getAccount_name());
					Log log = new Log();
					log.setUser_id(loginedUser.getUserid());
					log.setUser_name(loginedUser.getAccount_name());
					log.setIp(utils.getIpAddrByRequest(request));
					log.setState(1);
				}
			}
		}
		return "1";
	}
}
