package com.fmd.util;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import javax.crypto.spec.IvParameterSpec;

/**
 * 加密工具类
 * @author luoyizhou
 *
 */
public class EncryptUtil {

	// 密钥
	private final static String secretKey  = "guangdongzhaoqing@fmd.com";
	// 向量
	private final static String iv = "01234567";
	// 加解密统一使用的编码方式
	private final static String encoding = "utf-8";

	/**
	 * 
	 * @param plainText
	 * @return
	 * @throws Exception
	 */
	public static String encode(String plainText) throws Exception {
		Key deskey = null;
		DESedeKeySpec spec = new DESedeKeySpec(secretKey.getBytes());
		SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("desede");
		deskey = keyfactory.generateSecret(spec);
		Cipher cipher = Cipher.getInstance("desede/CBC/PKCS5Padding");
		IvParameterSpec ips = new IvParameterSpec(iv.getBytes());
		cipher.init(Cipher.ENCRYPT_MODE, deskey, ips);
		byte[] encryptData = cipher.doFinal(plainText.getBytes(encoding));
		return EncryptBase64Util.encode(encryptData);
	}

	/**
	 * 
	 * @param encryptText 加密文本
	 * @return
	 * @throws Exception
	 */
	public static String decode(String encryptText) throws Exception {
		Key deskey = null;
		DESedeKeySpec spec = new DESedeKeySpec(secretKey.getBytes());
		SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("desede");
		deskey = keyfactory.generateSecret(spec);
		Cipher cipher = Cipher.getInstance("desede/CBC/PKCS5Padding");
		IvParameterSpec ips = new IvParameterSpec(iv.getBytes());
		cipher.init(Cipher.DECRYPT_MODE, deskey, ips);
		byte[] decryptData = cipher.doFinal(EncryptBase64Util.decode(encryptText));
		return new String(decryptData, encoding);
	}
	public static void main(String[] args){
		String test = "111111";
		try {
			test = EncryptUtil.encode(test);
			System.out.println(test);
			System.out.println(EncryptUtil.decode(test));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}