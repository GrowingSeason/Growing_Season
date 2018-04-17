package com.kosmo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosmo.garden.ApplyGardenVO;
import com.kosmo.member.MemberVO;
import com.kosmo.payment.PaymentVO;

@Repository("memberdao")
public interface MemberMapper {

	/**
	 * 입력 (member 회원 가입)
	 * @param MemberVO
	 * @return int
	 */
	public int memberInsert(MemberVO vo);
	
	/**
	 * 수정(회원 정보 수정)
	 * @param MemberVO
	 * @return int
	 */
	public int memberUpdate(MemberVO vo);
	
	/**
	 * 삭제
	 * @param MemberVO
	 * @return int
	 */
	public int memberDelete(int mseq);
	
	/**
	 * 상세보기
	 * @param MemberVO
	 * @return MemberVO
	 */
	public MemberVO memberDetail(int mseq);
	
	/**
	 * 목록
	 * @return ArrayList<MemberVO>
	 */
	public List<MemberVO> memberAdminList(@Param("sseq") int sseq, @Param("eseq") int eseq);
	
	/**
	 * 카운트
	 * @return
	 */
	public int memberCount();
	
	/**
	 * 로그인
	 * @return MemberVO
	 */
	public MemberVO loginCheck(@Param("mid")String mid, @Param("mpw")String mpw);
	
	//결제 정보 insert
	public int paymentInsertForGarden(PaymentVO pvo);
	
	//신청테이블에서 mseq로 정보 가져오기
	public ApplyGardenVO applyGardenData(int mseq);
	
	//결제상태 apply pcode update
	public int pcodeUpdate(PaymentVO pvo);
	
	public int memIDCheck(@Param("mid")String mid);
}

















