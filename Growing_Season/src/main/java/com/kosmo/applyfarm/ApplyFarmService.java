package com.kosmo.applyfarm;

import java.util.ArrayList;
import java.util.HashMap;

import com.kosmo.payment.PaymentVO;

public interface ApplyFarmService {
	
	/**
	 * 농장지역list를 보여줌
	 * @return ArrayList<String> 
	 */
	public ArrayList<String> selectFarmLocation();
	public ArrayList<HashMap<String, Object>> selectFarmName(String fglocation);
	public HashMap<String, Object> selectFarmArea(int fgseq);
	public void inserttemp(AreaYearVO vo);
	public ArrayList<FarmInfoVO> myApplyFarmInfo(int mseq, int year);
	public FarmInfoVO selectFarmInfo(int fgseq);
	public boolean cancelMyFarm(ApplyFarmVO vo);
	public boolean sendSmsAuthNumber(String phoneNumber);
	public HashMap<String, Object> checkAuthNumber(String authNumber, String phoneNumber);
	public ArrayList<HashMap<String, Object>> selectFarmList();
	public void ApplyCompletForMenber(ApplyFarmVO vo, PaymentVO pvo);
	public void ApplyCompletForNonJoin(ApplyFarmVO vo, PaymentVO pvo);
	public HashMap<String, Object> checkHaveFarm(int mseq, int year);
	

}
