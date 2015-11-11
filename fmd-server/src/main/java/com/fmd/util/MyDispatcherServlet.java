package com.fmd.util;

import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.util.WebUtils;

public class MyDispatcherServlet extends DispatcherServlet {
	private static final long serialVersionUID = 4326366227399480131L;
	private static final Logger logger = LoggerFactory.getLogger(MyDispatcherServlet.class);
	
	private static final Boolean ISDEV = false;//是否开发模式,false 开发，true生产，开发模式可以直接通过pc访问，生产模式则只能移动访问
	
	private static final String LOCALE_SESSION_ATTRIBUTE_NAME = SessionLocaleResolver.class.getName() + ".LOCALE";
	
//	private ApplicationContext applicationContext;
//	private LocaleResolver localeResolver;

	protected void doService(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyDispatcherServlet-------------------------");
		Locale targetLocal = null;
		Locale sessionLocale = (Locale) WebUtils.getSessionAttribute(request, LOCALE_SESSION_ATTRIBUTE_NAME);
		String urlLocale = request.getParameter("locale");
		logger.debug("客户端浏览器默认Locale：" + request.getLocale());
		String requestUrl = request.getRequestURI().replace(request.getContextPath(), "");
		if(ISDEV&&requestUrl.indexOf("notMobile.htm")==-1){
			 //获取ua，用来判断是否为移动端访问  
            String userAgent = request.getHeader( "USER-AGENT" ).toLowerCase();
//            if(!Toolkit.check(userAgent)){
//            	String url = "/index/notMobile.htm";		
//				request.getRequestDispatcher(url).forward(request, response);
//				return ;
//            }  
            //判断是否为移动端访问  
		}
		
		// 请求的URL中携带了locale参数，说明用户希望改变页面的语言显示
		if (urlLocale != null) {
			targetLocal = StringUtils.parseLocaleString(urlLocale);
			logger.info("用户希望手动改变Locale语言到 -> " + targetLocal);
			
			setLocale(request, response, targetLocal);
		} 
		// 虽然没有在当前页面手动请求更改Locale标记，但在其他页面上仍要使用用户的语言习惯
		else {
			// Session中有Locale标记，则以Session中的Locale标记为准
			if (sessionLocale != null) {
				targetLocal = sessionLocale;
				logger.info("使用Session中的Locale语言 -> " + targetLocal);
				
				setLocale(request, response, targetLocal);
			}
			// Session中无Locale标记，则使用request请求头中的语言标志作为默认的语言
//			else {
//				targetLocal = request.getLocale();
//				logger.info("使用Request中的Locale语言 -> " + targetLocal);
//			}
		}
		
		Map<String, Object> loginUser = (Map<String, Object>) request.getSession().getAttribute("userLoginInfo");
//		//招商活动期间 当这个为空 则跑到招商登录界面
//		FlowMerchantBank flowMerchant = (FlowMerchantBank) request.getSession().getAttribute("flowMB");
//		FlowShenXun flowShenXun = (FlowShenXun) request.getSession().getAttribute("flowShenXun");
//		FlowPacketExchange flowPK = (FlowPacketExchange) request.getSession().getAttribute("flowPK");;
		if (loginUser == null) {// 把用户的相关信息保存当前线程,没有登陆的时候遇到以下连接则提示用户没有登录
			
			System.out.println(requestUrl);
			if (requestUrl.indexOf("DHlogin")  > -1
					|| requestUrl.indexOf("Newlogin")  > -1) {
				String url = "/index/400.htm";		
				request.getRequestDispatcher(url).forward(request, response);
				return;
			}
		}
//		ContextUser.setContextUser(user);
//		applicationContext = WebApplicationContextUtils.getWebApplicationContext(this.getWebApplicationContext().getServletContext());
//		localeResolver = applicationContext.getBean(LOCALE_RESOLVER_BEAN_NAME, LocaleResolver.class);
		super.doService(request, response);
	}
	
	/**
	 * 设置Locale，并写入到Session中
	 */
	private void setLocale(HttpServletRequest request, HttpServletResponse response, Locale locale) {
		WebUtils.setSessionAttribute(request, LOCALE_SESSION_ATTRIBUTE_NAME, locale);
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		String prefix = getServletContext().getRealPath("/"); // 获取项目所在绝对路径
//		System.out.println("22222222222222222222222222222222222");
//		Config.readProperties(prefix + "WEB-INF/classes/config.properties");
	}
	
	@Override
	public void destroy() {
		super.destroy();
	}
}
