package com.kosmo.mapper;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import com.kosmo.farmadmin.ApplyVO;
import com.kosmo.farmadmin.DocumentVO;
import com.kosmo.farmadmin.FarmGardenVO;
import com.kosmo.farmadmin.MemberVO;


@Repository("farmdao")
public interface FarmAdminMapper {
	
	public ArrayList<MemberVO> applyList(MemberVO mvo);
	public int applyListCount();
	public ArrayList<FarmGardenVO> farmlocationList(FarmGardenVO fgvo);
	public ArrayList<FarmGardenVO> farmnameList(FarmGardenVO fgvo);
	public ArrayList<FarmGardenVO> fList(FarmGardenVO fgvo);
	public ArrayList<FarmGardenVO> searchlocList(FarmGardenVO fgvo);
	public ArrayList<FarmGardenVO> searchfarmList(FarmGardenVO fgvo);
	public int farmInsert(FarmGardenVO fgvo);
	public int farmUpdate(FarmGardenVO fgvo);
	public int farmDelete(FarmGardenVO fgvo);
	public ArrayList<ApplyVO> lottoList(ApplyVO avo);
	public int lottoListCount();
	public ArrayList<MemberVO> usingList(MemberVO mvo);
	public FarmGardenVO areaList(FarmGardenVO fgvo);
	public ArrayList<ApplyVO> locnameApply(ApplyVO avo);
	public ArrayList<FarmGardenVO> locnameAreaCount(FarmGardenVO fgvo);
	public int lottoUpdate(ApplyVO avo);
	public ArrayList<ApplyVO> winnerList(ApplyVO avo);
	public int returnUpdate(DocumentVO dvo);
	public int assignUpdate(int mseq);
	public ArrayList<FarmGardenVO> fieldList(FarmGardenVO fgvo);
	
}
