package com.kosmo.board;

import java.io.IOException;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test {


	private static CloseableHttpClient clientBuilder;
	
	public static void main(String[] args) {

		clientBuilder = HttpClientBuilder.create().build();

		String url = "http://www.dytechtool.com/prod_event.asp?event_idx=155#pageStart";

		String htmlStr = new Test().get(url);

		// Jsoup 파싱
		Document parseDoc = Jsoup.parse(htmlStr);
		Elements elemList = new Elements();
		Element elem = null;
		String imgsrc = "";
		String baseURL = "http://www.dytechtool.com";
		String productName = "제품명";
		String price = "0";
		
		elem = parseDoc.select("ul.pro_list").get(0);
		elemList = elem.select("li");
		for(Element data : elemList){
//			System.out.println(data.text()); 
			imgsrc = data.select("img").attr("src");
			System.out.println(baseURL + imgsrc);
			
			productName = data.select("a.pro_list_name").text();			
			System.out.println(productName);
			
			price = data.select("li").select("p.pro_price").text();
			System.out.println(price);
			
		}
		
		try {
			clientBuilder.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

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
