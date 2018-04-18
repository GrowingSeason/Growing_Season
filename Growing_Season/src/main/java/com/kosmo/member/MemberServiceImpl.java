package com.kosmo.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.mapper.MemberMapper;
import com.kosmo.payment.PaymentVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper dao;
	private SqlSession sql;
//	public void setBoardDAO(BoardDAO dao) {
//		this.dao = dao;
//	}
	
	@Override
	public int memberInsert(MemberVO vo) {
//		 int res = 0;
//		 res = dao.boardInsert(vo);
//		 System.out.println("나 vo 1번입력");
//		 int num = 10/0;
//		 res = dao.boardInsert(vo);
//		 System.out.println("나 vo 2번입력");
//		 return res;
		 return dao.memberInsert(vo);
	 }
	
	@Override
	public int memberDelete(int mseq){
		return dao.memberDelete(mseq);
	}
	
	@Override
	public MemberVO memberDetail(int mseq){
		return dao.memberDetail(mseq);
	}

	@Override
	public List<MemberVO> memberAdminList(@Param("sseq") int sseq, @Param("eseq") int eseq) {
		// TODO Auto-generated method stub
		return dao.memberAdminList(sseq, eseq);
	}

	@Override
	public int memberCount() {
		// TODO Auto-generated method stub
		return dao.memberCount();
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.memberUpdate(vo);
	}

	@Override
	public MemberVO loginCheck(@Param("mid")String mid, @Param("mpw")String mpw) {
		return dao.loginCheck(mid, mpw);
	}
	
	@Override
	public int paymentInsert(PaymentVO pvo){
		int res = 0;
//		int insert = dao.payment(mseq, apseq, pprice, ppermit);
//		int update = dao.----update(\\\\); //apseq 결제완료
		
//		int res = dao.paymentFormInsert(pvo);
//		res = dao.paymentInsert(pvo);
//		res = dao.pcodeUpdate(pvo.getApseq());
		
		return res;
	}
	
	public int memIDCheck(@Param("mid")String mid){
        
        return dao.memIDCheck(mid);
        
    }
	
}
