package com.kosmo.board;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.common.PagingUtil;

@Controller
public class BoardController {
	private static final long serialVersionUID = 1L;

	@Autowired
	private BoardService service;   


	private int upload_file_max_size=100000000;
	private String upload_file_format="UTF-8";
	private String upload_file_dir="C:\\34DEV\\git\\Growing_Season\\Growing_Season\\src\\main\\webapp\\boarduploads";

	

	//공지 게시판 리스트
	@RequestMapping(value="/boardnoticelist.do", method = RequestMethod.GET)
	public ModelAndView boardnoticelist(HttpServletRequest request,@RequestParam (value="currentPage", required=false, defaultValue="1") int currentPage) 
	{
		//		HttpSession session=request.getSession();
		//		String mseqStr=(String)session.getAttribute("MSEQ");
		//		int mseq=Integer.parseInt("mseqStr");

		int totalCount = service.boardNoticeCount();

		PagingUtil pu
		= new PagingUtil("/boardnoticelist.do"
				, currentPage
				, totalCount 
				, 5	
				, 5 
				);
		String  html = pu.getPagingHtml();

		int mseq=5;
		Map<String,Object> list = service.boardNoticeList(pu.getStartSeq(), pu.getEndSeq(),mseq);

		System.out.println();

		ModelAndView mav = new ModelAndView();
		mav.addObject("NOTICE_LIST", list.get("nList"));
		mav.addObject("NOTICE_LIST_MGUBUN", list.get("Mgubun"));
		mav.addObject("NOTICE_PAGING", html);
		mav.setViewName("board_board_all_board_noticelist");   

		return mav;
	}

	//자유 게시판 리스트
	@RequestMapping(value="/boardfreelist.do", method = RequestMethod.GET)
	public ModelAndView boardfreelist(@RequestParam (value="currentPage", required=false, defaultValue="1")int currentPage)
	{

		int totalCount = service.boardFreeCount();

		PagingUtil pu
		= new PagingUtil("/boardfreelist.do"
				, currentPage
				, totalCount 
				, 5
				, 5 
				);
		String  html = pu.getPagingHtml();  
		ArrayList<BoardVO> list = service.boardFreeList(pu.getStartSeq(), pu.getEndSeq());

		ModelAndView mav = new ModelAndView();
		mav.addObject("FREE_LIST", list);
		mav.addObject("FREE_PAGING", html);
		mav.setViewName("board_board_all_board_freelist");    

		return mav;
	}

	//건의사항 게시판 리스트
	@RequestMapping(value="/boardproposallist.do", method = RequestMethod.GET)
	public ModelAndView boardproposallist(@RequestParam (value="currentPage", required=false, defaultValue="1")int currentPage)
	{

		int totalCount = service.boardProposalCount();

		PagingUtil pu
		= new PagingUtil("/boardproposallist.do"
				, currentPage
				, totalCount 
				, 5
				, 5 
				);
		String  html = pu.getPagingHtml();

		ArrayList<BoardVO> list = service.boardProposalList(pu.getStartSeq(), pu.getEndSeq());

		ModelAndView mav = new ModelAndView();
		mav.addObject("PROPOSAL_LIST", list);
		mav.addObject("PROPOSAL_PAGING", html);
		mav.setViewName("board_board_all_board_proposallist");    

		return mav;
	}

	//공지 게시판 인서트(관리자만)
	  @RequestMapping(value="/boardnoticeinsert.do")
	   public String boardnoticeinsert(BoardVO vo 
	         ) throws IllegalStateException, IOException {
		  int mseq=5;
		   vo.setMseq(mseq);
	      //신규첨부파일
		  MultipartFile ufile = vo.getUfile();
	      if(vo.getBcon()==null){
				
				return "board_board_admin_board_noticeinsert";	
	      }else if(ufile != null) {
	          String fullPath = upload_file_dir+"\\"+ufile.getOriginalFilename();
	          File newFile = new File(fullPath); 
	          
	             ufile.transferTo(newFile);
	             vo.setBfilesize(ufile.getSize());
	             vo.setBfilepath(upload_file_dir);
	             vo.setBfilename(ufile.getOriginalFilename());
	      }
	           
	      int res = service.boardNoticeInsert(vo);
	      
	      return "redirect:/boardnoticelist.do";
	   } 


