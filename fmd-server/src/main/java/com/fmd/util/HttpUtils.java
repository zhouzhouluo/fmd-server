package com.fmd.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

/**
 * �����Ƿ���Internet��ͨ����
 */
public final class HttpUtils {

	public final static String METHOD_GET = "GET";
	public final static String METHOD_POST = "POST";
	public final static String ENC = "UTF-8";

	public static String openUrl(String url, String method,String gsonString) throws Exception {

//		gsonString = "gsonString="+gsonString;

		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		conn.setRequestMethod("GET");
		conn.setReadTimeout(60000);
		if (method.equalsIgnoreCase("POST")) {
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.getOutputStream().write(gsonString.getBytes());
		}
		InputStream is = conn.getInputStream();

		StringBuilder sb = new StringBuilder();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"), 1000);
		for (String line = br.readLine(); line != null; line = br.readLine()) {
			sb.append(line);
		}

		is.close();
		conn.disconnect();
		return sb.toString();
	}

	/**
	 * ���ʸ�����url
	 * 
	 * @param url
	 * @param method
	 *            ��ָ�����ʵķ�ʽ��GET����POST
	 * @param params
	 *            ��url����Ҫ��װ�Ĳ���
	 * @return
	 */
	public static String openUrl(String url, String method, Map params) throws Exception {

		if (method.equalsIgnoreCase("GET")) {
			url = url + "?" + encodeUrl(params, ENC);
			System.out.println("URL:" + url);
		}

		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		conn.setRequestMethod("GET");
		// conn.setRequestProperty("User-Agent",
		// System.getProperties().getProperty("http.agent"));
		conn.setReadTimeout(60000);

		// �����POST����ʽ������Ҫ���������
		if (method.equalsIgnoreCase("POST")) {
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.getOutputStream().write(encodeUrl(params, ENC).getBytes());
		}
		// ��ȡ������ȡ�����ַ���
		InputStream is = conn.getInputStream();

		StringBuilder sb = new StringBuilder();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"), 1000);
		for (String line = br.readLine(); line != null; line = br.readLine()) {
			sb.append(line);
		}

		is.close();
		conn.disconnect();
		return sb.toString();
	}

	/**
	 * ���ʸ�����url
	 * 
	 * @param url
	 * @param method
	 *            ָ�����ʵķ�ʽ��GET����POST
	 * @param params
	 *            url����Ҫ��װ�Ĳ���
	 * @param sendCharset
	 *            ������Ϣʹ�õ��ַ���
	 * @param getCharset
	 *            ������Ϣʹ�õ��ַ���
	 * @return
	 * @throws Exception
	 */
	public static String openUrl(String url, String method, Map params, String sendCharset,
			String getCharset) throws Exception {

		if (method.equalsIgnoreCase("GET")) {
			url = url + "?" + encodeUrl(params, sendCharset);
			System.out.println("URL:" + url);
		}

		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		conn.setRequestMethod("GET");
		// conn.setRequestProperty("User-Agent",
		// System.getProperties().getProperty("http.agent"));
		conn.setReadTimeout(60000);

		// �����POST����ʽ������Ҫ���������
		if (method.equalsIgnoreCase("POST")) {
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.getOutputStream().write(encodeUrl(params, sendCharset).getBytes());
		}
		// ��ȡ������ȡ�����ַ���
		InputStream is = conn.getInputStream();

		StringBuilder sb = new StringBuilder();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, getCharset), 1000);
		for (String line = br.readLine(); line != null; line = br.readLine()) {
			sb.append(line);
		}

		is.close();
		conn.disconnect();
		return sb.toString();
	}

	/**
	 * ��Bundle��װ�Ĳ���������url��ʽ�Ĳ���
	 * 
	 * @param parameters
	 * @return
	 */
	public static String encodeUrl(Map parameters, String enc) {
		if (parameters == null || parameters.size() == 0)
			return "1=1";
		StringBuilder sb = new StringBuilder();
		boolean first = true;
		Set entry = parameters.entrySet();
		for (Iterator iterator = entry.iterator(); iterator.hasNext();) {
			Entry keyObject = (Entry) iterator.next();
			if (null == keyObject.getValue() || "".equalsIgnoreCase((String) keyObject.getValue())) {
				continue;
			}
			if (first)
				first = false;
			else
				sb.append("&");
			try {
				sb.append(keyObject.getKey() + "="
						+ URLEncoder.encode((String) keyObject.getValue(), enc));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}
}