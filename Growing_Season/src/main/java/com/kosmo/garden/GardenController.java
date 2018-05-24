package com.kosmo.garden;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.kosmo.common.Converter;

@Controller

public class GardenController {
	

	//지현이형자리
	String upload_file_dir="C:\\34DEV\\Growing_Season_git\\Growing_Season\\src\\main\\webapp\\uploads";
	
	//때요비자리
	//String upload_file_dir="C:\\GrowingSeason\\Growing_Season\\Growing_Season\\src\\main\\webapp\\uploads";
	
	String savedPath = "\\thumbnail";
	
	@Autowired
	GardenService service;

	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/applyGarden/user/applyGarden_step1.do")
	public ModelAndView applyGardenStep1(HttpServletRequest request, HttpServletResponse response) {

		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		int mseq = (Integer)session.getAttribute("LVL_SESS_MSEQ");
		MemberVO mvo = service.getMemberInfo(mseq);

		mav.addObject("LVL_MVO",mvo);
		mav.setViewName("applyGarden_garden_user_applygarden_step1");
		return mav;
	}



	@RequestMapping(value="/applyGarden/user/applyGarden_step2.do")
	public ModelAndView applyGardenStep2(HttpServletRequest request,HttpServletResponse response, 
			@RequestParam(value="fgseq") int fgseq
			,@RequestParam(value="apdivision") String apdivision
			,HttpSession session) {



		ModelAndView mav = new ModelAndView();

		//		HttpSession session = request.getSession();
		int mseq = (Integer)session.getAttribute("LVL_SESS_MSEQ");

		MemberVO mvo = service.getMemberInfo(mseq);

		FarmGardenVO fgvo = service.getFgInfoByFseq(fgseq);
		System.out.println(fgvo.getFgaddress());
		mav.addObject("LVL_FGVO",fgvo);
		mav.addObject("LVL_MVO",mvo);
		mav.addObject("LVL_FGSEQ", fgseq);
		mav.addObject("LVL_APDIVISION", apdivision);

		mav.setViewName("applyGarden_garden_user_applygarden_step2");
		return mav;
	}

	@RequestMapping(value="/apply/all/apply_main.do")
	public ModelAndView applyMain(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("apply_apply_all_apply_main");
		return mav;
	}


