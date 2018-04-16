package com.kosmo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosmo.garden.ApplyGardenVO;
import com.kosmo.garden.DocumentVO;
import com.kosmo.garden.FarmGardenVO;
import com.kosmo.garden.MemberVO;

@Repository("gardenDao")//ServiceImpl에 @Autowired GardenMapper gardenDao<<<< 요부분
public interface GardenMapper {

//	public int boardCount();

//	public ArrayList<BoardVO> boardListForSearch(@Param("sseq") int sseq, @Param("eseq") int eseq, @Param("searchGubun") String searchGubun, @Param("searchStr") String searchStr);

	public ArrayList<ApplyGardenVO> applyGardenList();
	
	public ApplyGardenVO applyGardenByMseq(int mseq);
	
	public int documentInsert(DocumentVO dvo);
	
	public ArrayList<DocumentVO> documentListByMseq(int mseq);
	
	public int applyGardenInsert(ApplyGardenVO avo);
	

	public ArrayList<String> getFgDivision();

	public ArrayList<String> getFgDetailDiv(String fgDivision);
	
	public ArrayList<String> getFgLocation(String fgDetailDiv);

	public ArrayList<String> getFgName(@Param("fgDivision") String fgDivision,@Param("fgDetailDiv")  String fgDetailDiv,@Param("fgLocation")  String fgLocation);

	public int getFgSeq(@Param("fgDivision") String fgDivision,@Param("fgDetailDiv")  String fgDetailDiv,@Param("fgLocation")  String fgLocation,@Param("fgName")  String fgName);
	
	public FarmGardenVO getFgInfo(int fgseq);
	
	public int applyGardenPayComplete(int apseq);
	
	public MemberVO getMemberInfo(int mseq);
	
	public int applyGardenCntByMseq(int mseq);
	
	public int documentReturnChange(int apseq);
	
	public int documentReturnCount(int apseq);
	
	public int applyGardenCancel(int apseq);
	
}
