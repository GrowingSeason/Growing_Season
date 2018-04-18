package com.kosmo.sns;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.binding.BindingException;
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
		int snslike=snsdao.snsLike(feseq);
		ArrayList<SnsCommentVO> clist=snsdao.snsCommentList(feseq, sseq, eseq);
//		ArrayList<SnsFeedVO> felist=snsdao.snsFollowersList(fvo.getMseq());
//		ArrayList<SnsFeedVO> filist=snsdao.snsFollowingList(fvo.getMseq());
		
		
		int fecnt=snsdao.snsFollwersCnt(fvo.getMseq()); //글쓴이
		int ficnt=snsdao.snsFollwingCnt(fvo.getMseq());	//글쓴이
		Map<String , Object> map = new HashMap<String , Object>();
		map.put("cList", clist);
		map.put("fDetail", fvo);
//		map.put("feList", felist);
//		map.put("fiList", filist);
		map.put("hList", hList);
		map.put("iList", iList);
		map.put("feCnt", fecnt);
		map.put("fiCnt", ficnt);
		map.put("snsLike", snslike);
		
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
		
	    //현재 인덱스
	    int curIdx = 0;
	    //시작 인덱스
	    int startIdx = 0;
	    StringBuffer sb = new StringBuffer();
	    while (curIdx < vo.getFecon().length()) {
	        if (vo.getFecon().charAt(curIdx) == '#') {
	            startIdx = curIdx++;
	            String tag = vo.getFecon().substring(startIdx, vo.getFecon().length());
	            // 빈 문자열이 아니면
	            if ( !tag.isEmpty() ) { 
	                sb.append(tag);
	            }
	        } else {
	            curIdx++;
	        }
	    }
	   vo.setHtcon(sb.toString());
	
		res=snsdao.snsFeedInsert(vo);
		System.out.println("feed 인서트 입니당-" + res);
		System.out.println(vo.getFeseq()+"등록된 feseq");
		ivo.setFeseq(vo.getFeseq());
		if(vo.getHtcon() != null){
			res=snsdao.snsHashtagInsert(vo);
			System.out.println("해시태그 인서트 입니당-" + res);
		}
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
		System.out.println(vo.getFeseq()+"컨트롤러에서 넘어온값");
		System.out.println(vo.getFmseq()+"컨트롤러에서 넘어온값");
		
		//팔로워 중복체크
		int checkedMseq=0;
			checkedMseq=snsdao.snsFollowerCheck(vo.getFeseq(), vo.getMseq());
			System.out.println(checkedMseq+"팔로우 확인된 mseq");
		
		//신규 팔로우 처리	
		if(checkedMseq <= 0){
			res = snsdao.snsFollowersInsert(vo); //내번호 mseq 글쓴이번호 fmseq     
			System.out.println(res+"팔로우 결과 값");
		//기존 팔로우인 경우 : 취소 처리
		}else if(checkedMseq>=1){
			System.out.println("delete");
			res = snsdao.snsFollowersdelete(vo);
			res++;
		}
		
		return res;
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
		if(fmseq!=mseq){
			return snsdao.snsallpage(fmseq);
		}
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
	public int snsFollowersdelete(SnsFeedVO vo) {
		return snsdao.snsFollowersdelete(vo);
	}



	@Override
	public int snsLikeCheck(SnsFeedVO vo) {
		
		return snsdao.snsLikeCheck(vo);
	}

	@Override
	public int snsLikeInsert(SnsFeedVO vo) {
		System.out.println(vo.getFeseq()+"Impl에 넘어온 feseq");
		System.out.println(vo.getMseq()+"Impl에 넘어온 mseq");
		int res=0;
//		좋아요 중복체크
		
		
		int check=0;
		
		try{
			check=snsdao.snsLikeCheck(vo);
		}catch(BindingException e){
		
		}
		
		if(vo.getMseq()==check){
			res=snsdao.snsLikedelete(vo);
			res++;
		}
		if(check==0){
			res=snsdao.snsLikeInsert(vo);
		}
		return res;
	}

	@Override
	public int snsLikedelete(SnsFeedVO vo) {
		
		return snsdao.snsLikedelete(vo);
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
	public ArrayList<SnsImgVO> snsImgList() {
		
		return snsdao.snsImgList();
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

	@Override
	public int snsFollwersCnt(int mseq) {
		// TODO Auto-generated method stub
		return snsdao.snsFollwersCnt(mseq);
	}

	@Override
	public int snsFollwingCnt(int mseq) {
		// TODO Auto-generated method stub
		return snsdao.snsFollwingCnt(mseq);
	}







	
}
