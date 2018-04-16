package com.kosmo.common;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.farmadmin.ApplyVO;
import com.kosmo.farmadmin.FarmAdminService;
import com.kosmo.farmadmin.FarmGardenVO;
import com.kosmo.farmadmin.MemberVO;



/**
 * Handles requests for the application home page.
 */

@Controller
public class AdminController {
	
	@Autowired
	private FarmAdminService imp;
	
	@RequestMapping(value="/snsadmin.do")
	public ModelAndView snsListAdmin(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("sns_sns_admin_sns_sample");

		return mav;
	}
	
	@RequestMapping(value="/alist.do")
	public ModelAndView commontest(HttpServletRequest request, HttpServletResponse response) {
		int currentPage = 1;
		
		MemberVO mvo = new MemberVO();
		int totalcount = imp.applyListCount();
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		PagingUtil pu = new PagingUtil("/alist.do", currentPage, totalcount, 8 , 5);
		String html = pu.getPagingHtml();
		
		ModelAndView mav = new ModelAndView();
		
		mvo.setSseq(pu.getStartSeq());
		mvo.setEseq(pu.getEndSeq());
	
//		System.out.println(mvo.getSseq());
//		System.out.println(mvo.getEseq());
		
		ArrayList<MemberVO> list = imp.applyList(mvo);
		
		mav.addObject("LVL_PAGING", html);
		mav.addObject("LVL_LIST", list);
		mav.addObject("LVL_COUNT", totalcount);
		mav.setViewName("board_board_admin_farm_list");

		return mav;
	}
	
	@RequestMapping(value="/manager.do")
	public ModelAndView manager(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		FarmGardenVO fgvo = new FarmGardenVO();
		
		ArrayList<FarmGardenVO> floclist = imp.farmlocationList(fgvo);
		ArrayList<FarmGardenVO> fnamelist = imp.farmnameList(fgvo);
		ArrayList<FarmGardenVO> flist = imp.fList(fgvo);
		
		mav.addObject("LVL_FLIST", flist);
		mav.addObject("LVL_FLOC", floclist);
		mav.addObject("LVL_FNAME", fnamelist);
		mav.setViewName("board_board_admin_farm_management");
		
		return mav;
	}
	
	@RequestMapping(value = "/ajaxsearch.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> locSearchList(
			@RequestBody FarmGardenVO fgvo
	) throws Exception {
		System.out.println("서치원");
		ArrayList<FarmGardenVO> list = imp.searchlocList(fgvo);
		if (list == null) {
			//throw new NotFoundException("selectBoardList null");
			System.out.println("리스트 널");
        }
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("LVL_RLIST", list);
		
        return map;
	}
	
	@RequestMapping(value = "/ajaxsearch2.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> nameSearchList(
			@RequestBody FarmGardenVO fgvo
	) throws Exception {
		System.out.println("서치투");
		ArrayList<FarmGardenVO> list = imp.searchfarmList(fgvo);
		if (list == null) {
			//throw new NotFoundException("selectBoardList null");
			System.out.println("리스트 널");
        }
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("LVL_ELIST", list);
		
        return map;
	}
	
	@RequestMapping(value="/create.do")
	public ModelAndView farmCreate(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board_board_admin_farm_create");

		return mav;
	}
	
	@RequestMapping(value="/farminsert.do")
	public String farmInsert(FarmGardenVO fgvo) {
		
		int res = 0;
		res = imp.farmInsert(fgvo);

		return "redirect: /manager.do";
	}
	
	@RequestMapping(value="/farmupdate.do")
	public String farmUpdate(FarmGardenVO fgvo) {
		System.out.println("들어왔당");
		int res = 0;
		res = imp.farmUpdate(fgvo);
		System.out.println("처리함");
		return "redirect: /manager.do";
	}
	
	@RequestMapping(value="/farmdelete.do")
	public String farmDelete(FarmGardenVO fgvo) {
		
		int res = 0;
		res = imp.farmDelete(fgvo);

		return "redirect: /manager.do";
	}
	
