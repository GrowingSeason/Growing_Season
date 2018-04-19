package com.kosmo.garden;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.mapper.GardenMapper;

@Service
public class GardenServiceImpl implements GardenService {

	
	@Autowired
	private GardenMapper gardenDao;

	@Override
	public ArrayList<ApplyGardenVO> applyGardenList() {
		// TODO Auto-generated method stub
		return gardenDao.applyGardenList();
	}

	@Override
	public ApplyGardenVO applyGardenByMseq(int mseq) {
		// TODO Auto-generated method stub
		return gardenDao.applyGardenByMseq(mseq);
	}

	@Override
	public int documentInsert(DocumentVO dvo) {
		return gardenDao.documentInsert(dvo);
	}

	@Override
	public ArrayList<DocumentVO> documentListByMseq(int mseq) {
		return gardenDao.documentListByMseq(mseq);
	}

	@Override
	public int applyGardenInsert(ApplyGardenVO avo) {
		return gardenDao.applyGardenInsert(avo);
	}


	@Override
	public ArrayList<String> getFgDivision() {
		return gardenDao.getFgDivision();
	}

	@Override
	public ArrayList<String> getFgDetailDiv(String fgDivision) {
		return gardenDao.getFgDetailDiv(fgDivision);
	}

	@Override
	public ArrayList<String> getFgLocation(String fgDetailDiv) {
		return gardenDao.getFgLocation(fgDetailDiv);
	}

	@Override
	public ArrayList<String> getFgName(String fgDivision, String fgDetailDiv, String fgLocation){
		System.out.println(fgDivision+ fgDetailDiv+ fgLocation+"잘옴");
		return gardenDao.getFgName(fgDivision, fgDetailDiv, fgLocation);
	}

	@Override
	public FarmGardenVO getFgInfo(String fgDivision, String fgDetailDiv, String fgLocation,String fgName) {
		

		int i = gardenDao.getFgSeq(fgDivision,fgDetailDiv,fgLocation,fgName);

		FarmGardenVO vo = gardenDao.getFgInfo(i);
		
		return vo;
	}

	@Override
	public int applyGardenPayComplete(int apseq) {
		return gardenDao.applyGardenPayComplete(apseq);
	}

	@Override
	public FarmGardenVO getFgInfoByFseq(int fgseq) {
		return gardenDao.getFgInfo(fgseq);
	}

	@Override
	public MemberVO getMemberInfo(int mseq) {
		return gardenDao.getMemberInfo(mseq);
	}

	@Override
	public int applyGardenCntByMseq(int mseq) {
		return gardenDao.applyGardenCntByMseq(mseq);
	}

	@Override
	public int documentReturnChange(int apseq) {
		return gardenDao.documentReturnChange(apseq);
	}

	@Override
	public int documentReturnCount(int apseq) {
		return gardenDao.documentReturnCount(apseq);
	}

	@Override
	public int applyGardenCancel(int apseq) {
		return gardenDao.applyGardenCancel(apseq);
	}


	
	
}
