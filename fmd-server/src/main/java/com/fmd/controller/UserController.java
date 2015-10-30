package com.fmd.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fmd.entity.User;
import com.fmd.service.UserService;
/**
 * 
 * @author Administrator
 *
 */
@Controller
public class UserController {
	
	@Resource(name = "userService")  
    private UserService userService;
	
	
	@RequestMapping("/user/save")
	public String sayhello(){
		System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
//		User user = new User();
//		user.setLogin("罗亦洲");
//		user.setPwd("zhgouzhouluo");
//		userService.save(user);
		User user = userService.getById(2);
//		System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"+user.getLogin());
		user.setLogin("周舟咯");
		user.setPwd("aaaaaaaaaaaaaaaaa");
		userService.update(user);
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa:"+user.getLogin());
//		userService.delete(1);
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		return null;
	}
}