	@RequestMapping(value="/applyGarden/user/documentInsert.do")
	public String applyGardenInsert(HttpServletRequest request,@ModelAttribute(value = "dvo") DocumentVO dvo, 
			@ModelAttribute(value = "avo") ApplyGardenVO avo,
			@RequestParam(value="files") MultipartFile [] files) throws IOException{
		int tryNum=0;


		HttpSession session = request.getSession();
		int mseq = (Integer)session.getAttribute("LVL_SESS_MSEQ");

		int cnt = service.applyGardenCntByMseq(mseq);

		if(cnt==0){//기존 신청서가 없을때만.
			int r = service.applyGardenInsert(avo);
			System.out.println(r+"건 입력");
		}

		ApplyGardenVO avo2 = service.applyGardenByMseq(mseq);

		int apseq = avo2.getApseq();
		dvo.setApseq(apseq);



		//반려된 서류가 있을경우, 반려된 기존서류들의 dreturn컬럼값을 'NN'으로 변경
		int dr = service.documentReturnChange(apseq);
		System.out.println(dr+"건 NN으로 변경");
		String fullPath = "";


		for(int i=0;i<files.length;i++){
			//Multipart+어노테이션이용
			if(!files[i].isEmpty()) { // multipart파일 : byte[] 타입. 
				fullPath = upload_file_dir+"\\"+dvo.getMseq()+"_"+files[i].getOriginalFilename(); 
				File newFile = new File(fullPath); //파일생성. path에 파일 만듬. 아직 빈깡통상태.
				dvo.setDfileSize(newFile.length()); // 사이즈 아직 0

				try {
					files[i].transferTo(newFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				dvo.setDfileSize(files[i].getSize()); // 이제 사이즈 0 아님 ㅎ
				dvo.setDfilePath(upload_file_dir); // 경로 셋
				dvo.setDfileName(dvo.getMseq()+"_"+files[i].getOriginalFilename());
			}
			service.documentInsert(dvo);
			
//			//썸네일 미리보기용 이미지 생성
			String ext = files[i].getOriginalFilename().substring(files[i].getOriginalFilename().lastIndexOf(".")+1);
			
//	        try {
//            	if (ext != null) {
//            		new ThumbnailUtil().makeThumbnail(upload_file_dir, savedPath, dvo.getMseq()+"_"+files[i].getOriginalFilename());
//            	}
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
	        
			InputStream is = new FileInputStream(new File(fullPath)); // new URL(fullPath).openStream();	//
			OutputStream os = new FileOutputStream(new File(upload_file_dir+"\\thumbnail\\"+dvo.getMseq()+"_"+files[i].getOriginalFilename()+".png"));
			
			if(ext.equals("ppt")) {
				Converter.ppt2png(is, os);
			} else if(ext.equals("pptx")) {
				Converter.pptx2png(is, os);
			} else if(ext.equals("docx")) {	
				Converter.docx2png(is, os); ; //response.getOutputStream());
			} else if(ext.equals("pdf")) {
				Converter.pdf2pngUsingPdfBox(is, os);
			} else {
				System.out.println("Unknown format: " + ext);
			}
			
			tryNum++;
		}



		System.out.println("총"+tryNum + "건 업로드");

		return "redirect:/applyGarden/user/applyGarden_complete.do";
	}

	@RequestMapping(value="/myGarden/user/cancelGarden.do")
	public String applyCancel(HttpServletRequest request,@RequestParam("apseq") int apseq) {

		int res = service.applyGardenCancel(apseq);
		System.out.println(res + "건 취소됨. apseq = "+apseq);
		return "redirect:/myApplyCondition/all/applyCondition_main.do";
	}

	



	@RequestMapping(value="/applyGarden/user/applyGarden_complete.do")
	public ModelAndView applyGardenComplete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("applyGarden_garden_user_applygarden_complete");
		return mav;
	}



	@RequestMapping(value="/applyGarden/user/applyGarden_payment.do")
	public ModelAndView applyGardenPaymentPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("applyGarden_garden_user_applygarden_payment");
		return mav;
	}




	@RequestMapping(value="/applyGarden/user/applyGarden_payexecute.do")
	public String applyGardenPayment(HttpServletRequest request,HttpServletResponse response, @RequestParam String pay) {

		HttpSession session = request.getSession();
		int mseq = (Integer)session.getAttribute("LVL_SESS_MSEQ");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ApplyGardenVO avo = service.applyGardenByMseq(mseq);

		int i = service.applyGardenPayComplete(avo.getApseq());

		System.out.println(i+"건 입력 완료");
		out.println("<script>alert('결제처리가 완료되었습니다.')</script>");


		return "redirect:/myGarden/user/mygarden_condition";
	}


	@RequestMapping(value="/applyGarden/user/applyGarden_document.do")
	public ModelAndView document(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		int mseq = (Integer)session.getAttribute("LVL_SESS_MSEQ");
		ArrayList<DocumentVO> dlist = service.documentListByMseq(mseq);
		mav.addObject("LVL_DOCLIST",dlist); 
		mav.setViewName("applyGarden_garden_user_mygarden_document");
		return mav;
	}





	@RequestMapping(value="/location/all/farmLocation.do")
	public ModelAndView farmAddress(HttpServletRequest request){

		ModelAndView mav = new ModelAndView();

		ArrayList<String> fgdivList = service.getFgDivision();

		mav.addObject("LVL_FGDIVLIST",fgdivList);
		mav.setViewName("applyGarden_garden_all_farm_location");
		return mav;
	}









