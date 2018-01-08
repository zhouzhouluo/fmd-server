package com.fmd.mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import com.fmd.util.ConfigUtils;

/**
 * 简单邮件（不带附件的邮件）发送器
 */
public class SimpleMailSender {
	/**
	 * 以文本格式发送邮件
	 * 
	 * @param mailInfo
	 *            待发送的邮件的信息
	 */
	public boolean sendTextMail(MailSenderInfo mailInfo) {
		// 判断是否需要身份认证
		MyAuthenticator authenticator = null;
		Properties pro = mailInfo.getProperties();
		if (mailInfo.isValidate()) {
			// 如果需要身份认证，则创建一个密码验证器
			authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword());
		}
		// 根据邮件会话属性和密码验证器构造一个发送邮件的session
		Session sendMailSession = Session.getDefaultInstance(pro, authenticator);
		try {
			// 根据session创建一个邮件消息
			Message mailMessage = new MimeMessage(sendMailSession);
			// 创建邮件发送者地址
			Address from = new InternetAddress(mailInfo.getFromAddress());
			// 设置邮件消息的发送者
			mailMessage.setFrom(from);
			// 创建邮件的接收者地址，并设置到邮件消息中
			Address to = new InternetAddress(mailInfo.getToAddress());
			mailMessage.setRecipient(Message.RecipientType.TO, to);
			// 设置邮件消息的主题
			mailMessage.setSubject(mailInfo.getSubject());
			// 设置邮件消息发送的时间
			mailMessage.setSentDate(new Date());
			// 设置邮件消息的主要内容
			String mailContent = mailInfo.getContent();
			mailMessage.setText(mailContent);
			// 发送邮件
			Transport.send(mailMessage);
			return true;
		} catch (MessagingException ex) {
			ex.printStackTrace();
		}
		return false;
	}

	/**
     * 以HTML格式发送邮件
     * 
     * @param mailInfo
     *            待发送的邮件信息
     */
    public boolean sendHtmlMail(MailSenderInfo mailInfo) {
        // 判断是否需要身份认证
        MyAuthenticator authenticator = null;
        Properties pro = mailInfo.getProperties();
        // 如果需要身份认证，则创建一个密码验证器
        if (mailInfo.isValidate()) {
            authenticator = new MyAuthenticator(mailInfo.getUserName(),
                    mailInfo.getPassword());
        }
        // 根据邮件会话属性和密码验证器构造一个发送邮件的session
        Session sendMailSession = Session
                .getDefaultInstance(pro, authenticator);
        try {
            // 根据session创建一个邮件消息
            Message mailMessage = new MimeMessage(sendMailSession);
            // 创建邮件发送者地址
            Address from = new InternetAddress(mailInfo.getFromAddress());
            // 设置邮件消息的发送者
            mailMessage.setFrom(from);
            // 创建邮件的接收者地址，并设置到邮件消息中
            Address to = new InternetAddress(mailInfo.getToAddress());
            // Message.RecipientType.TO属性表示接收者的类型为TO
            mailMessage.setRecipient(Message.RecipientType.TO, to);
            // 设置邮件消息的主题
            mailMessage.setSubject(mailInfo.getSubject());
            // 设置邮件消息发送的时间
            mailMessage.setSentDate(new Date());

            // MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象
            Multipart mainPart = new MimeMultipart();
            // 创建一个包含HTML内容的MimeBodyPart
            BodyPart html = new MimeBodyPart();
            // 设置HTML内容
            html.setContent(mailInfo.getContent(), "text/html; charset=utf-8");
            mainPart.addBodyPart(html);

            // 设置信件的附件(用本地上的文件作为附件)
            if(mailInfo.getAttachFileNames()!=null) {
            		for(String attachFileName :mailInfo.getAttachFileNames()) {
            			  MimeBodyPart attached=new MimeBodyPart();
            			  FileDataSource fds=new FileDataSource(attachFileName);
            			  attached.setDataHandler(new DataHandler(fds));
            			  String fileName=doHandlerFileName(attachFileName);
            			  try {
							attached.setFileName(MimeUtility.encodeWord(fileName));
						} catch (UnsupportedEncodingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}//处理附件文件的中文名问题
            			  mainPart.addBodyPart(attached);
            		}
            }

            // 将MiniMultipart对象设置为邮件内容
            mailMessage.setContent(mainPart);
            mailMessage.saveChanges();

            // 发送邮件
            Transport.send(mailMessage);
            return true;
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    /**
	  * 处理文件名
	  * 此处是针对Window下的。
	  * @param filePath
	  * @return
	  */
	 private static String doHandlerFileName(String filePath){
		  String fileName=filePath;
		  if(null !=filePath && !"".equals(filePath)){
		   fileName=filePath.substring(filePath.lastIndexOf("//")+1);
		  }
		  return fileName;
	 }
   
	 
	 /**
	  * 发送邮件
	  * @param subject
	  * @param content
	  * @param fileNames
	  */
	 public static void sendHtmlMail(String subject,String content,String fileNames[]) {
		// 这个类主要是设置邮件
	        MailSenderInfo mailInfo = new MailSenderInfo();
	        mailInfo.setMailServerHost(ConfigUtils.MAIL_SERVER_HOSTS);
	        mailInfo.setMailServerPort(ConfigUtils.MAIL_SERVER_PORT);
	        mailInfo.setValidate(true);
	        mailInfo.setUserName(ConfigUtils.MAIL_USERNAME); // 实际发送者
	        mailInfo.setPassword(ConfigUtils.MAIL_PASSWORD);// 您的邮箱密码
	        mailInfo.setFromAddress(ConfigUtils.MAIL_FROM_ADDRESS); // 设置发送人邮箱地址
	        mailInfo.setToAddress(ConfigUtils.MAIL_TO_ADDRESS); // 设置接受者邮箱地址
	        mailInfo.setSubject(subject);
	        mailInfo.setContent(content);
	        mailInfo.setAttachFileNames(fileNames);
	        SimpleMailSender sms = new SimpleMailSender();
	        sms.sendHtmlMail(mailInfo); 
	 }
	 
	 
	 
    
}