	//자유 게시판 인서트
	   @RequestMapping(value="/boardfreeinsert.do")
	   public String boardfreeinsert(BoardVO vo 
	         ) throws IllegalStateException, IOException {
		   int mseq=4;
		   vo.setMseq(mseq);
	      //신규첨부파일
		  MultipartFile ufile = vo.getUfile();
	      if(vo.getBcon()==null){
				
				return "board_board_user_board_freeinsert";	
	      }else if(ufile != null) {
	          String fullPath = upload_file_dir+"\\"+ufile.getOriginalFilename();
	          File newFile = new File(fullPath); 
	          
	             ufile.transferTo(newFile);
	             vo.setBfilesize(ufile.getSize());
	             vo.setBfilepath(upload_file_dir);
	             vo.setBfilename(ufile.getOriginalFilename());
	      }
	           
	      int res = service.boardFreeInsert(vo);
	      
	      return "redirect:/boardfreelist.do";
	   } 

	//건의사항 게시판 인서트
	   @RequestMapping(value="/boardproposalinsert.do")
	   public String boardproposalinsert(BoardVO vo 
	         ) throws IllegalStateException, IOException {
		   int mseq=4;
		   vo.setMseq(mseq);
	      //신규첨부파일
		  MultipartFile ufile = vo.getUfile();
	      if(vo.getBcon()==null){
				
				return "board_board_user_board_proposalinsert";	
	      }else if(ufile != null) {
	          String fullPath = upload_file_dir+"\\"+ufile.getOriginalFilename();
	          File newFile = new File(fullPath); 
	          
	             ufile.transferTo(newFile);
	             vo.setBfilesize(ufile.getSize());
	             vo.setBfilepath(upload_file_dir);
	             vo.setBfilename(ufile.getOriginalFilename());
	      }
	           
	      int res = service.boardProposalInsert(vo);
	     
	      return "redirect:/boardproposallist.do";
	   } 

	 //자유 댓글 상세보기(수정, 삭제 때문에)
	 		@RequestMapping(value="/freereplydetail.do", method = RequestMethod.GET)
	 		public ModelAndView freereplydetail(ReplyVO vo) {
	 			int mseq=4;
	 			String mgubun=service.selectMgubun(mseq);
	 			System.out.println(vo.getMseq()+"mseq");

	 			ModelAndView mav = new ModelAndView();
	 			vo = service.freereplyDetail(vo.getRseq());
	 			mav.addObject("FREE_REPLY_DETAIL", vo);

	 			return mav;
	 		}

	//공지 게시판 상세보기 //mgubun에 따라서 디테일 페이지 다르게 보여줌->admin일 때만 수정, 삭제 가능하게 
	@RequestMapping(value="/boardnoticedetail.do", method = RequestMethod.GET)
	public ModelAndView boardnoticedetail(BoardVO vo) {
		int mseq=5;
		String mgubun=service.selectMgubun(mseq);
		System.out.println(vo.getMseq()+"set전 mseq");
		System.out.println(vo.getBtitle()+"가지고 들어온 vo");
		System.out.println(vo.getMseq()+"set이후 mseq");

		ModelAndView mav = new ModelAndView();
		vo = service.boardNoticeDetail(vo.getBseq());
		mav.addObject("NOTICE_DETAIL", vo);
		mav.addObject("MGUBUN", mgubun);

		if(mgubun==null){
			mav.setViewName("board_board_all_board_noticedetail");
		}
		else if(mgubun.equals("A")){
			mav.setViewName("board_board_admin_board_noticedetail");
			System.out.println("A들어옴");
		}
		else if(!mgubun.equals("A")){
			mav.setViewName("board_board_all_board_noticedetail");
			System.out.println("A아님");
		}
		return mav;
	}