	@RequestMapping(value="/findFarmAddress1.do")
	@ResponseBody
	public ArrayList<String> findFarmAddress1(HttpServletRequest request, HttpServletResponse response, @RequestParam String fgDivision){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");

		System.out.println(fgDivision);
		ArrayList<String> fgDetailDivList = service.getFgDetailDiv(fgDivision);
		System.out.println(fgDetailDivList.size()+"사이즈");

		return fgDetailDivList;
	}


	@RequestMapping(value="/findFarmAddress2.do")
	@ResponseBody
	public ArrayList<String> findFarmAddress2(HttpServletRequest request, HttpServletResponse response,@RequestParam String fgDetailDiv){

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		System.out.println(fgDetailDiv);
		ArrayList<String> fgLocationList = service.getFgLocation(fgDetailDiv);
		System.out.println(fgLocationList.size()+"사이즈");

		return fgLocationList;
	}



	@RequestMapping(value="/findFarmAddress3.do")
	@ResponseBody
	public ArrayList<String> findFarmAddress3(HttpServletRequest request, HttpServletResponse response,@RequestParam String fgDivision,@RequestParam String fgDetailDiv,@RequestParam String fgLocation){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");

		System.out.println(fgDivision+fgDetailDiv+fgLocation);
		ArrayList<String> fgNameList = service.getFgName(fgDivision, fgDetailDiv, fgLocation);
		System.out.println(fgNameList.size()+"사이즈");
		return fgNameList;
	}

	@RequestMapping(value="/findFarmAddress4.do")
	@ResponseBody
	public FarmGardenVO findFarmAddress4(HttpServletRequest request, HttpServletResponse response,@RequestParam String fgDivision,@RequestParam String fgDetailDiv,
			@RequestParam String fgLocation,@RequestParam String fgName){

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");

		FarmGardenVO fvo = service.getFgInfo(fgDivision, fgDetailDiv, fgLocation, fgName);
		return fvo;
	}



	@RequestMapping(value="/myApplyCondition/all/applyCondition_main.do")
	public ModelAndView applyConditionMain(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("applyGarden_garden_all_applycondition_main");
		return mav;
	}	



