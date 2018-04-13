package com.kosmo.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.mapper.MemberMapper;

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
	public int payment(@Param("mseq")int mseq, @Param("apseq")int apseq, @Param("pprice")int pprice, @Param("ppermit")String ppermit){
		return dao.payment(mseq, apseq, pprice, ppermit);
	}
	
	public boolean memID(@Param("mid")String mid){
		return dao.memID(mid);
	}
}