	//자유 게시판 상세보기
	@RequestMapping(value="/boardfreedetail.do", method = RequestMethod.GET)
	public ModelAndView boardfreedetail(HttpServletRequest request, HttpServletResponse response) {

		String bseq = request.getParameter("bseq");

		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int totalCount = service.replyCount();

		PagingUtil pu
		= new PagingUtil("/boardfreedetail.do?bseq="+bseq
				, currentPage
				, totalCount 
				, 5
				, 5 
				);
		String  html = pu.getPagingHtml();

		Map<String,Object> listMap = service.replyList(pu.getStartSeq(), pu.getEndSeq(),Integer.parseInt(bseq));

		ModelAndView mav = new ModelAndView();

		int mseq=4;

		mav.addObject("flistMap", listMap);
		
		mav.addObject("MSEQ", mseq);
		mav.addObject("FREE_REPLY_PAGING", html);
		mav.setViewName("board_board_all_board_freedetail");     

		
		
		return mav;
	}
	
	

	//건의사항 게시판 상세보기
	@RequestMapping(value="/boardproposaldetail.do", method = RequestMethod.GET)
	public ModelAndView boardproposaldetail(HttpServletRequest request, HttpServletResponse response) {

		String bseq = request.getParameter("bseq");
	
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int totalCount = service.replyCount();

		PagingUtil pu
		= new PagingUtil("/boardpropsaldetail.do?bseq="+bseq
				, currentPage
				, totalCount 
				, 5
				, 5 
				);
		String  html = pu.getPagingHtml();


		Map<String,Object> listMap = service.replyList(pu.getStartSeq(), pu.getEndSeq(),Integer.parseInt(bseq));

		ModelAndView mav = new ModelAndView();

		int mseq=4;

		mav.addObject("plistMap", listMap);
		
		mav.addObject("MSEQ", mseq);
		mav.addObject("PROPOSAL_REPLY_PAGING", html);
		mav.setViewName("board_board_all_board_proposaldetail");     

		
		
		return mav;
	}

	//공지 게시판 수정(예전edit.spring)
	@RequestMapping(value="/boardnoticeupdatepage.do", method = RequestMethod.GET)
	public ModelAndView boardnoticeupdatepage(BoardVO vo) {
		vo=service.boardNoticeDetail(vo.getBseq());
		ModelAndView mav = new ModelAndView();
		mav.addObject("NOTICE_UPDATE_PAGE", vo);
		mav.setViewName("board_board_admin_board_noticeupdate");
		return mav;
	}	

	//자유 게시판 수정(예전edit.spring)
	@RequestMapping(value="/boardfreeupdatepage.do", method = RequestMethod.GET)
	public ModelAndView boardfreeupdatepage(BoardVO vo) {
		vo=service.boardFreeDetail(vo.getBseq());
		ModelAndView mav = new ModelAndView();
		mav.addObject("FREE_UPDATE_PAGE", vo);
		mav.setViewName("board_board_user_board_freeupdate");
		return mav;
	}	

	//건의사항 게시판 수정(예전edit.spring)
	@RequestMapping(value="/boardproposalupdatepage.do",method = RequestMethod.GET)
	public ModelAndView boardproposalupdatepage(BoardVO vo) {
		vo=service.boardProposalDetail(vo.getBseq());
		ModelAndView mav = new ModelAndView();
		mav.addObject("PROPOSAL_UPDATE_PAGE", vo);
		mav.setViewName("board_board_user_board_proposalupdate");
		return mav;
	}	

