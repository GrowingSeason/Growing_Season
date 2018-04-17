package com.kosmo.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.garden.ApplyGardenVO;
import com.kosmo.mapper.ApplyFarmMapper;
import com.kosmo.mapper.MemberMapper;
import com.kosmo.payment.PaymentVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper dao;
	private SqlSession sql;
	private ApplyFarmMapper applyFarmMapper;
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
	
	//@Override
	//public int paymentInsert(PaymentVO pvo){
		//int res = 0;
		//kakao결제완료 후 서비스 호출시 받아오는 값은 mseq랑 금액
		//추가로 필요한건 apseq하나다
		
		//페이로그를 인서트하는 sql을 불러옴... 넘겨주는 값을 vo에담아준다
		
		//mseq랑 금액은 담겨있으니 패스
		//여기서 재엽, 지현 메서드를 가져와야함
		//비회원 결제시 여기서는 회원가입하고나서 신청서를 인서트하고 나서 apseq를 돌려줌
		//비회원 폼 받아서 가입하는 메서드 멤버에서 호출하고 셀렉트키로 mseq를 리턴
		//그다음에 mseq를 받아서 mvo에 set해줌
		//그걸가지고 apply테이블 인서트 하면서 셀렉트키로 apseq를 리턴
		//apseq를 리턴받아서 pvo set해주머
		//pvo로 페이로그를 인서트
//		int insert = dao.payment(mseq, apseq, pprice, ppermit);
//		int update = dao.----update(\\\\); //apseq 결제완료
		
//		int res = dao.paymentFormInsert(pvo);
//		res = dao.paymentInsert(pvo);
//		res = dao.pcodeUpdate(pvo.getApseq());
		
		//return res;
	//}
	
	@Override
	public int paymentInsertForGarden(PaymentVO pvo){
		
		ApplyGardenVO gardenData = dao.applyGardenData(pvo.getMseq());
		
		pvo.setApseq(gardenData.getApseq());
		
		return dao.paymentInsertForGarden(pvo);
		//kakao결제완료 후 서비스 호출시 받아오는 값은 mseq랑 금액
		//추가로 필요한건 apseq하나다
		
		//페이로그를 인서트하는 sql을 불러옴... 넘겨주는 값을 vo에담아준다
		
		//mseq랑 금액은 담겨있으니 패스
		//여기서 재엽, 지현 메서드를 가져와야함
		//비회원 결제시 여기서는 회원가입하고나서 신청서를 인서트하고 나서 apseq를 돌려줌
		//비회원 폼 받아서 가입하는 메서드 멤버에서 호출하고 셀렉트키로 mseq를 리턴
		//그다음에 mseq를 받아서 mvo에 set해줌
		//그걸가지고 apply테이블 인서트 하면서 셀렉트키로 apseq를 리턴
		//apseq를 리턴받아서 pvo set해주머
		//pvo로 페이로그를 인서트
//		int insert = dao.payment(mseq, apseq, pprice, ppermit);
//		int update = dao.----update(\\\\); //apseq 결제완료
		
//		int res = dao.paymentFormInsert(pvo);
//		res = dao.paymentInsert(pvo);
//		res = dao.pcodeUpdate(pvo.getApseq());
		
//		return res;
	}
	
	public int memIDCheck(@Param("mid")String mid){
        
        return dao.memIDCheck(mid);
        
    }
	
	//결제//////////서비스
	
	
}
