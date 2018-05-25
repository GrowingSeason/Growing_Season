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
import javax.servlet.http.HttpSession;

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
import com.kosmo.farmadmin.DocumentVO;
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
	
	
	@RequestMapping(value="/alist.do")
	public ModelAndView commontest(FarmGardenVO fgvo, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		if(!(session.getAttribute("LVL_SESS_GUBUN").toString().equals("A"))){
			mav.setViewName("error_layout_all_error_page");
			return mav;
		}
		int currentPage = 1;
		
		MemberVO mvo = new MemberVO();
		int totalcount = imp.applyListCount();
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		PagingUtil pu = new PagingUtil("/alist.do", currentPage, totalcount, 8 , 5);
		String html = pu.getPagingHtml();
		
		mvo.setSseq(pu.getStartSeq());
		mvo.setEseq(pu.getEndSeq());
	
		ArrayList<MemberVO> list = imp.applyList(mvo);
		ArrayList<FarmGardenVO> floclist = imp.farmlocationList(fgvo);
		ArrayList<FarmGardenVO> fnamelist = imp.farmnameList(fgvo);
		ArrayList<FarmGardenVO> fieldlist = imp.fieldList(fgvo);
		
		mav.addObject("LVL_FIELD", fieldlist);
		mav.addObject("LVL_FLOC", floclist);
		mav.addObject("LVL_FNAME", fnamelist);
		
		mav.addObject("LVL_PAGING", html);
		mav.addObject("LVL_LIST", list);
		mav.addObject("LVL_COUNT", totalcount);
		mav.setViewName("board_board_admin_farm_list");

		return mav;
	}
	
	@RequestMapping(value="/manager.do")
	public ModelAndView manager(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		if(!(session.getAttribute("LVL_SESS_GUBUN").toString().equals("A"))){
			mav.setViewName("error_layout_all_error_page");
			return mav;
		}
		
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
	
	@RequestMapping(value = "/flist.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> locSearchList(
			@RequestBody FarmGardenVO fgvo
	) throws Exception {
	
		ArrayList<FarmGardenVO> list = imp.searchlocList(fgvo);
		if (list == null) {
			//throw new NotFoundException("selectBoardList null");
			System.out.println("리스트 널");
        }
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("LVL_RLIST", list);
		
        return map;
	}
	
	@RequestMapping(value = "/detail.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> farmDetail(
			@RequestBody FarmGardenVO fgvo
	) throws Exception {
		
		ArrayList<FarmGardenVO> list = imp.searchfarmList(fgvo);
		if (list == null) {
			//throw new NotFoundException("selectBoardList null");
			System.out.println("리스트 널");
        }
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("LVL_ELIST", list);
		
        return map;
	}
	
	@RequestMapping(value = "/usinglist.do")
	@ResponseBody
	public Map<String, Object> usingList(
			@RequestBody FarmGardenVO fgvo 
			
	) throws Exception {
		MemberVO mvo = new MemberVO();
		mvo.setFgvo(fgvo);
		ArrayList<MemberVO> list = imp.usingList(mvo);
		if (list == null) {
			//throw new NotFoundException("selectBoardList null");
			System.out.println("리스트 널");
        }
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("LVL_ULIST", list);
		
        return map;
	}
	
	@RequestMapping(value = "/arealist.do")
	@ResponseBody
	public FarmGardenVO areaList(
			@RequestBody FarmGardenVO fgvo 
			
	) throws Exception {
        return imp.areaList(fgvo);
	}
	
	@RequestMapping(value = "/winlist.do")
	@ResponseBody
	public ArrayList<ApplyVO> winList(
			@RequestBody ApplyVO avo 
			
	) throws Exception {
		ArrayList<ApplyVO> list = imp.winnerList(avo);
        return list;
	}
	
	@RequestMapping(value="/create.do")
	public ModelAndView farmCreate(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		if(!(session.getAttribute("LVL_SESS_GUBUN").toString().equals("A"))){
			mav.setViewName("error_layout_all_error_page");
			return mav;
		}
		mav.setViewName("board_board_admin_farm_create");
		return mav;
	}
	
	@RequestMapping(value="/farminsert.do")
	public String farmInsert(FarmGardenVO fgvo, HttpSession session) {
		
		if(!(session.getAttribute("LVL_SESS_GUBUN").toString().equals("A"))){
			return "error_layout_all_error_page";
		}
		
		int res = 0;
		res = imp.farmInsert(fgvo);
		return "redirect: /manager.do";
	}
	
	@RequestMapping(value="/farmupdate.do")
	public String farmUpdate(FarmGardenVO fgvo, HttpSession session) {
		
		if(!(session.getAttribute("LVL_SESS_GUBUN").toString().equals("A"))){
			return "error_layout_all_error_page";
		}
		int res = 0;
		res = imp.farmUpdate(fgvo);
		return "redirect: /manager.do";
	}
	
	@RequestMapping(value="/farmdelete.do")
	public String farmDelete(FarmGardenVO fgvo, HttpSession session) {
		
		if(!(session.getAttribute("LVL_SESS_GUBUN").toString().equals("A"))){
			return "error_layout_all_error_page";
		}
		int res = 0;
		res = imp.farmDelete(fgvo);
		return "redirect: /manager.do";
	}
	
	@RequestMapping(value="/lottolist.do")
	public ModelAndView lottoList(FarmGardenVO fgvo , ApplyVO avo, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(!(session.getAttribute("LVL_SESS_GUBUN").toString().equals("A"))){
			mav.setViewName("error_layout_all_error_page");
			return mav;
		}
		//리스트 뿌려
		int currentPage = 1;
		
		int totalcount = imp.lottoListCount();
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		PagingUtil pu = new PagingUtil("/lottolist.do", currentPage, totalcount, 8 , 5);
		String html = pu.getPagingHtml();
		
		avo.setSseq(pu.getStartSeq());
		avo.setEseq(pu.getEndSeq());
	
		ArrayList<ApplyVO> list = imp.lottoList(avo);
		ArrayList<FarmGardenVO> floclist = imp.farmlocationList(fgvo);
		ArrayList<FarmGardenVO> fnamelist = imp.farmnameList(fgvo);
		ArrayList<FarmGardenVO> fieldlist = imp.fieldList(fgvo);
		
		mav.addObject("LVL_FIELD", fieldlist);
		mav.addObject("LVL_FLOC", floclist);
		mav.addObject("LVL_FNAME", fnamelist);
		mav.addObject("LVL_PAGING", html);
		mav.addObject("LVL_LIST", list);
		mav.addObject("LVL_COUNT", totalcount);
		
		mav.setViewName("board_board_admin_farm_lottolist");
		
		return mav;
	}
	
	@RequestMapping(value="/lotto.do")
	public String lotto(FarmGardenVO fgvo , ApplyVO avo, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		if(!(session.getAttribute("LVL_SESS_GUBUN").toString().equals("A"))){
			return "error_layout_all_error_page";
		}
		int res = 0;
		ArrayList<FarmGardenVO> areaList = imp.locnameAreaCount(fgvo);
		avo.setFgvo(fgvo);
		ArrayList<ApplyVO> applyList = imp.locnameApply(avo);
		for(int i=0; i<applyList.size(); i++) {
			System.out.println(applyList.get(i).getApname());
		}
		
		HashSet<ApplyVO> applyMap = new HashSet<ApplyVO>();
		
		for(; applyMap.size()<areaList.size(); ) {
			applyMap.add(applyList.get(applyMap.size()));
			if(applyMap.size()==applyList.size()){
				break;
			}
		}
		Iterator<ApplyVO> applyIt = applyMap.iterator();
		int j=1;
		
		while(applyIt.hasNext()) {
			avo.setApseq(applyIt.next().getApseq());
			avo.setAseq(j);
			res = imp.lottoUpdate(avo);
			j++;
		}
		
		return "redirect: /lottolist.do";
	}
	
	@RequestMapping(value="/returnUpdate.do")
	public String returnUpdate(DocumentVO dvo, ApplyVO avo, HttpSession session) {
		
		if(!(session.getAttribute("LVL_SESS_GUBUN").toString().equals("A"))){
			return "error_layout_all_error_page";
		}

		dvo.setAvo(avo);
		int res = 0;
		res = imp.returnUpdate(dvo);
		return "redirect: /alist.do";
	}
	
	@RequestMapping(value="/assigncancel.do")
	public String assignCancel(int[] arr, HttpSession session) {
		
		if(!(session.getAttribute("LVL_SESS_GUBUN").toString().equals("A"))){
			return "error_layout_all_error_page";
		}
		int res = 0;
		for(int i =0; i<arr.length; i++) {
			res = imp.assignUpdate(arr[i]);
		}
		
		return "redirect: /manager.do";
	}

	
}
