package com.kosmo.sns;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kosmo.mapper.SnsMapper;

@Service
public class SnsServiceImpl implements SnsService{

	@Autowired
	private SnsMapper snsdao;

	
	@Override
	public ArrayList<SnsFeedVO> snsFeedList() {
		return snsdao.snsFeedList();
	}
	
	@Override
	public Map<String , Object> snsCommentList(int feseq,int sseq,int eseq) {
		SnsFeedVO fvo=snsdao.snsFeedDetail(feseq);
		SnsFeedVO hList=snsdao.snsHashtagList(feseq);
		SnsImgVO iList=snsdao.snsImgdetail(feseq);
		ArrayList<SnsCommentVO> clist=snsdao.snsCommentList(feseq, sseq, eseq);
		ArrayList<SnsFeedVO> felist=snsdao.snsFollowersList(fvo.getMseq());
		ArrayList<SnsFeedVO> filist=snsdao.snsFollowingList(fvo.getMseq());
		Map<String , Object> map = new HashMap<String , Object>();
		map.put("cList", clist);
		map.put("fDetail", fvo);
		map.put("feList", felist);
		map.put("fiList", filist);
		map.put("hList", hList);
		map.put("iList", iList);
		
		return map;
	}
	
	@Override
	public ArrayList<SnsFeedVO> snsFollowersList(int mseq) {
		return snsdao.snsFollowersList(mseq);
	}
	
	@Override
	public ArrayList<SnsFeedVO> snsFollowingList(int mseq) {
		
		return snsdao.snsFollowingList(mseq);
	}
	
	@Override
	public SnsFeedVO snsFeedDetail(int feseq) {
		
		return snsdao.snsFeedDetail(feseq);
	}
	

	@Override
	public int snsLike(int feseq) {
		
		return snsdao.snsLike(feseq);
	}

	@Override
	public int snsFeedInsert(SnsFeedVO vo) {
		
		return snsdao.snsFeedInsert(vo);
	}

	@Override
	public int snsInsertService(SnsFeedVO vo,SnsImgVO ivo) {
		int res = 0;
		if(vo.getHtcon() != null){
			res=snsdao.snsHashtagInsert(vo);
			System.out.println("해시태그 인서트 입니당-" + res);
		}
		
		res=snsdao.snsFeedInsert(vo);
		System.out.println("feed 인서트 입니당-" + res);

		res = snsdao.snsImgInsert(ivo);
		System.out.println("image 인서트 입니당-" + res);
		
		return res;
	}

	@Override
	public int snscommentInsert(SnsCommentVO vo) {
		
		return snsdao.snscommentInsert(vo);
	}

	@Override
	public int snsFollowersInsertService(SnsFeedVO vo) {
		int res = 0;
		//팔로워 중복체크
		int checkedMseq =snsdao.snsFollowerCheck(vo.getFeseq(), vo.getMseq());
		if(vo.getMseq() == checkedMseq){
			res = snsdao.snsFollowersdelete(vo.getFemseq(), checkedMseq);
		}
		if(checkedMseq<=0){
			res = snsdao.snsFollowersInsert(vo);
			res = snsdao.snsFollowingInsert(vo);
		}
		return res;
	}

	@Override
	public int snsFollowingInsert(SnsFeedVO vo) {
		
		return snsdao.snsFollowingInsert(vo);
	}

	@Override
	public int snsHashtagInsert(SnsFeedVO vo) {
		
		return snsdao.snsHashtagInsert(vo);
	}

	@Override
	public int snscdeclarationInsert(DeclarationVO vo) {
		
		return snsdao.snscdeclarationInsert(vo);
	}

	@Override
	public int snsfdeclarationInsert(DeclarationVO vo) {
		
		return snsdao.snsfdeclarationInsert(vo);
	}

	@Override
	public int snsCommentupdate(SnsCommentVO vo) {
		
		return snsdao.snsCommentupdate(vo);
	}

	@Override
	public int snsHashtagupdate(SnsFeedVO vo) {
		
		return snsdao.snsHashtagupdate(vo);
	}

	@Override
	public int cdeclarationdelete(int feseq) {
		snsdao.snsCommentDelete(feseq);
		return snsdao.cdeclarationdelete(feseq);
	}

	@Override
	public int fdeclarationdelete(int feseq) {
		snsdao.snsFeedDelete(feseq);
		return snsdao.fdeclarationdelete(feseq);
	}

	@Override
	public int snsFeedDelete(int feseq) {
		
		return snsdao.snsFeedDelete(feseq);
	}

	@Override
	public int snsCommentDelete(int feseq) {
		
		return snsdao.snsCommentDelete(feseq);
	}

