package com.kosmo.applyfarm;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.mapper.ApplyFarmMapper;

@Service
public class ApplyFarmServiceImpl implements ApplyFarmService {
	
	@Autowired
	private ApplyFarmMapper applyFarmMapper;
	
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
	public ArrayList<FarmInfoVO> myApplyFarmInfo(int mseq){
		return applyFarmMapper.myApplyFarmInfo(mseq);
		
	}
	public void inserttemp(AreaYearVO vo){
		applyFarmMapper.insertAreaNO(vo);
	}
	
	public FarmInfoVO selectFarmInfo(int fgseq){
		return applyFarmMapper.selectFarmInfo(fgseq);		
	}
}
