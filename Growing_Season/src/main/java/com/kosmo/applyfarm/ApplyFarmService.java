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
	public HashMap<String, Integer> selectFarmArea(int fgseq);

}
