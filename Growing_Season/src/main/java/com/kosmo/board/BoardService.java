package com.kosmo.board;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface BoardService {
	
	public String selectMgubun(int mseq);
	
	public Map<String,Object> boardNoticeList(int sseq, int eseq, int mseq);
	
	public ArrayList<BoardVO> boardFreeList(int sseq, int eseq);
	
	public ArrayList<BoardVO> boardProposalList(int sseq, int eseq);
	
	public int boardNoticeInsert(BoardVO vo);
	
	public int boardFreeInsert(BoardVO vo);
	
	public int boardProposalInsert(BoardVO vo);
	
	public BoardVO boardNoticeDetail(int bseq);
	
	public BoardVO boardFreeDetail(int bseq);
	
	public BoardVO boardProposalDetail(int bseq);
	
	public int boardNoticeUpdate(BoardVO vo);
	
	public int boardFreeUpdate(BoardVO vo);
	
	public int boardProposalUpdate(BoardVO vo);
	
	public int boardDelete(int bseq);
	
	public int bDeclarationInsert(BoardVO vo);
	
	public ArrayList<BDeclarationVO> bDeclarationList(int sseq, int eseq);
	
	public int bDeclarationDelete(int bseq);
	
	public Map<String,Object> replyList(int sseq, int eseq,int bseq);
	
	public int replyInsert(ReplyVO vo);
	
	public ReplyVO replyDetail(int rseq);
	
	public int replyUpdate(ReplyVO vo);
	
	public int replyDelete(int rseq);
	
	public int rDeclarationInsert(RDeclarationVO vo);
	
	public ArrayList<RDeclarationVO> rDeclarationList(int sseq, int eseq);
	
	public int rDeclarationDelete(int rseq);
	
	public int boardUpdateForUpload(BoardVO vo);
	
	public int boardNoticeCount();
	
	public int boardFreeCount();
	
	public int boardProposalCount();
	
	public int replyCount();
	
	public int bdeclarationCount();
	
	public int rdeclarationCount();
	
}
