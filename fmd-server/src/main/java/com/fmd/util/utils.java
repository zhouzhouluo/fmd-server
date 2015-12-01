package com.fmd.util;

import javax.servlet.http.HttpServletRequest;

public class utils {
	/**
     * @param request IP
     * @return IP Address
     */
    public static String getIpAddrByRequest(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
    public static String getLogType(int type){
    	String _type="";
    	switch (type) {
		case 1:
			_type="新增";
			break;
		case 2:
			_type="删除";
			break;
		case 3:
			_type="更新";
			break;
		case 4:
			_type="查询";
			break;
		case 5:
			_type="登录";
			break;
		case 6:
			_type="修改密码";
			break;
		case 7:
			_type="二次登录";
			break;
		default:
			break;
		}
    	return _type;
    }
}
