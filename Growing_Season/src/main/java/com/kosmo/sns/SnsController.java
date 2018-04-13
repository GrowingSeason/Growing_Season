package com.kosmo.sns;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	private String upload_file_dir="C:\\Users\\정규반\\gitGrowing_Season\\Growing_Season\\src\\main\\webapp\\uploads";

	/**
	 * sns 메인페이지
	 * @return mav
	 */
	@RequestMapping(value="/snsmain.do")
	public ModelAndView snsmain() {
		ModelAndView mav = new ModelAndView();
		ArrayList<SnsFeedVO> list=service.snsFeedList();
		mav.addObject("SNS_FEED_LIST", list);
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
		mav.addObject("SNS_COMMENT_PAGING", html);
		mav.setViewName("sns_sns_user_sns_detail");

		return mav;
	}

	/**
	 * sns 피드글 작성(이미지,글내용,해시태그 등록)
	 * @param vo
	 * @param ivo
	 * @return String(redirectURL)
	 */
	@RequestMapping(value="/snsFeedInsert.do")
	public String snsFeedInsert(SnsFeedVO vo,SnsImgVO ivo) {
		MultipartFile ufile=ivo.getUfile();
		if(ufile != null) {
			String fullPath = upload_file_dir+"\\"+ufile.getOriginalFilename();
			File newFile = new File(fullPath); //파일생성
			try {
				ufile.transferTo(newFile);
				ivo.setFeimgsize(ufile.getSize());
				ivo.setFeimgpath(upload_file_dir);
				ivo.setFeimgname(ufile.getOriginalFilename());
				int res = service.snsInsertService(vo, ivo);
				System.out.println(res + "sns,이미지,hash 등록 테스트!!");
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
		return "redirect:/snsmain.do";
	}
	
	
	/**
	 * sns 마이페이지 피드 리스트
	 * @param mseq
	 * @return mav
	 */
	@RequestMapping(value="/snsMypage.do")
	public ModelAndView snsMypage(@RequestParam ("mseq") int mseq) {
		ArrayList<SnsFeedVO> list=service.snsMypage(mseq);
		ModelAndView mav = new ModelAndView();
		mav.addObject("SNS_MYPAGE_LIST",list);
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
			@RequestParam ("mseq") int mseq,
			@RequestParam ("feseq") int feseq
			) {
	ArrayList<SnsFeedVO> list=service.snsFollowerspageService(feseq, mseq);
  	ModelAndView mav = new ModelAndView();
		mav.addObject("SNS_FOLLOWERS_PAGE",list);
		mav.setViewName("sns_sns_user_sns_followerspage");

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
	 * @param vo
	 * @return String(redirestURL)
	 */
	@RequestMapping(value="/snsFollowersInsert.do")
	public String snsFollowersInsert(SnsFeedVO vo) {
		int res=service.snsFollowersInsertService(vo);
		System.out.println("check, werDelete, wer/wingInsert" + res); 
		
		return "redirect:/snsdetail.do"+vo.getFeseq();
	}
	
	
	////	팔로잉 등록
	//	@RequestMapping(value="/snsFollowingInsert.do")
	//	public ModelAndView snsFollowingInsert(SnsFeedVO vo) {
	//
	////		팔로잉 중복체크
	//		int check=service.snsFollowingCheck(vo.getFeseq(),vo.getMseq());
	//		if(vo.getMseq()==check){
	//			service.snsFollowingdelete(vo.getFimseq(),check);
	//		}
	//		if(check==0){
	//			service.snsFollowingInsert(vo);
	//		}
	//		ModelAndView mav = new ModelAndView();
	//		mav.setViewName("sns_sns_user_sns_followinginsert");
	//		return mav;
	//	}

	
	
	/**
	 * 좋아요 등록
	 * @param vo
	 * @return String(redirestURL)
	 */
	@RequestMapping(value="/snsLikeInsert.do")
	public String snsLikeInsert(SnsFeedVO vo) {
		int res=0;
		res=service.snsLikeInsert(vo);
		return "redirect:/snsdetail.do"+vo.getFeseq();
	}

	
	/**
	 * sns피드에 댓글등록
	 * @param vo
	 * @return String(redirestURL)
	 */
	@RequestMapping(value="/snscommentInsert.do")
	public String snscommentInsert(SnsCommentVO vo) {
		service.snscommentInsert(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sns_sns_user_sns_followinginsert");
		return "redirect:/snsdetail.do"+vo.getFeseq();
	}
	
	
	/**
	 * 피드 신고글
	 * @param request
	 * @return mav
	 */
	@RequestMapping(value = "/snsDeclarationList.do")
	public ModelAndView snsfDeclarationList(
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
		mav.setViewName("sns_sns_admin_sns_declarationlist");
		return mav;
	}
	
	
//	/**
//	 * 댓글 신고글
//	 * @param currentPage
//	 * @return mav
//	 */
//	@RequestMapping(value = "/snscDeclarationList.do")
//	public ModelAndView snscDeclarationList(@RequestParam (value="currentPage", required=false, defaultValue="1") int currentPage
//	         )
//	{
//		int totalCount = service.cdeclarationCnt();
////------------페이징
//		PagingUtil pu
//		= new PagingUtil("/snscDeclarationList.do?"
//				, currentPage
//				, totalCount  //------------
//				, 5	//선택한 2번 블럭에 나타날 게시물 갯수
//				, 5 // 1 2 [다음]
//				);
//		String  html = pu.getPagingHtml();
//
//		ArrayList<DeclarationVO> list = service.snscDeclarationList(pu.getStartSeq(), pu.getEndSeq());
//
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("SNS_CD_LIST", list);
//		mav.addObject("SNS_CD_PAGING", html);
//		mav.setViewName("sns_sns_admin_sns_snscdlist");
//		return mav;
//	}


	/**
	 * 피드글 신고
	 * @param vo
	 * @return String(redirestURL)
	 */
	@RequestMapping(value="/snsfdeclarationInsert.do")
	public String snsfdeclarationInsert(DeclarationVO vo) {
		service.snsfdeclarationInsert(vo);
		return "redirect:/snsdetail.do?feseq="+vo.getFeseq();
	}

	/**
	 * 댓글 신고
	 * @param vo
	 * @return String(redirestURL)
	 */
	@RequestMapping(value="/snscdeclarationInsert.do")
	public String snscdeclarationInsert(DeclarationVO vo) {
		service.snscdeclarationInsert(vo);
		return "redirect:/snsdetail.do?feseq="+vo.getFeseq();
	}

	/**
	 * 피드 신고글 삭제 후 삭제여부 변경
	 * @param feseq
	 * @return String(redirestURL)
	 */
	@RequestMapping(value="/fdeclarationdelete.do")
	public String fdeclarationdelete(@RequestParam ("feseq") int feseq) {
		service.fdeclarationdelete(feseq);
		return "redirect:/snsDeclarationList.do";
	}

	/**
	 * 댓글 신고글 삭제 후 삭제여부 변경
	 * @param feseq
	 * @return String(redirectURL)
	 */
	@RequestMapping(value="/cdeclarationdelete.do")
	public String cdeclarationdelete(@RequestParam ("feseq") int feseq) {
		service.cdeclarationdelete(feseq);
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
		service.snsCommentupdate(vo);
		return "redirect:/snsdetail.do?feseq="+vo.getFeseq();
	}
	
//	내가 작성한 feed글 삭제여부 변경
	@RequestMapping(value = "/snsFeedDelete.do")
	public String snsFeedDelete(
			@RequestParam("feseq") int feseq,
			@RequestParam("mseq") int mseq			
			){
		service.snsFeedDelete(feseq);
		return "redirect:/snsMypage.do?mseq="+mseq;
	}
	
//	내가 작성한 feed글 삭제여부 변경
	@RequestMapping(value = "/snsCommentDelete.do")
	public String snsCommentDelete(
			@RequestParam("feseq") int feseq,
			@RequestParam("mseq") int mseq			
			){
		service.snsCommentDelete(feseq);
		return "redirect:/snsMypage.do?mseq="+mseq;
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
		map.put("SNS_HASHTAGSERCH_LIST", list);
		return map;
	}
	
	@RequestMapping(value = "/snssample.do")
	public String snssample(){
		
		return "sns_sns_admin_sns_sample";
	}
	

}
