package com.kosmo.common;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

public class HttpClientUtil {

	/**
	 * GET
	 *
	 * @param url       요청할 url
	 * @param params    파라미터 Map
	 * @param encoding  파라미터 Encoding Type
	 * @return 응답본문 문자열
	 */
	public String get(String url) {
		HttpClient client = null;
		String htmlStr = "";
		try {
			client = new DefaultHttpClient();
			HttpGet get = new HttpGet(url);
			System.out.println("================================");
			System.out.println("GET : " + get.getURI());
			System.out.println("================================");
			
			HttpResponse response = client.execute(get);
			HttpEntity resEntity = response.getEntity();
			if (resEntity != null) {
				htmlStr = EntityUtils.toString(resEntity,"euc-kr");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return htmlStr;
	}
}