	//공지 게시판 파일수정(예전update.spring)
	@RequestMapping(value = "/boardnoticeupdate.do", method = RequestMethod.GET)
	public String boardnoticefileupdate(BoardVO vo)throws IOException{

		System.out.println(vo.getBseq()+"update에서 넘어온 bseq");

		int res = 0;
		MultipartFile ufile = vo.getUfile();
		if(vo.getBcon()==null){
			return "redirect:/boardproposaldetail.do?bseq="+vo.getBseq();	
		}
		else if(ufile != null){			
			File oldFile = new File(vo.getBfilepath()+"/"+vo.getBfilename());
			if(oldFile.exists())
				oldFile.delete();
			String fullPath = upload_file_dir+"\\"+ufile.getOriginalFilename();
			File newFile = new File(fullPath); 
			ufile.transferTo(newFile); 
			vo.setBfilesize(newFile.length());
			vo.setBfilepath(upload_file_dir);
			vo.setBfilename(ufile.getOriginalFilename());

		}
		res = service.boardNoticeUpdate(vo);
		return "redirect:/boardnoticedetail.do?bseq="+vo.getBseq();

	}

	//자유 게시판 파일수정(예전update.spring)
	@RequestMapping(value = "/boardfreeupdate.do", method = RequestMethod.GET)
	public String boardfreefileupdate(BoardVO vo)throws IOException{

		System.out.println(vo.getBseq()+"update에서 넘어온 bseq");

		int res = 0;
		MultipartFile ufile = vo.getUfile();
		if(vo.getBcon()==null){
			return "redirect:/boardproposaldetail.do?bseq="+vo.getBseq();	
		}
		else if(ufile != null)  {				
			File oldFile = new File(vo.getBfilepath()+"/"+vo.getBfilename());
			if(oldFile.exists())
				oldFile.delete();
			String fullPath = upload_file_dir+"\\"+ufile.getOriginalFilename();
			File newFile = new File(fullPath); 
			ufile.transferTo(newFile); 
			vo.setBfilesize(newFile.length());
			vo.setBfilepath(upload_file_dir);
			vo.setBfilename(ufile.getOriginalFilename());

		}
		res = service.boardFreeUpdate(vo);
		return "redirect:/boardfreedetail.do?bseq="+vo.getBseq();

	}

	//건의사항 게시판 파일수정(예전update.spring)
	@RequestMapping(value = "/boardproposalupdate.do", method = RequestMethod.GET)
	public String boardproposalfileupdate(BoardVO vo)throws IOException{

		System.out.println(vo.getBseq()+"update에서 넘어온 bseq");

		int res = 0;
		MultipartFile ufile = vo.getUfile();
		if(vo.getBcon()==null){
			return "redirect:/boardproposaldetail.do?bseq="+vo.getBseq();	
		}
		else if(ufile != null)  {				
			File oldFile = new File(vo.getBfilepath()+"/"+vo.getBfilename());
			if(oldFile.exists())
				oldFile.delete();
			String fullPath = upload_file_dir+"\\"+ufile.getOriginalFilename();
			File newFile = new File(fullPath); 
			ufile.transferTo(newFile); 
			vo.setBfilesize(newFile.length());
			vo.setBfilepath(upload_file_dir);
			vo.setBfilename(ufile.getOriginalFilename());
		}
		res = service.boardProposalUpdate(vo);
		return "redirect:/boardproposaldetail.do?bseq="+vo.getBseq();

	}

	//공지 게시글 델리트
	@RequestMapping(value = "/boardnoticedelete.do", method = RequestMethod.GET)
	public String boardnoticedelete(HttpServletRequest request, HttpServletResponse response)
	{
		String bseq = request.getParameter("bseq");

		String bfilepath = request.getParameter("bfilepath");
		String bfilename = request.getParameter("bfilename");
		File oldFile = new File(bfilepath+"/"+bfilename);
		if(oldFile.exists())
			oldFile.delete();

		int res = service.boardDelete(Integer.parseInt(bseq));
		if(res > 0) {
			return "redirect:/boardnoticelist.do";

		}else {
			return "redirect:/boardnoticedetail.do?bseq="+bseq;
		}
	}

