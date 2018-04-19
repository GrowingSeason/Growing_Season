package com.kosmo.sns;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.common.PagingUtil;

@Controller
public class SnsController {

	@Autowired
	private SnsService service;

	
	private int upload_file_max_size=100000000;
	private String upload_file_format="UTF-8";
	private String upload_file_dir="C:\\Users\\정규반\\git\\Growing_Season\\Growing_Season\\src\\main\\webapp\\uploads";

	/**
	 * sns 메인페이지
	 * @return mav
	 */
	@RequestMapping(value="/snsmain.do")
	public ModelAndView snsmain() {
		ModelAndView mav = new ModelAndView();
		ArrayList<SnsFeedVO> list=service.snsFeedList();
		mav.addObject("SNS_IMG_LIST", list);
		mav.setViewName("sns_sns_all_sns_main");
		return mav;
	}
	
	/**
	 * sns 디테일 페이지
	 * @param feseq
	 * @param currentPage
	 * @return mav
	 */
	@RequestMapping(value="/snsdetail.do")
	public ModelAndView snsdetail(
			 @RequestParam ("feseq") int feseq
			,@RequestParam (value="currentPage", required=false, defaultValue="1") int currentPage
			) {
		ModelAndView mav = new ModelAndView();
		System.out.println("컨트롤러 디테일");
				
		//BoardDAO impl = new BoardDAO();
		int totalCount = service.snscommentCnt();
		//------------페이징
		PagingUtil pu
		= new PagingUtil("/snsdetail.do?"
				, currentPage
				, totalCount  //------------
				, 5	//선택한 2번 블럭에 나타날 게시물 갯수
				, 5 // 1 2 [다음]
				);
		String  html = pu.getPagingHtml();

		Map<String , Object> map=service.snsCommentList(feseq, pu.getStartSeq(), pu.getEndSeq());
		mav.addObject("SNS_HASHTAG_LIST", map.get("hList"));
		mav.addObject("SNS_IMAGE_LIST", map.get("iList"));
		mav.addObject("SNS_FOLLOWER_LIST", map.get("feList"));
		mav.addObject("SNS_FOLLOWING_LIST", map.get("fiList"));
		mav.addObject("SNS_COMMENT_LIST", map.get("cList"));
		mav.addObject("SNS_DETAIL", map.get("fDetail"));
		mav.addObject("SNS_FOLLOWER_CNT", map.get("feCnt"));
		mav.addObject("SNS_FOLLOWING_CNT", map.get("fiCnt"));
		mav.addObject("SNS_LIKE_CNT", map.get("snsLike"));
		mav.addObject("SNS_COMMENT_PAGING", html);
		
		mav.setViewName("sns_sns_all_sns_detail");
		System.out.println("디테일 페이지 모달");
		return mav;
	}

