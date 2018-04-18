package com.kosmo.applyfarm;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kosmo.mapper.ApplyFarmMapper;

@Service
public class ApplyFarmServiceImpl implements ApplyFarmService {
	
	@Autowired
	private ApplyFarmMapper applyFarmMapper;
	
	@Autowired
	private SmsAuth smsAuth;
	
	public ArrayList<String> selectFarmLocation(){		
		return applyFarmMapper.selectFarmLocation();
	}

	public ArrayList<HashMap<String, Object>> selectFarmName(String fglocation){
		return applyFarmMapper.selectFarmName(fglocation);		
	}
	
	public HashMap<String, Object> selectFarmArea(int fgseq){
		HashMap<String, Object> farmAreaInfo = applyFarmMapper.selectFarmArea(fgseq);
		farmAreaInfo.put("aready", applyFarmMapper.farmAreadyReservationList(fgseq));
		return farmAreaInfo;
	}
	public ArrayList<FarmInfoVO> myApplyFarmInfo(int mseq, int year){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("mseq", mseq);
		map.put("year", year);
		return applyFarmMapper.myApplyFarmInfo(map);
		
	}
	public void inserttemp(AreaYearVO vo){
		applyFarmMapper.insertAreaNO(vo);
	}
	
	public FarmInfoVO selectFarmInfo(int fgseq){
		return applyFarmMapper.selectFarmInfo(fgseq);		
	}
	
	public boolean cancelMyFarm(ApplyFarmVO vo){
		int res1 = applyFarmMapper.applyCancel(vo);
		int res2 = applyFarmMapper.applyCancelForAreaYear(vo);
		if(res1>=1&&res2>=1){
			return true;
		}else{
			return false;		
		}
	}
	
	public boolean sendSmsAuthNumber(String phoneNumber){
		
		String smsAuthNumber = smsAuth.getAuthNumber(phoneNumber);
	/*	
		HashMap resMap = new HashMap();
	
		RestTemplate template = new RestTemplate();
		String hostname = "api.bluehouselab.com";
		String url = "https://"+hostname+"/smscenter/v1.0/sendsms";
		HttpHeaders headers = new HttpHeaders();
		String base = "farmproject:cfbd7d6e3c9711e881a80cc47a1fcfae";
		byte[] encoding = Base64.encodeBase64(base.getBytes());
		String headerValue = new String(encoding,0,encoding.length);
		System.out.println(headerValue);
		
		headers.add("Authorization","basic " + headerValue);
		headers.add("Content-type", "application/json; charset=utf-8");
		
		
		String sender = "01086219081";
		String receivers = phoneNumber;
		String content = "인증번호는 [" + smsAuthNumber + "] 입니다 3분이내로 입력해주세요";
		
		// 이사이는 테스트...필요...--------------------
//		MultiValueMap<String, String> sendSmsInfo = new LinkedMultiValueMap<String, String>();
//		sendSmsInfo.add("\"sender\"", "\"01086219081\"");
//		sendSmsInfo.add("\"receivers\"", "[\"01086219081\",]");
//		sendSmsInfo.add("\"content\"", "\"sms테스트...\"");
		//----------------------------------------
		 
		System.out.println("여긴가?");
		String json = "{\"sender\":\""+sender+"\",\"receivers\":[\""+receivers+"\"],\"content\":\""+content+"\"}";
		
		HttpEntity<String> request = new HttpEntity<String>(json, headers);
		ResponseEntity<String> res = template.postForEntity(url, request, String.class);
		System.out.println("상태는" + res.getStatusCode());
		System.out.println(res);
		
		System.out.println(resMap.get("sent"));
	 */
	
		//if(res.getStatusCode().toString().equals("200")){
			HashMap<String, Object> sendSmsMap = new HashMap<String, Object>();
			sendSmsMap.put("authnumber", smsAuthNumber);
			sendSmsMap.put("phoneNumber", phoneNumber);
			
			applyFarmMapper.farmSmsValidateUpdate(phoneNumber);
			applyFarmMapper.farmSmsInsert(sendSmsMap);
			return true;
		//}else{
		//	return false;
		//}
		
	}
	
	public HashMap<String, Object> checkAuthNumber(String authNumber, String phoneNumber){
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("authNumber", authNumber);
		map.put("phoneNumber", phoneNumber);
		applyFarmMapper.checkOvertimeSmsAuthValidate(map);
		HashMap<String, Object> returnMap = applyFarmMapper.checkSmsAuthValidate(map);
		
		System.out.println(phoneNumber);
		System.out.println(authNumber);
		
		
		System.out.println(returnMap.get("authvalidate"));
		//System.out.println(res);
		
		if(returnMap.get("authvalidate").toString().equals("y")){
			String res = applyFarmMapper.checkSmsAuthValidate(map).get("smsseq").toString();
			int smsseq = Integer.parseInt(res);
			applyFarmMapper.farmSmsAuthResultUpdate(smsseq);
		}
		
		
		return returnMap;
	
	}
}