	//자유 게시글 델리트
	@RequestMapping(value = "/boardfreedelete.do", method = RequestMethod.GET)
	public String boardfreedelete(HttpServletRequest request, HttpServletResponse response)
	{
		String bseq = request.getParameter("bseq");

		String bfilepath = request.getParameter("bfilepath");
		String bfilename = request.getParameter("bfilename");
		File oldFile = new File(bfilepath+"/"+bfilename);
		if(oldFile.exists())
			oldFile.delete();

		int res = service.boardDelete(Integer.parseInt(bseq));
		if(res > 0) {
			return "redirect:/boardfreelist.do";

		}else {
			return "redirect:/boardfreedetail.do?bseq="+bseq;
		}
	}
	//건의사항 게시글 델리트
	@RequestMapping(value = "/boardproposaldelete.do", method = RequestMethod.GET)
	public String boardproposaldelete(HttpServletRequest request, HttpServletResponse response)
	{
		String bseq = request.getParameter("bseq");

		String bfilepath = request.getParameter("bfilepath");
		String bfilename = request.getParameter("bfilename");
		File oldFile = new File(bfilepath+"/"+bfilename);
		if(oldFile.exists())
			oldFile.delete();

		int res = service.boardDelete(Integer.parseInt(bseq));
		if(res > 0) {
			return "redirect:/boardproposallist.do";

		}else {
			return "redirect:/boardproposaldetail.do?bseq="+bseq;
		}
	}

	//자유 게시글 신고 인서트
	@RequestMapping(value="/freebdeclarationinsert.do", method = RequestMethod.POST)
	public String freebdeclarationinsert(BDeclarationVO vo, HttpServletResponse response) throws IOException {

		int res = 0;
		int mseq=4;
		vo.setBdmseq(mseq);

		System.out.println(vo.getBdmseq()+"신고자입니다");
		System.out.println(vo.getBdreason()+"신고이유");
		res = service.bDeclarationInsert(vo);

		return "redirect:/boardfreedetail.do?bseq="+vo.getBseq();	
	}

	//건의사항 게시글 신고 인서트
	@RequestMapping(value="/proposalbdeclarationinsert.do", method = RequestMethod.POST)
	public String proposalbdeclarationinsert(BDeclarationVO vo, HttpServletResponse response) throws IOException {

		int res = 0;
		int mseq=4;
		vo.setBdmseq(mseq);

		System.out.println(vo.getBdmseq()+"신고자입니다");
		System.out.println(vo.getBdreason()+"신고이유");
		res = service.bDeclarationInsert(vo);

		return "redirect:/boardproposaldetail.do?bseq="+vo.getBseq();	
	}


	//자유 댓글 신고 인서트
	@RequestMapping(value="/freerdeclarationinsert.do", method = RequestMethod.POST)
	public String freerdeclarationinsert(RDeclarationVO vo, HttpServletResponse response) throws IOException {

		int res = 0;
		int mseq=4;
		vo.setRdmseq(mseq);

		System.out.println(vo.getRdmseq()+"신고자입니다");
		System.out.println(vo.getRdreason()+"신고이유");
		res = service.rDeclarationInsert(vo);
		System.out.println(res+"신고됨?");

		return "redirect:/boardfreelist.do";
	}

	//건의사항 댓글 신고 인서트
		@RequestMapping(value="/proposalrdeclarationinsert.do", method = RequestMethod.POST)
		public String proposalrdeclarationinsert(RDeclarationVO vo, HttpServletResponse response) throws IOException {

			int res = 0;
			int mseq=4;
			vo.setRdmseq(mseq);

			System.out.println(vo.getRdmseq()+"신고자입니다");
			System.out.println(vo.getRdreason()+"신고이유");
			res = service.rDeclarationInsert(vo);
			System.out.println(res+"신고됨?");

			return "redirect:/boardproposallist.do";	
		}