	/**
	 * sns 피드글 작성(이미지,글내용,해시태그 등록)
	 * @param vo
	 * @param ivo
	 * @return String(redirectURL)
	 */
	@RequestMapping(value="/snsFeedInsert.do")
	public String snsFeedInsert(SnsFeedVO vo,SnsImgVO ivo,HttpSession session) {
		System.out.println("값이 넘어 와쓰요!!!!!");
		System.out.println(vo.getFecon()+"넘어온 내용");
		System.out.println(vo.getFerange()+"넘어온 내용");
		
		int mseq=0;
		if(session.getAttribute("MSEQ") != null) {
			mseq = Integer.parseInt(session.getAttribute("MSEQ").toString());
		}
//		mseq = 7;
		vo.setMseq(mseq);
		
		MultipartFile ufile=ivo.getUfile();
		
		if(vo.getFecon()==null){
			return "sns_sns_user_sns_insert";
		}
		if(ufile != null) {
			String fullPath = upload_file_dir+"\\"+ufile.getOriginalFilename();
			File newFile = new File(fullPath); //파일생성
			try {
				ufile.transferTo(newFile);
				ivo.setFeimgsize(ufile.getSize());
				ivo.setFeimgpath(upload_file_dir);
				ivo.setFeimgname(ufile.getOriginalFilename());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			int res = service.snsInsertService(vo, ivo);
			System.out.println(res + "sns,이미지,hash 등록 테스트!!");
		}		
		return "redirect:/snsMypage.do?mseq="+vo.getMseq();
	}
	
	
	/**
	 * sns 마이페이지 피드 리스트
	 * @param mseq
	 * @return mav
	 */
	@RequestMapping(value="/snsMypage.do")
	public ModelAndView snsMypage(HttpSession session) {
		int mseq=0;
		if(session.getAttribute("MSEQ") != null) {
			mseq = Integer.parseInt(session.getAttribute("MSEQ").toString());
		}
//		mseq = 7;
		Map<String , Object> list=service.snsMypageSErvice(mseq);
		ModelAndView mav = new ModelAndView();
		mav.addObject("SNS_MYPAGE_LIST",list.get("fList"));
		mav.addObject("SNS_FOLLOWER_LIST",list.get("feList"));
		mav.addObject("SNS_FOLLOWING_LIST",list.get("fiList"));
		mav.addObject("SNS_FOLLOWER_CNT",list.get("fecnt"));
		mav.addObject("SNS_FOLLOWING_CNT",list.get("ficnt"));
		mav.setViewName("sns_sns_user_sns_mypage");
		return mav;
	}
	
	/**
	 * 팔로워 되어있는 회원 피드 리스트
	 * @param mseq
	 * @param feseq
	 * @return mav
	 */
	@RequestMapping(value="/snsFollowerspage.do")
	public ModelAndView snsFollowerspage(
			HttpSession session,
			@RequestParam ("feseq") int feseq,
			@RequestParam ("fmseq") int fmseq
			) {
		
		int mseq=0;
		if(session.getAttribute("MSEQ") != null) {
			mseq = Integer.parseInt(session.getAttribute("MSEQ").toString());
		}
		
//		mseq = 7;
		Map<String , Object> list=service.snsFollowerspageService(feseq, mseq, fmseq);
		ArrayList<SnsFeedVO> alist=(ArrayList<SnsFeedVO>)list.get("allList");
		ModelAndView mav = new ModelAndView();
		mav.addObject("SNS_FOLLOW_LIST",list.get("fList"));
		mav.addObject("SNS_ALL_LIST",list.get("allList"));
		mav.addObject("SNS_FOLLOWER_LIST",list.get("feList"));
		mav.addObject("SNS_FOLLOWING_LIST",list.get("fiList"));
		mav.addObject("SNS_FOLLOWER_CNT",list.get("fecnt"));
		mav.addObject("SNS_FOLLOWING_CNT",list.get("ficnt"));
		System.out.println(alist.size());
		if(alist.size()<=0){
			mav.setViewName("sns_sns_user_sns_followerspage");
		} else if (alist.size()>=1){
			mav.setViewName("sns_sns_user_sns_allpage");
		}

		return mav;
	}
	
	
	/**
	 * 팔로워 안되어 있는 회원 피드 리스트
	 * @param mseq
	 * @param feseq
	 * @return mav
	 */
	@RequestMapping(value="/snsallpage.do")
	public ModelAndView snsallpage(
			@RequestParam ("mseq") int mseq,
			@RequestParam ("feseq") int feseq
			) {
		ArrayList<SnsFeedVO> list=service.snsallpage(feseq,mseq);

		ModelAndView mav = new ModelAndView();
		mav.addObject("SNS_ALL_PAGE",list);
		mav.setViewName("sns_sns_user_sns_allpage");

		return mav;
	}
	
	
	/**
	 * 팔로워 등록
	 * 글번호 : feseq , 글쓴이번호:mseq
	 * @param vo
	 * @return String(redirestURL)
	 */
	@RequestMapping(value="/snsFollowersInsert.do")
	@ResponseBody
	public Map<String, Object> snsFollowersInsert(@RequestBody SnsFeedVO vo, HttpSession session) {
		//SESSION TODO
		int mseq = 0;
		if(session.getAttribute("MSEQ") != null) {
			mseq = Integer.parseInt(session.getAttribute("MSEQ").toString());
		}
//		mseq = 6;
		
		System.out.println(vo.getFeseq()+"Ajax넘어온 feseq");
		System.out.println(vo.getFmseq()+"Ajax넘어온 fmseq");
		vo.setMseq(mseq);
		
		int res=service.snsFollowersInsertService(vo);
		System.out.println("check, werDelete, wer/wingInsert" + res); 
		String follow="in";
		if(res>1){
			follow="del";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SNS_FOLLOW_IN",follow);
		
		return map;
	}
	
	
	
	
	/**
	 * 좋아요 등록
	 * @param vo
	 * @return String(redirestURL)
	 */
	@RequestMapping(value="/snsLikeInsert.do")
	@ResponseBody
	public Map<String, Object> snsLikeInsert(@RequestBody SnsFeedVO vo, HttpSession session) {
		
		//SESSION TODO
		int mseq = 0;
		if(session.getAttribute("MSEQ") != null) {
			mseq = Integer.parseInt(session.getAttribute("MSEQ").toString());
		}
//		mseq = 6;
		vo.setMseq(mseq);		
				
		int res=0;
		System.out.println(vo.getFeseq()+"Ajax넘어온 feseq");
		res=service.snsLikeInsert(vo);
		String like="in";
		if(res>1){
			like="del";
		}
		System.out.println(like+"종아요 누른 횟수");
		int likecnt=service.snsLike(vo.getFeseq());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SNS_LIKE_IN",like);
		map.put("SNS_LIKE_CNT",likecnt);
		return map;
	}

	
	/**
	 * sns피드에 댓글등록
	 * @param vo
	 * @return String(redirestURL)
	 */
	@RequestMapping(value="/snscommentInsert.do")
	public String snscommentInsert(SnsCommentVO vo) {
		service.snscommentInsert(vo);
		return "redirect:/snsdetail.do?feseq="+vo.getFeseq();
	}
	
	
	/**
	 * 피드 신고글
	 * @param request
	 * @return mav
	 */
	@RequestMapping(value = "/snsDeclarationList.do")
	public ModelAndView snsDeclarationList(
			@RequestParam (value="currentPage", required=false, defaultValue="1") int currentPage
	         )
	{
		
		int totalCount = service.fdeclarationCnt();
		
		//------------페이징
		PagingUtil pu
		= new PagingUtil("/snsDeclarationList.do?"
				, currentPage
				, totalCount  //------------
				, 5	//선택한 2번 블럭에 나타날 게시물 갯수
				, 5 // 1 2 [다음]
				);
		String  html = pu.getPagingHtml();

		Map<String , Object> list = service.snsDeclarationList(pu.getStartSeq(), pu.getEndSeq());

		ModelAndView mav = new ModelAndView();
		mav.addObject("SNS_FD_LIST", list.get("fdList"));
		mav.addObject("SNS_CD_LIST", list.get("cdList"));
		mav.addObject("SNS_FD_PAGING", html);
		mav.setViewName("sns_sns_admin_sns_declaration");
		return mav;
	}
	

	/**
	 * 피드글 신고
	 * @param vo
	 * @return String(redirestURL)
	 */
	@RequestMapping(value="/snsfdeclarationInsert.do")
	public String snsfdeclarationInsert(DeclarationVO vo,HttpSession session) {
		int mseq = 0;
		if(session.getAttribute("MSEQ") != null) {
			mseq = Integer.parseInt(session.getAttribute("MSEQ").toString());
		}
		System.out.println(vo.getFdcon()+"feed신고내용");
//		mseq = 6;
		vo.setFdmseq(mseq);
		service.snsfdeclarationInsert(vo);
		return "redirect:/snsdetail.do?feseq="+vo.getFeseq();
	}

	/**
	 * 댓글 신고
	 * @param vo
	 * @return String(redirestURL)
	 */
	@RequestMapping(value="/snscdeclarationInsert.do")
	public String snscdeclarationInsert(DeclarationVO vo,HttpSession session) {
		//SESSION TODO
		int mseq = 0;
		if(session.getAttribute("MSEQ") != null) {
			mseq = Integer.parseInt(session.getAttribute("MSEQ").toString());
		}
		System.out.println(vo.getCdcon()+"feseq신고내용");
//		mseq = 6;
		vo.setCdmseq(mseq);
		service.snscdeclarationInsert(vo);
		System.out.println(vo.getFeseq()+"신고 후 feseq");
		return "redirect:/snsdetail.do?feseq="+vo.getFeseq();
	}

	/**
	 * 피드 신고글 삭제 후 삭제여부 변경
	 * @param feseq
	 * @return String(redirestURL)
	 */
	@RequestMapping(value="/fdeclarationdelete.do")
	public String fdeclarationdelete(
			@RequestParam ("feseq") int feseq,
			@RequestParam ("fdmseq") int fdmseq
			) {
		service.fdeclarationdelete(feseq,fdmseq);
		return "redirect:/snsDeclarationList.do";
	}

	/**
	 * 댓글 신고글 삭제 후 삭제여부 변경
	 * @param feseq
	 * @return String(redirectURL)
	 */
	@RequestMapping(value="/cdeclarationdelete.do")
	public String cdeclarationdelete(
			@RequestParam ("cdmseq") int cdmseq,
			@RequestParam ("scseq") int scseq
			) {
		System.out.println(scseq+"댓글번호");
		System.out.println(cdmseq+"댓글신고자 회원번호");
		service.cdeclarationdelete(scseq, cdmseq);
		return "redirect:/snsDeclarationList.do";
	}

	/**
	 * 피드 게시글 수정
	 * @param vo
	 * @return String(redirectURL)
	 */
	@RequestMapping(value = "/snsFeedupdate.do")
	public String snsFeedupdate(SnsFeedVO vo, SnsImgVO ivo){

		MultipartFile ufile=ivo.getUfile();

		if(ufile != null) {	
			File oldFile = new File(ivo.getFeimgpath()+"/"+ivo.getFeimgname()); //파일생성

			if(oldFile.exists())
				oldFile.delete();

			String fullPath = upload_file_dir+"\\"+ufile.getOriginalFilename();

			ivo.setFeimgsize(ufile.getSize());
			ivo.setFeimgpath(upload_file_dir);
			ivo.setFeimgname(ufile.getOriginalFilename());
		}
		service.snsFeedupdate(vo,ivo);
		return "redirect:/snsdetail.do?feseq="+vo.getFeseq();
	}

	/**
	 * 댓글 게시글 수정
	 * @param vo
	 * @return String(redirestURL)
	 */
	@RequestMapping(value = "/snsCommentupdate.do")
	public String snsCommentupdate(SnsCommentVO vo){
		System.out.println(vo.getSccon()+"댓글 수정 내용");
		service.snsCommentupdate(vo);
		System.out.println(vo.getSccon()+"댓글 수정 내용");
		return "redirect:/snsdetail.do?feseq="+vo.getFeseq();
	}
	
//	내가 작성한 feed글 삭제여부 변경
	@RequestMapping(value = "/snsFeedDelete.do")
	public String snsFeedDelete(
			@RequestParam("feseq") int feseq
			){
		System.out.println(feseq+"피드삭제할 feseq");
		service.snsFeedDelete(feseq);
		return "redirect:/snsmain.do";
	}
	
//	내가 작성한 feed글 삭제여부 변경
	@RequestMapping(value = "/snsCommentDelete.do")
	public String snsCommentDelete(SnsCommentVO vo){
		service.snsCommentDelete(vo);
		return "redirect:/snsdetail.do?feseq="+vo.getFeseq();
	}

	//	해시태그 검색
	@RequestMapping(value = "/hashtagSearch.do")
	@ResponseBody
	public Map<String, Object> hashtagSearch(
			@RequestBody SnsFeedVO vo, HttpServletRequest request
			) throws Exception {
				//게시물 목록 가져오기
		System.out.println(vo.getSearchStr());
		
		ArrayList<SnsFeedVO> list = service.hashtagSearch(vo.getSearchStr());
		if (list == null) {
			//throw new NotFoundException("selectBoardList null");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SNS_HASHTAGSERCH_LIST",list);
		return map;
	}
	
}
