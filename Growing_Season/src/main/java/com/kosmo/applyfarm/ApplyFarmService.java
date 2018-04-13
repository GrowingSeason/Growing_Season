package com.kosmo.applyfarm;

import java.util.ArrayList;
import java.util.HashMap;

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
	

}
