package com.kosmo.mapper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosmo.applyfarm.ApplyFarmVO;
import com.kosmo.applyfarm.AreaYearVO;
import com.kosmo.applyfarm.FarmInfoVO;




//DAO파일 삭제 -> 인터페이스의 맵퍼화
//인터페이스 이름과 마이바티즈의 매퍼 xml파일의 이름을 동일하게 지정 후, 
//인터페이스의 메서드명과 매퍼xml select,insert,update,delete의 id명이 일치하는 경우 일치하는 id의 sql문으로 자동으로 바인딩됨

@Repository
public interface ApplyFarmMapper {

	/**
	 * 해당년도에 신청한 farm이 있는지 없는지 체크...0이면 없음 1이상이면 있음
	 * @return int
	 */
	public int checkMyFarm(int mseq, int year);
	public ArrayList<String> selectFarmLocation();
	public ArrayList<HashMap<String, Object>> selectFarmName(String fglocation);
	public HashMap<String, Integer> selectFarmArea(int fgseq);
	public int completeApply(ApplyFarmVO vo);
	public int insertAreaNO(AreaYearVO vo);
	

}