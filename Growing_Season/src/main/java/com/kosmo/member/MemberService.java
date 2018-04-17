package com.kosmo.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kosmo.payment.PaymentVO;

public interface MemberService {

	/**
	 * 입력
	 * @param MemberVO
	 * @return int
	 */
	public int memberInsert(MemberVO vo);

	/**
	 *
	 * @return
	 */
	//public int boardCount();

	/**
	 * 수정
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
	 * @return BoardVO
	 */
	public MemberVO memberDetail(int mseq);

	/**
	 * 목록
	 * @return List<MemberVO>
	 */
	public List<MemberVO> memberAdminList(@Param("sseq") int sseq, @Param("eseq") int eseq);
	//public ArrayList<MemberVO> boardList(int sseq, int eseq, String searchGubun, String searchStr);

	/**
	 *
	 * @return
	 */
	public int memberCount();

	/**
	 *
	 * @return MemverVO
	 */
	public MemberVO loginCheck(@Param("mid")String mid, @Param("mpw")String mpw);

	//텃밭 결제 정보 insert
	public int paymentInsertForGarden(PaymentVO pvo);
	
	public int memIDCheck(@Param("mid")String mid);
	
}
