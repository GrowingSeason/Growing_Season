package com.kosmo.garden;

import java.util.ArrayList;


public interface GardenService {

	public ArrayList<ApplyGardenVO> applyGardenList();
	
	public ApplyGardenVO applyGardenByMseq(int mseq);
	
	public int documentInsert(DocumentVO vo);
	
	public ArrayList<DocumentVO> documentListByMseq(int mseq);
	
	//텃밭신청입력
	public int applyGardenInsert(ApplyGardenVO avo);
	
	
	public ArrayList<String> getFgDivision();
	
	public ArrayList<String> getFgDetailDiv(String fgDivision);
	
	public ArrayList<String> getFgLocation(String fgDetailDiv);
	
	public ArrayList<String> getFgName(String fgDivision, String fgDetailDiv, String fgLocation);
	
	public FarmGardenVO getFgInfo(String fgDivision, String fgDetailDiv, String fgLocation,String fgName);
	
	public int applyGardenPayComplete(int apseq);
	
	public FarmGardenVO getFgInfoByFseq(int fgseq);
	
	public MemberVO getMemberInfo(int mseq);
	
	public int applyGardenCntByMseq(int mseq);
	
	public int documentReturnChange(int mseq);
	
	public int documentReturnCount(int mseq);
	
	public int applyGardenCancel(int apseq);
	
}