	@RequestMapping(value="/myGarden/user/mygarden_condition.do")
	public ModelAndView gardenCondition(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		int mseq = (Integer)session.getAttribute("LVL_SESS_MSEQ");

		ApplyGardenVO avo = service.applyGardenByMseq(mseq);
		ArrayList<DocumentVO> docList = service.documentListByMseq(mseq);

		FarmGardenVO fgvo = service.getFgInfoByFseq(avo.getFgseq());

		String docuReturn="";

		int apseq = service.applyGardenByMseq(mseq).getApseq();

		if(service.documentReturnCount(apseq)==0){
			docuReturn="N" ;
		}else{
			docuReturn="Y" ;	
		}

		String dreturnCause="";
		for(int i=0;i<docList.size();i++){
			if(docList.get(i).getDreturnCause()!=null){
				dreturnCause=docList.get(i).getDreturnCause();
				break;
			}
		}


		mav.addObject("LVL_DRETURNCAUSE",dreturnCause);
		mav.addObject("LVL_DOCURETURN",docuReturn);
		mav.addObject("LVL_DOCLIST",docList);
		mav.addObject("LVL_AGVO", avo);
		mav.addObject("LVL_FGVO",fgvo);
		mav.setViewName("applyGarden_garden_user_mygarden_condition");
		return mav;
	}	
	
	
	@RequestMapping(value="/apply/all/please_login.do")
	public ModelAndView loginPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("apply_apply_all_please_login");
		return mav;
	}	
	
	
	@RequestMapping(value="/MailTest.do")
	public String  mailTest(HttpServletRequest request) {
		String setfrom = "someday0328@gmail.com";         
	    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
	    String title   = request.getParameter("title");      // 제목
	    String content = request.getParameter("content");    // 내용
	   
	    ArrayList<String> list = service.emailList();
	    
	    String[] array = new String[list.size()];
	    String temp = "";
	    
	    System.out.println(list.size());
	    System.out.println(array.length);
	    for(int i=0;i<list.size();i++){
	    	temp = list.get(i); 
	    	array[i] = temp;
	    	System.out.println(array[i]+" ");
	    }
	    
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	      
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      //messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setTo(array); // 받는사람'들' 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	     
	      String s ="<div style=\"width: 800px; height: 800px; background-color: #307509;\">" 
	      		    + "<table  style=\"width:80%; margin-left:10%; padding-top:10%;\">"
	      		    +"<tr><td style=\"width: 100%; height: 300px; background-color: white;\"><img src=\"https://cdn.pixabay.com/photo/2014/12/17/14/20/summer-anemone-571531_960_720.jpg\"></td></tr>"
	      		    +"<tr><td></td></tr>"
	      		    +"<tr><td></td></tr>"
	      		    +"<tr><td></td></tr>"
	      		    +"</table>"
	      		    +"</div>";
	      messageHelper.setText("",s);  // 메일 내용
	     
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    return "redirect:/index.do";
	  }
	
	
	// 매월 ??일 금요일 12시 0분 0초에 메일을 보냅니다.
	@Scheduled(cron="0 36 16 ? * MON") 
	//@Scheduled(fixedDelay=1000)
	public void  scheduleTest2() {
		String setfrom = "someday0328@gmail.com";         
	    ArrayList<String> list = service.emailList();
	    Date date = new Date();
	    
	    SimpleDateFormat date2 = new SimpleDateFormat("yyyy/MM/dd");
	    
	    String today = date2.format(date); 
	    
	    
	    String[] array = new String[list.size()];
	    String temp = "";
	    
	    System.out.println(list.size());
	    System.out.println(array.length);
	    for(int i=0;i<list.size();i++){
	    	temp = list.get(i); 
	    	array[i] = temp;
	    	System.out.println(array[i]+" ");
	    }
	    
	    try {
	    	
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	      
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      //messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setTo(array); // 받는사람'들' 이메일
	      messageHelper.setSubject(today+" Growing Season 날씨 정기메일입니다."); // 메일제목은 생략이 가능하다
	     
	      StringBuffer mailContent = new StringBuffer();
	      String start = "<div style=\"width: 800px; height: 800px; background-color: #307509;\">" 
	      		    + "<table  style=\"width:80%; margin-left:10%; padding-top:10%;\">"
	      		    +"<tr><td style=\"width: 100%; height: 300px; background-color: white;\"><img src=\"https://fg.startupbridgeva.com/f/m3R/TOS/87M/TslJyOl2NgyLdcyucyyNC-tJDEzrcDItDjF1EivIC994hSms0wNZxkdVuSXliTll-alAAA.png\"></td></tr>";
	      
	      mailContent.append(start);
	      
	      for(int i=0;i<list.size();i++){
	      String content = "<tr><td></td></tr>"
	      		    +"<tr><td></td></tr>"
	      		    +"<tr><td></td></tr>";
	      }
	      
	      String end ="</table>"+"</div>";
	      
	      
	      
	      messageHelper.setText("","요기");  // 메일 내용
	     
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
		
		
		
		
	}
	
	@Scheduled(cron="0 0 22 ? * FRI,SAT")
	//@RequestMapping(value="/w.do")
	public void weatherTest(){

		System.out.println("weatherTest 시작");
		//String openWeatherApiURL = "http://api.openweathermap.org/data/2.5/weather?id=1840536&units=metric&APPID=cb23fdw17cf4f9db78ac4f5e5209c82ba3";
		String openWeatherApiURL = "http://api.openweathermap.org/data/2.5/forecast?q=Seoul&lang=kr&appid=46b61ee5117a80b49cf7a80f1647fe28";
		//String openWeatherApiURL = "http://api.openweathermap.org/data/2.5/forecast?lat=37.566535&lon=126.97796919999996&units=metric&lang=kr&appid=46b61ee5117a80b49cf7a80f1647fe28";
		
		
		ResponseHandler<String> responseHandler = new ResponseHandler<String>() {
			@Override
			public String handleResponse(final HttpResponse response)
					throws ClientProtocolException, IOException {
				int status = response.getStatusLine().getStatusCode();
				if (status >= 200 && status < 300) {
					HttpEntity entity = response.getEntity();
					return entity != null ? EntityUtils.toString(entity) : null;
				} else {
					throw new ClientProtocolException("Unexpected response status: " + status);
				}
			}
		};
		
		
		ArrayList<HashMap<String,String>> mapList = new ArrayList <HashMap<String,String>>();
		HttpGet httpGet;
        CloseableHttpClient httpclient = HttpClients.createDefault();
        try {
        	Gson gson = new Gson();
            httpGet = new HttpGet(openWeatherApiURL);
            String jsonResult = httpclient.execute(httpGet,responseHandler);

            JsonObject jsonObject = gson.fromJson(jsonResult, JsonObject.class);
            
            JsonElement jsonElement = gson.fromJson(jsonObject.get("list"), JsonElement.class);
            JsonArray jsonArray = gson.fromJson(jsonElement, new TypeToken<JsonArray>(){}.getType());
            JsonArray subArray = null;


            
            
            
            
            //for(int i=0; i<jsonArray.size(); i++) {
            for(int i=3; i<11; i++) { // 1일 22시에 보낼경우 2일 00시, 03시, 06시, 09시, 12시, 15시, 18시, 21시, 3일00시 까지 날아감 
                JsonObject subObject = (JsonObject)jsonArray.get(i);
                JsonElement subElement = gson.fromJson(subObject.get("weather"), JsonElement.class);
                JsonElement subElement2 = gson.fromJson(subObject.get("main"), JsonElement.class);
                subArray = gson.fromJson(subElement, new TypeToken<JsonArray>(){}.getType());
                
                JsonArray ja = gson.fromJson(jsonElement, new TypeToken<JsonArray>(){}.getType());
                JsonObject jo = (JsonObject)ja.get(i);
                JsonElement je = gson.fromJson(jo.get("dt_txt"), JsonElement.class);
                //je = 2018-05-24 15:00:00
                
                for(int j=0; j<subArray.size(); j++) { //size 1
                 	subObject = (JsonObject)subArray.get(j);
                    
                 	subElement = gson.fromJson(subObject.get("description"), JsonElement.class);
                    //subElement = "구름 조금"
                 	
                    
                }
                
                
                
                JsonObject j = subElement2.getAsJsonObject();
                //j.get("temp"); 285.2 (화씨)
                
                HashMap<String, String> map = new HashMap<String,String>();
                
                map.put("시각", je.toString());
                map.put("날씨", subElement.toString());
                
                double d = Double.parseDouble(j.get("temp").toString())-273.15;
                double tempc = Double.parseDouble(String.format("%.2f",d));
                map.put("기온", Double.toString(tempc)+"°C");
                
//                System.out.println("시각 : "+je.toString());
//                System.out.println("날씨 : "+subElement.toString());
//                System.out.println("기온 : "+tempc+"°C");
                mapList.add(i-3, map);	
                
            }
            
            for(int i=0;i<mapList.size();i++){
            	System.out.println(mapList.get(i).get("시각"));
            	System.out.println(mapList.get(i).get("날씨"));
            	System.out.println(mapList.get(i).get("기온"));
            	System.out.println("---------------------");
            }
            
            
            
            
           
//            JsonElement jsonElement = gson.fromJson(jsonObject.get("city"), )
            if (jsonResult != null && !"".equals(jsonResult)) {
                ObjectMapper mapper = new ObjectMapper();
                mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
//                WeatherVO wvo = mapper.readValue(jsonResult, WeatherVO.class);
//                System.out.println("ㅎㅎ"+jsonResult);
//                Gson gson = new Gson();
//                WeatherVO wvo2= gson.fromJson(jsonResult, WeatherVO.class);
//                
//                System.out.println(wvo2.getMain().getTemp());
            }
            
/*            JSONObject jobj = new JSONObject(jsonResult);
            System.out.println(jobj.toString());
            System.out.println(jobj.get("city"));*/
            
            
            
            
            
            httpclient.close();
            
            
            
            
            
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
       
        
        String setfrom = "someday0328@gmail.com";         
	    ArrayList<String> list = service.emailList();
	    Date date = new Date();
	    
	    SimpleDateFormat date2 = new SimpleDateFormat("yyyy/MM/dd");
	    
	    String today = date2.format(date); 
	    
	    
	    String[] array = new String[list.size()];
	    
	    System.out.println(list.size());
	    System.out.println(array.length);
	    for(int i=0;i<list.size();i++){
	    	array[i] = list.get(i); 
	    	 
	    	System.out.println(array[i]+" ");
	    }
	    
	    try {
	    	
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	      
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      //messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setTo(array); // 받는사람'들' 이메일
	      messageHelper.setSubject(today+" Growing Season 날씨 정기메일입니다."); // 메일제목은 생략이 가능하다
	      
	      StringBuffer mailContent = new StringBuffer();
	      String start = "<div style=\"width: 800px; background-color: white;\">" 
	      		    + "<table  style=\"width:640px; margin-left:10%; padding-top:10%;\">"
	      		    +"<tr><td colspan=\"2\" \"><img src=\"https://images.twinkl.co.uk/tr/raw/upload/u/planit/image/Geography-KS1-Wonderful-Weather-1.jpg\"></td></tr>"
	      		    +"<tr><td colspan=\"2\">------------------------------------------------------------------------------------------</td></tr>";
	      
	      mailContent.append(start);
	      
	      for(int i=0;i<mapList.size();i++){
	      String content = "<tr><td>시각</td><td>"+mapList.get(i).get("시각")+"</td></tr>"
	      		    +"<tr><td>날씨</td><td>"+mapList.get(i).get("날씨")+"</td></tr>"
	      		    +"<tr><td>기온</td><td>"+mapList.get(i).get("기온")+"</td></tr>"
	      		    +"<tr><td colspan=\"2\">------------------------------------------------------------------------------------------</td></tr>";
	      mailContent.append(content);
	      }
	      String end ="</table></div>";
	      mailContent.append(end);
	      
	      messageHelper.setText("",mailContent.toString());  // 메일 내용
	     
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
        
        
        
        
        
        

	        
	        
	}
	
	
	@RequestMapping(value="/ww.do")
	public void weatherTest2(){
	
		 URL url;//URL 주소 객체
	        URLConnection connection;//URL접속을 가지는 객체

	        InputStream is;//URL접속에서 내용을 읽기위한 Stream
	        InputStreamReader isr;
	        BufferedReader br;

	        try{
	            //URL객체를 생성하고 해당 URL로 접속한다..
	            url = new URL("http://api.openweathermap.org/data/2.5/forecast?lat=37.566535&lon=126.97796919999996&units=metric&lang=kr&appid=46b61ee5117a80b49cf7a80f1647fe28");
	            			//"http://api.openweathermap.org/data/2.5/forecast?lat=37.566535&lon=126.97796919999996&units=metric&lang=kr&appid=46b61ee5117a80b49cf7a80f1647fe28"
	            connection = url.openConnection();
	            //내용을 읽어오기위한 InputStream객체를 생성한다..
	            is = connection.getInputStream();
	            isr = new InputStreamReader(is);
	            br = new BufferedReader(isr);

	            //내용을 읽어서 화면에 출력한다..
	            String buf = null;
	            while(true){
	                buf = br.readLine();
	                if(buf == null) break;
	                System.out.println(buf);
	                int a2 = buf.indexOf("temp");
	                //double temp=Double.parseDouble(buf.substring(a2+6, a2+12))-273.15;
	                System.out.println("서울의 현재 온도(섭씨):"+a2);
	                String s = "";
	                
	            }
	        }catch(MalformedURLException mue){
	            System.err.println("잘못되 URL입니다.");
	            
	        }catch(IOException ioe){
	            System.err.println("IOException " + ioe);
	            ioe.printStackTrace();
	            
	        }
		
	
	}
	
}	
	



