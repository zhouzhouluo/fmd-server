package com.fmd.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.support.StaticApplicationContext;

/**
 * 
 * @author zhouzhou
 *
 */
public class ConfigUtils {

	private static final Log log = LogFactory.getLog(ConfigUtils.class);// log
	private static Properties properties = new Properties();// properties

	public static String MAIL_SERVER_HOSTS = "";
	public static String MAIL_SERVER_PORT = "";
	public static String MAIL_USERNAME = "";
	public static String MAIL_PASSWORD = "";
	public static String MAIL_FROM_ADDRESS = "";
	public static String MAIL_TO_ADDRESS = "";

	public static String DATABASE_URL = "";
	public static String DATABASE_NAME = "";
	public static String DATABASE_USERNAME = "";
	public static String DATABASE_PASSWORD = "";
	public static String DATABASE_SAVEPATH = "";
	public static String DATABASE_BIN = "";
	
	/**
	 * 读配置文件
	 * 
	 * @param filepath
	 * @return
	 */
	public static boolean readProperties(String filepath) {
		InputStreamReader input = null;
		try {
			log.info("------------ Read Properties ------------");
			File file = new File(filepath);
			if (!file.exists()) {
				log.info("Properties Service File Not Exist.");
			}
			input = new InputStreamReader(new FileInputStream(file), "UTF-8");
			properties.load(input);
			MAIL_SERVER_HOSTS = getProperty("MAIL_SERVER_HOSTS", "");
			MAIL_SERVER_PORT = getProperty("MAIL_SERVER_PORT", "");
			MAIL_USERNAME = getProperty("MAIL_USERNAME", "");
			MAIL_PASSWORD = getProperty("MAIL_PASSWORD", "");
			MAIL_FROM_ADDRESS = getProperty("MAIL_FROM_ADDRESS", "");
			MAIL_TO_ADDRESS = getProperty("MAIL_TO_ADDRESS", "");
			
			DATABASE_URL = getProperty("DATABASE_URL", "");
			DATABASE_USERNAME = getProperty("DATABASE_USERNAME", "");
			DATABASE_PASSWORD = getProperty("DATABASE_PASSWORD", "");
			DATABASE_SAVEPATH = getProperty("DATABASE_SAVEPATH", "");
			DATABASE_NAME = getProperty("DATABASE_NAME", "");
			DATABASE_BIN = getProperty("DATABASE_BIN", "");
			
			return true;
		} catch (Exception e) {
			log.error("Properties not loading. " + e.getMessage());
			return false;
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (Exception e) {
					log.error("Closed InputStreamReader Fail. " + e.getMessage());
				}
			}
		}
	}

	/**
	 * 获取配置信息
	 * 
	 * @param key
	 * @param default_value
	 * @return
	 */
	public static String getProperty(String key, String default_value) {
		String properties_value = null;
		try {
			if (properties.containsKey(key)) {
				properties_value = (String) properties.get(key);
				log.info(key + " : " + properties_value);
			} else {
				properties_value = default_value;
				log.warn("key (" + key + ") not found. DEFAULT (" + default_value + ")");
			}
		} catch (Exception e) {
			properties_value = default_value;
			log.error("read key (" + key + ") error. DEFAULT (" + default_value + ") ; Error : "
					+ e.getMessage());
		}
		return properties_value;
	}

	/**
	 * 
	 * @param key
	 * @param default_value
	 * @return
	 */
	public static int getIntProperty(String key, int default_value) {
		int properties_value = 0;
		try {
			if (properties.containsKey(key)) {
				properties_value = Integer.valueOf((String) properties.get(key));
				log.info(key + " : " + properties_value);
			} else {
				properties_value = default_value;
				log.warn("key (" + key + ") not found. DEFAULT (" + default_value + ")");
			}
		} catch (Exception e) {
			properties_value = default_value;
			log.error("read key (" + key + ") error. DEFAULT (" + default_value + ") ; Error : "
					+ e.getMessage());
		}
		return properties_value;
	}
}
