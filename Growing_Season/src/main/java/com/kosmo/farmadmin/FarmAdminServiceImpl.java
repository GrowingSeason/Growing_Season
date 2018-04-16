package com.kosmo.farmadmin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.mapper.FarmAdminMapper;

@Service
public class FarmAdminServiceImpl implements FarmAdminService {
	
	@Autowired
	private FarmAdminMapper dao;
	
	@Override
	public ArrayList<MemberVO> applyList(MemberVO mvo) {
		ArrayList<MemberVO> list = dao.applyList(mvo);
		return list;
	}

	@Override
	public int applyListCount() {
		int count = dao.applyListCount();
		return count;
	}

	@Override
	public ArrayList<FarmGardenVO> farmlocationList(FarmGardenVO fgvo) {
		ArrayList<FarmGardenVO> list = dao.farmlocationList(fgvo);
		return list;
	}

	@Override
	public ArrayList<FarmGardenVO> farmnameList(FarmGardenVO fgvo) {
		ArrayList<FarmGardenVO> list = dao.farmnameList(fgvo);
		return list;
	}

	@Override
	public ArrayList<FarmGardenVO> fList(FarmGardenVO fgvo) {
		ArrayList<FarmGardenVO> list = dao.fList(fgvo);
		return list;
	}

	@Override
	public ArrayList<FarmGardenVO> searchlocList(FarmGardenVO fgvo) {
		ArrayList<FarmGardenVO> list = dao.searchlocList(fgvo);
		return list;
	}

	@Override
	public ArrayList<FarmGardenVO> searchfarmList(FarmGardenVO fgvo) {
		ArrayList<FarmGardenVO> list = dao.searchfarmList(fgvo);
		return list;
	}

	@Override
	public int farmInsert(FarmGardenVO fgvo) {
		int res = 0;
		res = dao.farmInsert(fgvo);
		return res;
	}

	@Override
	public int farmUpdate(FarmGardenVO fgvo) {
		int res = 0;
		res = dao.farmUpdate(fgvo);
		return res;
	}

	@Override
	public int farmDelete(FarmGardenVO fgvo) {
		int res = 0;
		res = dao.farmDelete(fgvo);
		return res;
	}

	@Override
	public int silverDivCount(FarmGardenVO fgvo) {
		int res = 0;
		res = dao.silverDivCount(fgvo);
		return res;
	}
	
	@Override
	public ArrayList<ApplyVO> silverApplyCount(ApplyVO avo) {
		ArrayList<ApplyVO> list = dao.silverApplyCount(avo);
		return list;
	}
	
	@Override
	public int manyBabyDivCount(FarmGardenVO fgvo) {
		int res = 0;
		res = dao.manyBabyDivCount(fgvo);
		return res;
	}

	@Override
	public ArrayList<ApplyVO> manyBabyApplyCount(ApplyVO avo) {
		ArrayList<ApplyVO> list = dao.manyBabyApplyCount(avo);
		return list;
	}

	@Override
	public int manyCultureDivCount(FarmGardenVO fgvo) {
		int res = 0;
		res = dao.manyCultureDivCount(fgvo);
		return res;
	}

	@Override
	public ArrayList<ApplyVO> manyCultureApplyCount(ApplyVO avo) {
		ArrayList<ApplyVO> list = dao.manyCultureApplyCount(avo);
		return list;
	}

	@Override
	public int silverLotto(ApplyVO avo) {
		int res = 0;
		res = dao.silverLotto(avo);
		return res;
	}

	@Override
	public int manyBabyLotto(ApplyVO avo) {
		int res = 0;
		res = dao.manyBabyLotto(avo);
		return res;
	}

	@Override
	public int manyCultureLotto(ApplyVO avo) {
		int res = 0;
		res = dao.manyCultureLotto(avo);
		return res;
	}

	@Override
	public ArrayList<ApplyVO> lottoList(ApplyVO avo) {
		ArrayList<ApplyVO> list = dao.lottoList(avo);
		return list;
	}

	@Override
	public int lottoListCount() {
		int count = dao.lottoListCount();
		return count;
	}

	@Override
	public ArrayList<MemberVO> usingList(MemberVO mvo) {
		ArrayList<MemberVO> list = dao.usingList(mvo);
		return list;
	}

	@Override
	public ArrayList<ApplyVO> areaList(ApplyVO avo) {
		ArrayList<ApplyVO> list = dao.areaList(avo);
		return list;
	}

	
	
}
