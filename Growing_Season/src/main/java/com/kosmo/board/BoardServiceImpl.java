package com.kosmo.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired  
	private BoardMapper boarddao;

	@Override
	public String selectMgubun(int mseq) {
		return boarddao.selectMgubun(mseq).getMgubun();
	}
	
	@Override
	public Map<String,Object> boardNoticeList(int sseq, int eseq, int mseq) {
		String mgubun=boarddao.selectMgubun(mseq).getMgubun();
		ArrayList<BoardVO> list=boarddao.boardNoticeList(sseq, eseq);
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("Mgubun", mgubun);
		map.put("nList", list);		
		return map;
	}

	@Override
	public ArrayList<BoardVO> boardFreeList(int sseq, int eseq) {
		return boarddao.boardFreeList(sseq, eseq);
	}

	@Override
	public ArrayList<BoardVO> boardProposalList(int sseq, int eseq) {
		return boarddao.boardProposalList(sseq, eseq);
	}

	@Override
	public int boardNoticeInsert(BoardVO vo) {
		return boarddao.boardNoticeInsert(vo);
	}

	@Override
	public int boardFreeInsert(BoardVO vo) {
		return boarddao.boardFreeInsert(vo);
	}

	@Override
	public int boardProposalInsert(BoardVO vo) {
		return boarddao.boardProposalInsert(vo);
	}

	@Override
	public BoardVO boardNoticeDetail(int bseq) {
		return boarddao.boardNoticeDetail(bseq);
	}
	
	@Override
	public BoardVO boardFreeDetail(int bseq) {
		return boarddao.boardFreeDetail(bseq);
	}
	
	@Override
	public BoardVO boardProposalDetail(int bseq) {
		return boarddao.boardProposalDetail(bseq);
	}

	@Override
	public int boardNoticeUpdate(BoardVO vo) {
		boarddao.boardUpdateForUpload(vo);
		return boarddao.boardNoticeUpdate(vo);
	}

	@Override
	public int boardFreeUpdate(BoardVO vo) {
		boarddao.boardUpdateForUpload(vo);
		return boarddao.boardFreeUpdate(vo);
	}
	
	@Override
	public int boardProposalUpdate(BoardVO vo) {
		boarddao.boardUpdateForUpload(vo);
		return boarddao.boardProposalUpdate(vo);
	}

	@Override
	public int boardDelete(int bseq) {
		return boarddao.boardDelete(bseq);
	}

	@Override
	public int bDeclarationInsert(BDeclarationVO vo) {
		return boarddao.bDeclarationInsert(vo);
	}

	@Override
	public ArrayList<BDeclarationVO> bDeclarationList() {
		return boarddao.bDeclarationList();
	}

	@Override
	public int bDeclarationDelete(int bseq) {
		return boarddao.bDeclarationDelete(bseq);
	}

	@Override
	public Map<String,Object> replyList(int sseq, int eseq,int bseq) {
		BoardVO fvo=boarddao.boardFreeDetail(bseq);
		ArrayList<ReplyVO> freeRvo= boarddao.replyList(sseq, eseq, bseq);
		
		BoardVO pvo=boarddao.boardProposalDetail(bseq);
		ArrayList<ReplyVO> proposalRvo= boarddao.replyList(sseq, eseq, bseq);
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("freedetail", fvo);
		map.put("proposaldetail", pvo);
		map.put("freerlist", freeRvo);
		map.put("proposalrlist", proposalRvo);
		return map;
	}

	@Override
	public int replyInsert(ReplyVO vo) {
		return boarddao.replyInsert(vo);
	}
	
	@Override
	public ReplyVO freereplyDetail(int rseq) {
		return boarddao.freereplyDetail(rseq);
	}
	
	@Override
	public ReplyVO proposalreplyDetail(int rseq) {
		return boarddao.proposalreplyDetail(rseq);
	}

	@Override
	public int replyUpdate(ReplyVO vo) {
		return boarddao.replyUpdate(vo);
	}

	@Override
	public int replyDelete(int rseq) {
		return boarddao.replyDelete(rseq);
	}

	@Override
	public int rDeclarationInsert(RDeclarationVO vo) {
		return boarddao.rDeclarationInsert(vo);
	}

	@Override
	public ArrayList<RDeclarationVO> rDeclarationList(int sseq, int eseq) {
		return boarddao.rDeclarationList(sseq, eseq);
	}

	@Override
	public int rDeclarationDelete(int rseq) {
		return boarddao.rDeclarationDelete(rseq);
	}

	@Override
	public int boardUpdateForUpload(BoardVO vo) {
		return boarddao.boardUpdateForUpload(vo);
	}

	@Override
	public int boardNoticeCount() {
		return boarddao.boardNoticeCount();
	}

	@Override
	public int boardFreeCount() {
		return boarddao.boardFreeCount();
	}

	@Override
	public int boardProposalCount() {
		return boarddao.boardProposalCount();
	}

	@Override
	public int replyCount() {
		return boarddao.replyCount();
	}

	@Override
	public int bdeclarationCount() {
		return boarddao.bdeclarationCount();
	}

	@Override
	public int rdeclarationCount() {
		return boarddao.rdeclarationCount();
	}
	
	
	public ArrayList<BoardVO> bDdetailList() {
		
		ArrayList<BoardVO> bdList=boarddao.boardAndDeclarationList(new BoardVO());  //bDeclarationList();

		return bdList;
	}
	
	public ArrayList<ReplyVO> rDdetailList() {

		ArrayList<ReplyVO> rdList=boarddao.replyAndDeclarationList(new ReplyVO());  //rDeclarationList();

		return rdList;
	}

	

}