	//게시글 신고 리스트
	@RequestMapping(value="/bdeclarationlist.do")
	public ModelAndView bdeclarationlist(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("컨트롤러는 들어옴");
		ArrayList<BoardVO> list = service.bDdetailList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("BDLIST", list);
		mav.setViewName("board_board_admin_report_boardlist");     

		return mav;
	}	

	//댓글 신고 리스트
	@RequestMapping(value="/rdeclarationlist.do")
	public ModelAndView rdeclarationlist(HttpServletRequest request, HttpServletResponse response) {

		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int totalCount = service.rdeclarationCount();

		PagingUtil pu
		= new PagingUtil("/rdeclarationlist.do?"
				, currentPage
				, totalCount 
				, 5	
				, 5 
				);
		String  html = pu.getPagingHtml();

		ArrayList<RDeclarationVO> list = service.rDeclarationList(pu.getStartSeq(), pu.getEndSeq());

		ModelAndView mav = new ModelAndView();

		mav.addObject("LVL_COUNT", totalCount);
		mav.addObject("LVL_LIST", list);
		mav.addObject("LVL_PAGING", html);

		mav.setViewName("board_board_admin_report_replylist");     

		return mav;
	}	

	//자유 댓글 인서트
	@RequestMapping(value="/replyfreeinsert.do", method = RequestMethod.POST)
	public String replyfreeinsert(ReplyVO vo) throws IOException {
		service.replyInsert(vo);
		return "redirect:/boardfreedetail.do?bseq="+vo.getBseq();
	}

	//건의사항 댓글 인서트
	@RequestMapping(value="/replyproposalinsert.do", method = RequestMethod.POST)
	public String replyproposalinsert(ReplyVO vo) throws IOException {
		service.replyInsert(vo);
		return "redirect:/boardproposaldetail.do?bseq="+vo.getBseq();
	}

	

	//건의사항 댓글 상세보기(수정, 삭제 때문에)
		@RequestMapping(value="/proposalreplydetail.do", method = RequestMethod.GET)
		public ModelAndView proposalreplydetail(ReplyVO vo) {
			int mseq=4;
			String mgubun=service.selectMgubun(mseq);
			System.out.println(vo.getMseq()+"mseq");

			ModelAndView mav = new ModelAndView();
			vo = service.proposalreplyDetail(vo.getRseq());
			mav.addObject("PROPOSAL_REPLY_DETAIL", vo);

			return mav;
		}
	
	//자유 댓글 수정페이지
	@RequestMapping(value="/freereplyupdatepage.do", method = RequestMethod.GET)
	public ModelAndView freereplyupdatepage(HttpServletRequest request, HttpServletResponse response) {

		String rseq = request.getParameter("rseq");
		ReplyVO vo = new ReplyVO();
		vo = service.freereplyDetail(Integer.parseInt(rseq));

		ModelAndView mav = new ModelAndView();
		mav.addObject("FREE_REPLY_UPDATE_VO", vo);
		mav.setViewName("board/freeboardreplyupdate");     

		return mav;
	}	
	
	//건의사항 댓글 수정페이지
		@RequestMapping(value="/proposalreplyupdatepage.do", method = RequestMethod.GET)
		public ModelAndView proposalreplyupdatepage(HttpServletRequest request, HttpServletResponse response) {

			String rseq = request.getParameter("rseq");
			ReplyVO vo = new ReplyVO();
			vo = service.proposalreplyDetail(Integer.parseInt(rseq));

			ModelAndView mav = new ModelAndView();
			mav.addObject("PROPOSAL_REPLY_UPDATE_VO", vo);
			mav.setViewName("board/proposalboardreplyupdate");     

			return mav;
		}	
	
	
	
	
	
	

	//자유 댓글 수정
	@RequestMapping(value = "/freereplyupdate.do", method = RequestMethod.POST)
	public String freereplyupdate(ReplyVO vo){
				
		service.replyUpdate(vo);
		return "redirect:/boardfreedetail.do?bseq="+vo.getBseq();

	}
	
