package com.fmd.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.misc.BASE64Encoder;

import com.fmd.entity.User;
import com.fmd.service.UserService;
import com.fmd.util.HttpUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("user")
public class UserController {

	@Resource(name = "userService")
	private UserService userService;

	@RequestMapping("/save")
	public String sayhello() {
		System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
		// User user = new User();
		// user.setLogin("罗亦洲");
		// user.setPwd("zhgouzhouluo");
		// userService.save(user);
		User user = userService.getById(2);
		// System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"+user.getLogin());
		user.setLogin("周舟咯");
		user.setPwd("aaaaaaaaaaaaaaaaa");
		userService.update(user);
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa:" + user.getLogin());
		// userService.delete(1);
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		return null;
	}

	@RequestMapping(value = "/cache" , method = RequestMethod.POST)
	public void cache(HttpServletRequest request) throws IOException{
		
//		BufferedReader bf = null;
//		StringBuffer sb = new StringBuffer();
//		String temp = null;
//		try {
//			bf = request.getReader();
//			while ((temp = bf.readLine()) != null) {
//				sb.append(temp);
//			}
//			temp = null;
//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally {
//			if (bf != null) {
//				try {
//					bf.close();
//				} catch (IOException e) {
//				}
//			}
//		}
		
		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));  
        String line = null;  
        StringBuilder sb = new StringBuilder();  
        while ((line = br.readLine()) != null) {  
            sb.append(line);  
        }  
        String gsonString = sb.toString();
//		System.out.println("gsonString:"+gsonString);
		Gson gson = new Gson();
		Map<String,String> mapgson = gson.fromJson(gsonString,new TypeToken<Map<String, String>>(){}.getType());
		
		System.out.println("id:"+mapgson.get("id"));
		System.out.println("wsid:"+mapgson.get("wsid"));
		System.out.println("b64str.length():"+mapgson.get("b64str").length());
		
		String id = mapgson.get("id");
		String wsid = mapgson.get("wsid");
		String b64str = mapgson.get("b64str");
		
		
		
		String url =null;
		url="http://"+InetAddress.getLocalHost().getHostAddress()+":8099/wsserver/myscan/close";
		Map<String, String> jsonmap = new HashMap<String, String>();
		jsonmap.put("id", id);
		jsonmap.put("b64str", b64str);
//		System.out.println("cache================================jsonmap---------------------"+jsonmap);
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("wsid", wsid);
		maps.put("message", gson.toJson(jsonmap));
		try {
//			System.out.println("cache====================================map---------------------"+maps);
			HttpUtils.openUrl(url, HttpUtils.METHOD_POST, gson.toJson(maps));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping("/test2")
	@ResponseBody
	public String test2(HttpServletRequest request) {
		BufferedReader bf = null;
		StringBuffer sb = new StringBuffer();
		String temp = null;
		try {
			bf = request.getReader();
			while ((temp = bf.readLine()) != null) {
				sb.append(temp);
			}
			temp = null;
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (bf != null) {
				try {
					bf.close();
				} catch (IOException e) {
				}
			}
		}
		Gson gson = new Gson();
		Map<String,String> map = gson.fromJson(sb.toString(),new TypeToken<Map<String, String>>(){}.getType());
		System.out.println("id:"+map.get("id"));
		System.out.println("wsid:"+map.get("wsid"));
		System.out.println("b64str.length():"+map.get("b64str").length());
//		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa:"+sb.toString().length());
		return "";
	}

	@RequestMapping("/test")
	@ResponseBody
	public String test(String base64StrImgData, String imgFormat) {
		System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb:" + base64StrImgData);
		System.out.println("imgFormat:" + imgFormat);
		return "aaaaaaaa";
	}

	@RequestMapping("/txt")
	@ResponseBody
	public String txt(String base64StrImgData, String imgFormat) {
//		File file = new File("/Users/zhouzhou/Downloads/base64.txt");
//		BufferedReader reader = null;
//		StringBuffer stringBuffer = new StringBuffer();
//		try {
//			reader = new BufferedReader(new FileReader(file));
//			String tempString = null;
//			// 一次读入一行，直到读入null为文件结束
//			while ((tempString = reader.readLine()) != null) {
//				stringBuffer.append(tempString);
//			}
//			reader.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally {
//			if (reader != null) {
//				try {
//					reader.close();
//				} catch (IOException e1) {
//				}
//			}
//		}
//		return stringBuffer.toString();
		String bases64 = getImageStr("/Users/zhouzhou/Documents/chunchun/美白红唇.jpg");
		return bases64;
	}

	public static void main(String[] args) {
		String bases64 = getImageStr("/Users/zhouzhou/Documents/chunchun/2016051113385582.tif");
		System.out.println("bases64=="+bases64);
		System.out.println("bases64.length()=="+bases64.length());
	}
	
	public static String getImageStr(String imgFile) {
	    InputStream inputStream = null;
	    byte[] data = null;
	    try {
	        inputStream = new FileInputStream(imgFile);
	        data = new byte[inputStream.available()];
	        inputStream.read(data);
	        inputStream.close();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    // 加密
	    BASE64Encoder encoder = new BASE64Encoder();
	    return encoder.encode(data);
	}
	
}
