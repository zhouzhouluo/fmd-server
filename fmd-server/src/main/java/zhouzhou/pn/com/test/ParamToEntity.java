package zhouzhou.pn.com.test;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;  
  
@Controller  
public class ParamToEntity {  
  
    @RequestMapping(value="paramToEntity",method=RequestMethod.POST)  
    public String paramToEntity(HttpServletRequest request,Userinfo userinfo){  
    	System.out.println("username:"+request.getParameter("username"));
        System.out.println("username value="+userinfo.getUsername());  
        System.out.println("password value="+userinfo.getPassword());  
        return "test";  
    }  
}
