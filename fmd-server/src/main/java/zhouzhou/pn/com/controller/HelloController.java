package zhouzhou.pn.com.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("hello")
public class HelloController {

	@RequestMapping("/sayhello")
	@ResponseBody
	public Map<String, String> sayhello(){
		Map<String, String> map = new HashMap<String,String>();
		System.out.println("--------------------我嗲都发udou发哦到uf");
		map.put("bb", "我真的");
		return map;
	}
	@RequestMapping("/hellobb")
	public String hellobb(){
		return "index";
	}
}