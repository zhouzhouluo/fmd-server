package com.fmd.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class ApplicationContextManagement implements ApplicationContextAware{
	private static ApplicationContext appContext;
	
	public static void init(ApplicationContext appContext){
		ApplicationContextManagement.appContext = appContext;
	}
	
	public static ApplicationContext getApplicationContext(){
		return appContext;
	}
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		this.appContext = applicationContext;
	}

}
