package com.kosmo.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.common.PagingUtil;
import com.kosmo.payment.PaymentVO;


@Controller
public class MemberController { //extends MultiActionController {
	private static final long serialVersionUID = 1L;

	@Autowired
	private MemberService service;
	//	public void setBoardService(BoardService service) {
	//		this.service = service;
	//	}

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, MemberVO vo)
	{

		int currentPage = 1;


		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		//BoardDAO impl = new BoardDAO();
		int totalCount = service.memberCount();


		//------------페이징
		PagingUtil pu
		= new PagingUtil("/list.do?"
				, currentPage
				, totalCount  //------------
				, 3	//선택한 2번 블럭에 나타날 게시물 갯수
				, 2 // 1 2 [다음]
				);
		String  html = pu.getPagingHtml();

		//		BoardVO vo = new BoardVO();
		//		vo.setSseq(pu.getStartSeq());
		//		vo.setEseq(pu.getEndSeq());
		List<MemberVO> list = service.memberAdminList(pu.getStartSeq(), pu.getEndSeq());

		ModelAndView mav = new ModelAndView();

		mav.addObject("LVL_COUNT", totalCount);
		mav.addObject("LVL_LIST", list);
		mav.addObject("LVL_PAGING", html);
		mav.addObject("LVL_CURRENTPAGE", currentPage);

		mav.setViewName("member_member_admin_member_list");
		return mav;
	}

	@RequestMapping(value = "/memberInsert.do", method = RequestMethod.GET)
	public ModelAndView memberInsert(MemberVO vo)
			throws IOException
	{
		int res = service.memberInsert(vo);
		System.out.println(res + "건 입력");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("member_member_admin_member_list");
		return mav;
	}

	@RequestMapping(value = "/memberDetail.do", method = RequestMethod.GET)
	public ModelAndView memberDetail(MemberVO vo)
	{
		String temp = vo.getCurrentPage();
		System.out.println(vo.getCurrentPage()+"----");

		vo = service.memberDetail(vo.getMseq());
		vo.setCurrentPage(temp);
		System.out.println(vo.getCurrentPage()+"--sss--");

		ModelAndView mav = new ModelAndView();
		mav.addObject("LVL_VO", vo);
		mav.setViewName("member_member_user_member_detail");

		return mav;
	} 

	@RequestMapping(value = "/memberUpdateForJSP.do", method = RequestMethod.GET)
	public ModelAndView memberUpdateForJSP(MemberVO vo)
	{
		String temp = vo.getCurrentPage();
		vo = service.memberDetail(vo.getMseq());
		vo.setCurrentPage(temp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("LVL_VO", vo);
		mav.setViewName("member_member_user_member_update");

		return mav;
	}

	@RequestMapping(value = "/memberUpdate.do", method = RequestMethod.POST)
	public String memberUpdate(MemberVO vo)
	{
		//		String mseq = request.getParameter("mseq");
		//		//BoardDAO impl = new BoardDAO();
		//		MemberVO vo = new MemberVO();
		int res = service.memberUpdate(vo);

		//		ModelAndView mav = new ModelAndView();
		//		mav.addObject("LVL_VO", vo);
		//		mav.setViewName("member_member_user_member_update");

		return "redirect:/list.do?currentPage="+vo.getCurrentPage();
	}

	@RequestMapping(value = "/memberDelete.do", method = RequestMethod.GET)
	public String delete(MemberVO vo)
	{
		//DB에 게시물 지우기
		int res = service.memberDelete(vo.getMseq());
		System.out.println(res + "건 삭제");
		if(res > 0) {
			return "redirect:/list.do";

		}else {
			return "redirect:/detail.do?mseq="+vo.getMseq();
		}
	}

	@RequestMapping(value = "/memberLoginTest.do", method = RequestMethod.GET)
	public ModelAndView memberLoginTest(){

		ModelAndView mav = new ModelAndView();
		mav.setViewName("member_member_user_member_loginTest");
		return mav;
	}

	@RequestMapping(value = "/loginCheck.do")
	public ModelAndView loginCheck(@RequestParam("mid") String mid
			,@RequestParam("mpw") String mpw
			,HttpServletRequest request){

		MemberVO vo = new MemberVO();
		vo = service.loginCheck(mid, mpw);
		ModelAndView mav = new ModelAndView();
		if(vo != null){
			
			HttpSession session = request.getSession();
			session.setAttribute("LVL_SESS_MSEQ", vo.getMseq());
			
			mav.addObject("LVL_VO", vo);
			mav.setViewName("member_member_admin_member_list");
			
			return mav;
		}else {
			mav.setViewName("member_member_user_member_loginTest");
			return mav;
		}
	}
	
	@RequestMapping(value = "/payment.do", method = RequestMethod.GET)
	public String payment(PaymentVO pvo){
		
		int res = service.payment(81, 42, 300, "Y");
		
		return "redirect:/common.do";
	}

}
