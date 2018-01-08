package com.fmd.backup;
/**
* @author zhouzhou
* @version 2018年1月2日 下午5:22:42
* TODO
*/

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.fmd.mail.SimpleMailSender;
import com.fmd.util.ConfigUtils;

@Component
public class TimingBackupJob {

	/***
	 * 结算系统数据库备份
	 */
	public void dataBaseTaskMain() {
		System.out.println("备份数据，上传数据。。。。。。。。。。。。。。。。begin:"+ConfigUtils.DATABASE_SAVEPATH);
		try {
			Format format = new SimpleDateFormat("yyyyMMddHHmmss");
			String fileName = format.format(new Date())+".sql";
			
			boolean export = MySQLDatabaseBackup.exportDatabaseTool(ConfigUtils.DATABASE_BIN,ConfigUtils.DATABASE_URL,ConfigUtils.DATABASE_USERNAME,
								ConfigUtils.DATABASE_PASSWORD, ConfigUtils.DATABASE_SAVEPATH,fileName,ConfigUtils.DATABASE_NAME);
			if(export) {
				String subject = "结算系统数据库备份"+fileName;
				String content = "结算系统数据库备份"+fileName;
				String fileNames[]= { ConfigUtils.DATABASE_SAVEPATH+fileName};
				SimpleMailSender.sendHtmlMail(subject, content, fileNames);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("备份数据，上传数据。。。。。。。。。。。。。。。。end");
	}
	
}