	@RequestMapping(value="/lotto.do")
	public ModelAndView lotto(FarmGardenVO fgvo , ApplyVO avo, HttpServletRequest request, HttpServletResponse response) {
		
//		int silverDiv = imp.silverDivCount(fgvo);
//		ArrayList<ApplyVO> silverList = imp.silverApplyCount(avo);
//		
//		int silverRes = 0;
//		
//		HashSet<ApplyVO> silverMap = new HashSet<ApplyVO>();
//		
//		for(; silverMap.size()<silverDiv; ) {
//			silverMap.add(silverList.get(silverMap.size()));
//			System.out.println("실버맵사이즈" + silverMap.size());
//		}
//		
//		Iterator<ApplyVO> silverIt = silverMap.iterator();
//		
//		while(silverIt.hasNext()) {
//			avo.setApseq(silverIt.next().getApseq());
//			silverRes = imp.silverLotto(avo);
//		}
//		// 실버 로또 끝
//		
//		int manyBabyDiv = imp.manyBabyDivCount(fgvo);
//		ArrayList<ApplyVO> manyBabyList = imp.manyBabyApplyCount(avo);
//		
//		int manyBabyRes = 0;
//		HashSet<ApplyVO> manyBabyMap = new HashSet<ApplyVO>();
//		
//		for(; manyBabyMap.size()<manyBabyDiv; ) {
//			manyBabyMap.add(manyBabyList.get(manyBabyMap.size()));
//			System.out.println("다둥이맵사이즈" + manyBabyMap.size());
//		}
//		
//		Iterator<ApplyVO> manyBabyIt = manyBabyMap.iterator();
//		
//		while(manyBabyIt.hasNext()) {
//			avo.setApseq(manyBabyIt.next().getApseq());
//			manyBabyRes = imp.manyBabyLotto(avo);
//		}
//		//다둥이 로또 끝
//		
//		int manyCultureDiv = imp.manyCultureDivCount(fgvo);
//		ArrayList<ApplyVO> manyCultureList = imp.manyCultureApplyCount(avo);
//		
//		int manyCultureRes = 0;
//		
//		HashSet<ApplyVO> manyCultureMap = new HashSet<ApplyVO>();
//
//		for(; manyCultureMap.size()<manyCultureDiv; ) {
//			manyCultureMap.add(manyCultureList.get(manyCultureMap.size()));
//			System.out.println("다문화맵사이즈" + manyCultureMap.size());
//		}
//		
//		Iterator<ApplyVO> manyCultureIt = manyCultureMap.iterator();
//		
//		while(manyCultureIt.hasNext()) {
//			avo.setApseq(manyCultureIt.next().getApseq());
//			manyCultureRes = imp.manyCultureLotto(avo);
//		}
		//다문화 로또 끝
		
		//리스트 뿌려
		int currentPage = 1;
		
		int totalcount = imp.lottoListCount();
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		PagingUtil pu = new PagingUtil("/lotto.do", currentPage, totalcount, 8 , 5);
		String html = pu.getPagingHtml();
		
		ModelAndView mav = new ModelAndView();
		
		avo.setSseq(pu.getStartSeq());
		avo.setEseq(pu.getEndSeq());
		
	
		System.out.println(avo.getSseq());
		System.out.println(avo.getEseq());
		
		ArrayList<ApplyVO> list = imp.lottoList(avo);
		
		System.out.println(list.size());
		
		mav.addObject("LVL_PAGING", html);
		mav.addObject("LVL_LIST", list);
		mav.addObject("LVL_COUNT", totalcount);
		mav.setViewName("board_board_admin_farm_lottolist");
		
		return mav;
	}
	
	@RequestMapping(value="/snsuser.do")
	public ModelAndView commonsnstest(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("sns_sns_user_sns_sample");

		return mav;
	}
	
}
