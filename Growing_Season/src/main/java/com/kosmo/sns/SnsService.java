package com.kosmo.sns;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


public interface SnsService {

//	sns피드리스트
	public ArrayList<SnsFeedVO> snsFeedList();
	
//	sns댓글리스트
	public Map<String , Object> snsCommentList(int feseq,int sseq,int eseq);
	
//	팔로워리스트
	public ArrayList<SnsFeedVO> snsFollowersList(int mseq);
	
//	팔로잉리스트
	public ArrayList<SnsFeedVO> snsFollowingList(int mseq);
	
//	sns 피드 상세보기
	public SnsFeedVO snsFeedDetail(int feseq);
	
//	sns 좋아요
	public int snsLike(int feseq);
	
//	sns 피드 등록
	public int snsFeedInsert(SnsFeedVO vo);
	
//	sns이미지등록
	public int snsInsertService(SnsFeedVO vo,SnsImgVO ivo);
	
//	sns댓글 등록
	public int snscommentInsert(SnsCommentVO vo);
	
//	팔로워 등록
	public int snsFollowersInsertService(SnsFeedVO vo);
	
//	팔로잉 등록
	public int snsFollowingInsert(SnsFeedVO vo);
	
//	해시태그 등록
	public int snsHashtagInsert(SnsFeedVO vo);
	
//	댓글신고
	public int snscdeclarationInsert(DeclarationVO vo);
	
//	피드신고
	public int snsfdeclarationInsert(DeclarationVO vo);
	
//	댓글수정
	public int snsCommentupdate(SnsCommentVO vo);
	
//	해시태그수정
	public int snsHashtagupdate(SnsFeedVO vo);
	
//	피드글 수정
	public int snsFeedupdate(SnsFeedVO vo,SnsImgVO ivo);
	
//	신고댓글삭제
	public int cdeclarationdelete(int feseq);
	
//	신고피드삭제
	public int fdeclarationdelete(int feseq);
	
//	신고피드 fedelete값 변경
	public int snsFeedDelete(int feseq);
	
//	신고댓글 fedelete값 변경
	public int snsCommentDelete(int feseq);
	
//	신고피드 리스트
	public Map<String , Object> snsDeclarationList(int sseq,int eseq);
	
//	신고댓글 리스트
	public ArrayList<DeclarationVO> snscDeclarationList(int sseq,int eseq);
	
//	해시태그 검색
	public ArrayList<SnsFeedVO> hashtagSearch(String searchStr);
	
//	sns Mypage
	public ArrayList<SnsFeedVO> snsMypage(int mseq);
	
//	팔로워가 볼수있는 페이지
	public ArrayList<SnsFeedVO> snsFollowerspageService(int feseq, int mseq);
	
//	회원이 다 볼수 있는 페이지
	public ArrayList<SnsFeedVO> snsallpage(int feseq, int mseq);
	
//	팔로워 인지 아닌지 체크
	public int snsFollowerCheck(
			int feseq,
			int mseq
			);
	
//	피드 신고글 카운트
	public int fdeclarationCnt();
	
//	댓글신고 카운트
	public int cdeclarationCnt();
	
//	해시태그 검색 카운트
	public int hashtagSearchCnt();
	
//	댓글 카운트
	public int snscommentCnt();
	
//	팔로워가 등록되어 있으면 삭제
	public int snsFollowersdelete(int femseq,int mseq);
	
//	팔로잉이 등록되어 있으면 삭제
	public int snsFollowingdelete(int fimseq,int mseq);
	
	public int snsFollowingCheck(
			int feseq,
			int mseq
			);
	
//	좋아요 중복 체크
	public int snsLikeCheck(
			@Param("feseq") int feseq,
			@Param("mseq") int mseq
			);
	
//	좋아요 등록
	public int snsLikeInsert(SnsFeedVO vo);
	
//	좋아요 되어 있으면 삭제
	public int snsLikedelete(
			int feseq,
			int mseq
			);
	
//	댓글 수정
	public int snsImgupdate(SnsImgVO vo);
	
//	feseq에 해당하는 해시태그 목록
	public SnsFeedVO snsHashtagList(int feseq);
	
//	feseq에 해당하는 이미지 목록
	public ArrayList<SnsImgVO> snsImgList(int feseq);
	
//	feseq에 해당하는 이미지
	public SnsImgVO snsImgdetail(int feseq);
	
//	신고피드 fedelete값 변경
	public int snsHashtagdelete(@Param("feseq") int feseq);
	
//	신고피드 fedelete값 변경
	public int snsImgdelete(@Param("feseq") int feseq);
	
}