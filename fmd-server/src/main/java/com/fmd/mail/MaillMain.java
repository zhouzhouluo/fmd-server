package com.fmd.mail;
/**
 * @author zhouzhou
 * @version 2017年12月18日 下午4:03:12
 * TODO
 */
public class MaillMain {

	public static void main(String[] args) {
        // 这个类主要是设置邮件
        MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.163.com");
        mailInfo.setMailServerPort("25");
        mailInfo.setValidate(true);
        mailInfo.setUserName("luoyz619@163.com"); // 实际发送者
        mailInfo.setPassword("luoyizhou619");// 您的邮箱密码
        mailInfo.setFromAddress("luoyz619@163.com"); // 设置发送人邮箱地址
        mailInfo.setToAddress("631853283@qq.com"); // 设置接受者邮箱地址
        mailInfo.setSubject("结算系统数据备份20180102111811");
        mailInfo.setContent("设置邮箱内容20180102");
        String fileNames[] = {"/Users/zhouzhou/Desktop/2017-01-02.sql"};
        mailInfo.setAttachFileNames(fileNames);
        // 这个类主要来发送邮件
        SimpleMailSender sms = new SimpleMailSender();
//        sms.sendTextMail(mailInfo); // 发送文体格式
        sms.sendHtmlMail(mailInfo); // 发送html格式
    }
	
}
