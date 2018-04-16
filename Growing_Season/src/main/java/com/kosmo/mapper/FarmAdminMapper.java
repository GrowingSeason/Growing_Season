package com.kosmo.mapper;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import com.kosmo.farmadmin.ApplyVO;
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
	public int silverDivCount(FarmGardenVO fgvo);
	public ArrayList<ApplyVO> silverApplyCount(ApplyVO avo);
	public int manyBabyDivCount(FarmGardenVO fgvo);
	public ArrayList<ApplyVO> manyBabyApplyCount(ApplyVO avo);
	public int manyCultureDivCount(FarmGardenVO fgvo);
	public ArrayList<ApplyVO> manyCultureApplyCount(ApplyVO avo);
	public int silverLotto(ApplyVO avo);
	public int manyBabyLotto(ApplyVO avo);
	public int manyCultureLotto(ApplyVO avo);
	public ArrayList<ApplyVO> lottoList(ApplyVO avo);
	public int lottoListCount();
}