	//건의사항 댓글 수정
		@RequestMapping(value = "/proposalreplyupdate.do", method = RequestMethod.POST)
		public String proposalreplyupdate(ReplyVO vo){
					
			service.replyUpdate(vo);
			return "redirect:/boardproposaldetail.do?bseq="+vo.getBseq();

		}


	//자유 게시판 댓글 델리트
	@RequestMapping(value = "/replyfreedelete.do")
	public String replyfreedelete(int rseq,int bseq)
	{
	
		int res = service.replyDelete(rseq);
		if(res > 0) {
			return "redirect:/boardfreedetail.do?bseq="+bseq;

		}else {
			return "redirect:/boardfreedetail.do?bseq="+bseq;
		}
	}
	//건의사항 게시판 댓글 델리트
	@RequestMapping(value = "/replyproposaldelete.do", method = RequestMethod.POST)
	public String replyproposaldelete(HttpServletRequest request, HttpServletResponse response)
	{
		String rseq = request.getParameter("rseq");

		String bfilepath = request.getParameter("bfilepath");
		String bfilename = request.getParameter("bfilename");
		File oldFile = new File(bfilepath+"/"+bfilename);
		if(oldFile.exists())
			oldFile.delete();

		int res = service.replyDelete(Integer.parseInt(rseq));
		if(res > 0) {
			return "redirect:/boardproposaldetail.do";

		}else {
			return "redirect:/boardproposaldetail.do?rseq="+rseq;
		}
	}

	//자유게시글 신고 팝업가기전 setting
	@RequestMapping(value="/freebdeclarationPopup.do", method = RequestMethod.GET)
	public ModelAndView freebdeclarationPopup(
			@RequestParam("bseq") int bseq
			) throws IOException {
		BoardVO vo=service.boardFreeDetail(bseq);

		int mseq=4;

		ModelAndView mav = new ModelAndView();
		mav.addObject("FBPOP_UP", vo);
		mav.addObject("FBPOP_UP_MSEQ", mseq);
		mav.setViewName("board_board_user_report_freeboardpopup");

		return mav;	
	}

	//건의사항 게시글 신고 팝업가기전 setting
	@RequestMapping(value="/proposalbdeclarationPopup.do", method = RequestMethod.GET)
	public ModelAndView proposalbdeclarationPopup(
			@RequestParam("bseq") int bseq
			) throws IOException {
		BoardVO vo=service.boardProposalDetail(bseq);

		int mseq=4;

		ModelAndView mav = new ModelAndView();
		mav.addObject("PBPOP_UP", vo);
		mav.addObject("PBPOP_UP_MSEQ", mseq);
		mav.setViewName("board_board_user_report_proposalboardpopup");

		return mav;	
	}
	//자유 댓글 신고 팝업가기전 setting
	@RequestMapping(value="/freerdeclarationPopup.do", method = RequestMethod.GET)
	public ModelAndView freerdeclarationPopup(
			@RequestParam("rseq") int rseq
			) throws IOException {
		ReplyVO vo=service.freereplyDetail(rseq);
		int mseq=4;

		ModelAndView mav = new ModelAndView();
		mav.addObject("FRPOP_UP", vo);
		mav.addObject("FRPOP_UP_MSEQ", mseq);
		mav.setViewName("board_board_user_report_freereplypopup");

		return mav;	
	}

	//건의사항 댓글 신고 팝업가기전 setting
	@RequestMapping(value="/proposalrdeclarationPopup.do", method = RequestMethod.GET)
	public ModelAndView proposalrdeclarationPopup(
			@RequestParam("rseq") int rseq
			) throws IOException {
		ReplyVO vo=service.proposalreplyDetail(rseq);

		int mseq=4;

		ModelAndView mav = new ModelAndView();
		mav.addObject("PRPOP_UP", vo);
		mav.addObject("PRPOP_UP_MSEQ", mseq);
		mav.setViewName("board_board_user_report_proposalreplypopup");

		return mav;	
	}

}