	@Override
	public Map<String , Object> snsDeclarationList(int sseq,int eseq) {
		ArrayList<DeclarationVO> fdlist=snsdao.snsfDeclarationList(sseq, eseq);
		ArrayList<DeclarationVO> cdlist=snsdao.snscDeclarationList(sseq, eseq);
		Map<String , Object> map = new HashMap<String , Object>();
		map.put("fdList", fdlist);
		map.put("cdList", cdlist);
		return  map;
	}

	@Override
	public ArrayList<DeclarationVO> snscDeclarationList(int sseq,int eseq) {
		
		return snsdao.snscDeclarationList(sseq, eseq);
	}

	@Override
	public ArrayList<SnsFeedVO> hashtagSearch(String searchStr) {
		return snsdao.hashtagSearch(searchStr);
	}

	@Override
	public ArrayList<SnsFeedVO> snsMypage(int mseq) {
		
		return snsdao.snsMypage(mseq);
	}
 
	@Override
	public ArrayList<SnsFeedVO> snsFollowerspageService(int feseq, int mseq) {
//		팔로워인지 체크
		int fmseq=snsdao.snsFollowerCheck(feseq, mseq);
		return snsdao.snsFollowerspage(fmseq);
	}

	@Override
	public ArrayList<SnsFeedVO> snsallpage(int feseq, int mseq) {
		int fmseq=snsdao.snsFollowerCheck(feseq, mseq);
		return snsdao.snsallpage(fmseq);
	}

	@Override
	public int snsFollowerCheck(int feseq, int mseq) {
		
		return snsdao.snsFollowerCheck(feseq, mseq);
	}

	@Override
	public int fdeclarationCnt() {
		
		return snsdao.fdeclarationCnt();
	}

	@Override
	public int cdeclarationCnt() {
		
		return snsdao.cdeclarationCnt();
	}

	@Override
	public int hashtagSearchCnt() {
		
		return snsdao.hashtagSearchCnt();
	}

	@Override
	public int snsFeedupdate(SnsFeedVO vo, SnsImgVO ivo) {
		int res = 0;
		MultipartFile ufile=ivo.getUfile();
		
		if(ufile == null) {		//기존 첨부파일 유지
			res = snsdao.snsImgupdate(ivo);
			System.out.println("image 업데이트 입니당-" + res);
		}
		if(vo.getHtcon() == null){
			res=snsdao.snsHashtagupdate(vo);
			System.out.println("해시태그 업데이트 입니당-" + res);
		}
		
		res=snsdao.snsFeedupdate(vo);
		System.out.println("feed 업데이트 입니당-" + res);

		return res;
	
	}

	@Override
	public int snsFollowersdelete(int femseq,int mseq) {
		snsdao.snsFollowingCheck(mseq, femseq);
		return snsdao.snsFollowersdelete(femseq,mseq);
	}

	@Override
	public int snsFollowingdelete(int fimseq,int mseq) {
		
		return snsdao.snsFollowingdelete(fimseq, mseq);
	}

	@Override
	public int snsFollowingCheck(int feseq, int mseq) {
		
		return snsdao.snsFollowingCheck(feseq, mseq);
	}

	@Override
	public int snsLikeCheck(int feseq, int mseq) {
		
		return snsdao.snsLikeCheck(feseq, mseq);
	}

	@Override
	public int snsLikeInsert(SnsFeedVO vo) {
		int res=0;
//		좋아요 중복체크
		int check=snsdao.snsLikeCheck(vo.getFeseq(), vo.getMseq());
		if(vo.getMseq()==check){
			res=snsdao.snsLikedelete(vo.getFeseq(),check);
		}
		if(check==0){
			res=snsdao.snsLikedelete(vo.getFeseq(), vo.getMseq());
		}
		return res;
	}

	@Override
	public int snsLikedelete(int feseq, int mseq) {
		
		return snsdao.snsLikedelete(feseq, mseq);
	}

	@Override
	public int snsImgupdate(SnsImgVO vo) {
		
		return snsdao.snsImgupdate(vo);
	}

	@Override
	public int snscommentCnt() {
		
		return snsdao.snscommentCnt();
	}

	@Override
	public SnsFeedVO snsHashtagList(int feseq) {
		
		return snsdao.snsHashtagList(feseq);
	}

	@Override
	public ArrayList<SnsImgVO> snsImgList(int feseq) {
		
		return snsdao.snsImgList(feseq);
	}

	@Override
	public int snsHashtagdelete(int feseq) {
		
		return snsdao.snsHashtagdelete(feseq);
	}

	@Override
	public int snsImgdelete(int feseq) {
		
		return snsdao.snsImgdelete(feseq);
	}

	@Override
	public SnsImgVO snsImgdetail(int feseq) {
		
		return snsdao.snsImgdetail(feseq);
	}

	
	
}
