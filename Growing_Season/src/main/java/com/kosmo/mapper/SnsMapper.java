package com.kosmo.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosmo.sns.DeclarationVO;
import com.kosmo.sns.SnsCommentVO;
import com.kosmo.sns.SnsFeedVO;
import com.kosmo.sns.SnsImgVO;

@Repository("snsdao")
public interface SnsMapper {

//	sns피드리스트
	public ArrayList<SnsFeedVO> snsFeedList();
	
//	sns댓글리스트
	public ArrayList<SnsCommentVO> snsCommentList(
			@Param("feseq") int feseq,
			@Param("sseq") int sseq,
			@Param("eseq") int eseq
			);
	
//	팔로워리스트
	public ArrayList<SnsFeedVO> snsFollowersList(@Param("mseq") int mseq);
	
//	팔로잉리스트
	public ArrayList<SnsFeedVO> snsFollowingList(@Param("mseq") int mseq);
	
//	sns 피드 상세보기
	public SnsFeedVO snsFeedDetail(@Param("feseq") int feseq);
	
//	sns 좋아요
	public int snsLike(@Param("feseq") int feseq);
	
//	sns 피드 등록
	public int snsFeedInsert(SnsFeedVO vo);
	
//	sns이미지등록
	public int snsImgInsert(SnsImgVO ivo);
	
//	sns댓글 등록
	public int snscommentInsert(SnsCommentVO vo);
	
//	팔로워 등록
	public int snsFollowersInsert(SnsFeedVO vo);
	
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
	public int snsFeedupdate(SnsFeedVO vo);
	
//	신고댓글삭제
	public int cdeclarationdelete(@Param("feseq") int feseq);
	
//	신고피드삭제
	public int fdeclarationdelete(@Param("feseq") int feseq);
	
//	신고피드 fedelete값 변경
	public int snsFeedDelete(@Param("feseq") int feseq);
	
//	신고댓글 scdelete값 변경
	public int snsCommentDelete(@Param("feseq") int feseq);
	
//	신고피드 리스트
	public ArrayList<DeclarationVO> snsfDeclarationList(
			@Param("sseq") int sseq,
			@Param("eseq") int eseq
			);
	
//	신고댓글 리스트
	public ArrayList<DeclarationVO> snscDeclarationList(
			@Param("sseq") int sseq,
			@Param("eseq") int eseq
			);
	
//	해시태그 검색
	public ArrayList<SnsFeedVO> hashtagSearch(@Param("searchStr") String searchStr);
	
//	sns Mypage
	public ArrayList<SnsFeedVO> snsMypage(@Param("mseq") int mseq);
	
//	팔로워가 볼수있는 페이지
	public ArrayList<SnsFeedVO> snsFollowerspage(@Param("mseq") int mseq);
	
//	회원이 다 볼수 있는 페이지
	public ArrayList<SnsFeedVO> snsallpage(@Param("mseq") int mseq);
	
//	팔로워 인지 아닌지 체크
	public int snsFollowerCheck(
			@Param("feseq") int feseq,
			@Param("mseq") int mseq
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
	public int snsFollowersdelete(
			@Param("femseq") int femseq,
			@Param("mseq") int mseq
			);
	
//	팔로잉이 등록되어 있으면 삭제
	public int snsFollowingdelete(
			@Param("fimseq") int fimseq,
			@Param("mseq") int mseq
			);
	
//	팔로잉 중복체크
	public int snsFollowingCheck(
			@Param("feseq") int feseq,
			@Param("mseq") int mseq
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
			@Param("feseq") int feseq,
			@Param("mseq") int mseq
			);
	
//	댓글 수정
	public int snsImgupdate(SnsImgVO vo);
	
//	feseq에 해당하는 해시태그 목록
	public SnsFeedVO snsHashtagList(@Param("feseq") int feseq);
	
//	feseq에 해당하는 이미지 목록
	public ArrayList<SnsImgVO> snsImgList(@Param("feseq") int feseq);
	
//	신고피드 fedelete값 변경
	public int snsHashtagdelete(@Param("feseq") int feseq);
	
//	신고피드 fedelete값 변경
	public int snsImgdelete(@Param("feseq") int feseq);
	
//	feseq에 해당하는 이미지
	public SnsImgVO snsImgdetail(@Param("feseq")int feseq);
}
