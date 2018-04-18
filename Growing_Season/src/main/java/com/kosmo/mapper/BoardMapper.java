package com.kosmo.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosmo.board.BDeclarationVO;
import com.kosmo.board.BoardVO;
import com.kosmo.board.RDeclarationVO;
import com.kosmo.board.ReplyVO;

@Repository("boarddao")
public interface BoardMapper {

	public BoardVO selectMgubun(@Param("mseq") int mseq);
	
	public ArrayList<BoardVO> boardNoticeList(@Param("sseq") int sseq,@Param("eseq") int eseq);
	
	public ArrayList<BoardVO> boardFreeList(@Param("sseq") int sseq,@Param("eseq") int eseq);
	
	public ArrayList<BoardVO> boardProposalList(@Param("sseq") int sseq,@Param("eseq") int eseq);
	
	public int boardNoticeInsert(BoardVO vo);
	
	public int boardFreeInsert(BoardVO vo);
	
	public int boardProposalInsert(BoardVO vo);
	
	public BoardVO boardNoticeDetail(int bseq);
	
	public BoardVO boardFreeDetail(int bseq);
	
	public BoardVO boardProposalDetail(int bseq);
	
	public int boardNoticeUpdate(BoardVO vo);
	
	public int boardFreeUpdate(BoardVO vo);
	
	public int boardProposalUpdate(BoardVO vo);
	
	public ArrayList<BoardVO> boardAndDeclarationList(BoardVO vo);
	
	public ArrayList<ReplyVO> replyAndDeclarationList(ReplyVO vo);
	
	public int boardDelete(int bseq);
	
	public int bDeclarationInsert(BDeclarationVO vo);
	
	public ArrayList<BDeclarationVO> bDeclarationList();
	public ArrayList<BDeclarationVO> bDeclarationListByBseq(int bseq);
	

	public int bDeclarationDelete(int bseq);
	
	public ArrayList<ReplyVO> replyList(@Param("sseq") int sseq,@Param("eseq") int eseq, @Param("bseq") int bseq);
	
	public int replyInsert(ReplyVO vo);
	
	public ReplyVO freereplyDetail(int rseq);
	
	public ReplyVO proposalreplyDetail(int rseq);
	
	public int replyUpdate(ReplyVO vo);
	
	public int replyDelete(int rseq);
	
	public int rDeclarationInsert(RDeclarationVO vo);
	
	public ArrayList<RDeclarationVO> rDeclarationList(@Param("sseq") int sseq,@Param("eseq") int eseq);
	
	public int rDeclarationDelete(int rseq);
	
	public int boardUpdateForUpload(BoardVO vo);
	
	public int boardNoticeCount();
	
	public int boardFreeCount();
	
	public int boardProposalCount();
	
	public int replyCount();
	
	public int bdeclarationCount();
	
	public int rdeclarationCount();
	
	public Map<String,Object> bDdetailList();
	
	public Map<String,Object> rDdetailList();
	
}
