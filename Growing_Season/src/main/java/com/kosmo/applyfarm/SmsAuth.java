package com.kosmo.applyfarm;

import org.springframework.stereotype.Component;

@Component
public class SmsAuth {
	
	private String authNumber;
	
	public String getAuthNumber(String phoneNumber) {
		int res = 0;
		do{
			double d = Math.random();
			System.out.println(d);
			res = (int) (d * 1000000);
			System.out.println(res);
		}while(res<100000);
		
		this.authNumber = Integer.toString(res);
		return authNumber;
	}

/*
	public static void main(String args[]){
		SmsAuth sms = new SmsAuth();
		sms.getAuthNumber();
	}
*/

}
