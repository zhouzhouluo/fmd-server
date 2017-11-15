package com.fmd.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;

public class utils {
	private final static String format  = "yyyy-MM-dd HH:mm:ss";
//	public final static int TOUCH_PAY = 100;
//	public final static int RECOMMEND_PAY= 200;
//	public final static int SEE_PAYPOINT_PAY= 2;
	
	public final static int TOUCH_PAY = 30000;
	public final static int RECOMMEND_PAY= 0;
	public final static int SEE_PAYPOINT_PAY= 0;
	public final static int TAKE_MONEY = 300000;
	
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
    
    public static Date dateParse(String text){
    	SimpleDateFormat sdf = new SimpleDateFormat(format);
    	Date date=null;
		try {
			date = sdf.parse(text);
		}catch(Exception e){
			e.printStackTrace();
		}
		return date;
    }
    public static String dateFrom(Date date){
    	SimpleDateFormat sdf = new SimpleDateFormat(format);
    	String text=null;
		try {
			text = sdf.format(date);
		}catch(Exception e){
			e.printStackTrace();
		}
		return text;
    }
    public static String getLastMonth(Date date){
    	date.setMonth(date.getMonth()-1);
//    	GregorianCalendar calendar = new GregorianCalendar(date.getYear(), date.getMonth(), date.getDay());//灵活的输入年份，月份，日期，
        SimpleDateFormat sdf = new SimpleDateFormat(format);//定义日期显示格式
//        System.out.println(sdf.format(calendar.getTime()));//打印当前月份的下一个月份
//        calendar.add(Calendar.MONTH, -1);//获取上个月月份
//        System.out.println(sdf.format(calendar.getTime()));//输出结果
        return sdf.format(date);
    }
    
    public static void main(String[] args) {
		System.out.println("zzzzzzzzzzzzzzzzz");
	}
    
    
}
