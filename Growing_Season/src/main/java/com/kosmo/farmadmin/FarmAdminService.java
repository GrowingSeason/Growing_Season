package com.kosmo.farmadmin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface FarmAdminService {
	
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