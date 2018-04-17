package com.kosmo.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.common.PagingUtil;


@Controller
public class MemberController { //extends MultiActionController {
	private static final long serialVersionUID = 1L;

	@Autowired
	private MemberService service;
	//	public void setBoardService(BoardService service) {
	//		this.service = service;
	//	}

	@RequestMapping(value = "/member/admin/memberList.do", method = RequestMethod.GET)
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
				, 5	//선택한 2번 블럭에 나타날 게시물 갯수
				, 5 // 1 2 [다음]
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
	
	@RequestMapping(value = "/member/user/memberInput.do", method = RequestMethod.GET)
	public ModelAndView memberInput()
	{
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member_member_user_member_input");
		return mav;
	}
	
	@RequestMapping(value = "/member/user/memberInsert.do", method = RequestMethod.GET)
	public ModelAndView memberInsert(MemberVO vo)
			throws IOException
	{
		vo.setMaddress(vo.getMaddress() + " " + vo.getMaddress2());
		vo.setMemail(vo.getMemail()+"@"+vo.getMemail2());
		vo.setMphone(vo.getMphone()+vo.getMphone1()+vo.getMphone2());
		
		int res = service.memberInsert(vo);
		System.out.println(res + "건 정보 입력");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("member_member_admin_member_list");
		return mav;
	}

	@RequestMapping(value = "/member/user/memberDetail.do", method = RequestMethod.GET)
	public ModelAndView memberDetail(MemberVO vo)
	{
		String temp = vo.getCurrentPage();

		vo = service.memberDetail(vo.getMseq());
		vo.setCurrentPage(temp);

		ModelAndView mav = new ModelAndView();
		mav.addObject("LVL_VO", vo);
		mav.setViewName("member_member_user_member_detail");

		return mav;
	} 

	@RequestMapping(value = "/member/user/memberUpdateForJSP.do", method = RequestMethod.GET)
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

	@RequestMapping(value = "/member/user/memberUpdate.do", method = RequestMethod.POST)
	public String memberUpdate(MemberVO vo)
	{
		
		int res = service.memberUpdate(vo);

		return "redirect:/member/admin/memberList.do?currentPage="+vo.getCurrentPage();
	}

	@RequestMapping(value = "/member/user/memberDelete.do", method = RequestMethod.GET)
	public String delete(MemberVO vo)
	{
		//DB에 게시물 지우기
		int res = service.memberDelete(vo.getMseq());
		System.out.println(res + "건 삭제");
		if(res > 0) {
			return "redirect:/member/admin/memberList.do";

		}else {
			return "redirect:/member/user/memberDetail.do?mseq="+vo.getMseq();
		}
	}

	@RequestMapping(value = "/member/user/loginCheck.do")
	public ModelAndView loginCheck(@RequestParam("mid") String mid
			,@RequestParam("mpw") String mpw
			,HttpServletRequest request){

		MemberVO vo = new MemberVO();
		vo = service.loginCheck(mid, mpw);
		ModelAndView mav = new ModelAndView();
		if(vo != null){
			
			HttpSession session = request.getSession();
			session.setAttribute("LVL_SESS_MSEQ", vo.getMseq());
			session.setAttribute("LVL_SESS_GUBUN", vo.getMgubun());
			
			mav.addObject("LVL_VO", vo);
			mav.setViewName("member_member_admin_member_list");
			
			return mav;
		}else{
			mav.setViewName("member_member_user_member_input");
			return mav;
		}
	}
	
	//---------------- TODO
//	/*
//	@RequestMapping(value = "/paymentSelect.do", method = RequestMethod.POST)
//	public ModelAndView paymentSelect(PaymentVO pvo, HttpServletRequest request){
//		//입력양식 폼 값을 가지고 카카오 제공 결제 페이지로 이동
//		//해당 페이지에서는 pvo 값들을 hidden으로 가지고 kakao.do로 이동
//		
//		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("LVL_VO", pvo);
//		//카카오에서 제공하는 결제 jsp 페이지
//		mav.setViewName("카카오에서 제공하는 결제 jsp 페이지");
//		
//		return mav;
//	}
//	*/
	
//	@RequestMapping(value = "/payment.do", method = RequestMethod.POST)
//	public String payment(PaymentVO pvo, HttpServletRequest request){
//		//pvo.getPrice()금액이 결제 되었습니다. 라는 문구를 가진 jsp로 단순 이동...
//		return "redirect:/common.do";
//	}
	
	@RequestMapping(value = "/member/user/UserRegisterCheck.do", method = RequestMethod.POST)
	public ResponseEntity<Integer> UserRegisterCheck(
			@RequestParam String mid
			) throws Exception {
		int idCount  = service.memIDCheck(mid);
		
		return new ResponseEntity<Integer>(idCount, HttpStatus.OK);
	}
	
	
}