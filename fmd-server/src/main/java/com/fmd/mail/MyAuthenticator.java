package com.fmd.mail;

import javax.mail.*;

/**
 * @author zhouzhou
 * @version 2017年12月18日 下午4:01:42
 * TODO
 */
public class MyAuthenticator extends Authenticator {

    String userName = null;
    String password = null;

    public MyAuthenticator() {
    }
    public MyAuthenticator(String username, String password) {
        this.userName = username;
        this.password = password;
    }
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(userName, password);
    }
}
