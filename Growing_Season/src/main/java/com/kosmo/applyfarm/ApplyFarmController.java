package com.kosmo.applyfarm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ApplyFarmController {
	
	@Autowired
	private ApplyFarmService applyFarmServiceImpl;
	
	@RequestMapping(value="/applyFarm/all/selectFarmArea.do")
	public ModelAndView selectFarmLocation(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("FARM_LIST", applyFarmServiceImpl.selectFarmLocation());
		mav.setViewName("applyFarm_applyfarm_all_applyfarm_selectarea");
		return mav;
		
	}
	@RequestMapping(value="/applyFarm/all/selectFarm.do")
	@ResponseBody
	public ArrayList<HashMap<String, Object>> selectFarm(@RequestParam String fglocation){
		System.out.println(fglocation);
		System.out.println(applyFarmServiceImpl.selectFarmName(fglocation));
		return applyFarmServiceImpl.selectFarmName(fglocation);
	}
	@RequestMapping(value="/applyFarm/all/selectArea.do")
	@ResponseBody
	public HashMap<String, Object> selectArea(@RequestParam int fgseq){
		System.out.println(fgseq);
		System.out.println(applyFarmServiceImpl.selectFarmArea(fgseq));
		return applyFarmServiceImpl.selectFarmArea(fgseq);
	}
	
	@RequestMapping(value="/applyFarm/all/writeForm.do")
	public ModelAndView goWriteForm(int fgseq, int areaseq){
		ModelAndView mav = new ModelAndView();
		System.out.println(fgseq);
		System.out.println(areaseq);
		mav.addObject("FG_SEQ", fgseq);
		mav.addObject("AREA_SEQ", areaseq);
		mav.addObject("FARM_INFO", applyFarmServiceImpl.selectFarmInfo(fgseq));
		mav.setViewName("applyFarm_applyfarm_all_applyfarm_wirteform");
		return mav;
	}
	
	@RequestMapping(value="/myFarm/user/checkFarm.do")
	public ModelAndView checkMyFarmArea(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
//		HttpSession session = request.getSession();
//		int mseq = Integer.parseInt(session.getAttribute("mseq").toString());
		mav.addObject("MY_FARM_INFO", applyFarmServiceImpl.myApplyFarmInfo(3));
		mav.setViewName("applyFarm_applyfarm_user_myfarm_checkfarm");
		return mav;
	}
	
	@RequestMapping(value="/inserttemp.do")
	public void insert(){
		AreaYearVO vo = new AreaYearVO();
		vo.setFgseq(32);
		for(int i=1;i<=370;i++){
			vo.setAseq(i);
			System.out.println(vo.getFgseq());
			System.out.println(vo.getAseq());
			applyFarmServiceImpl.inserttemp(vo);
		}
	}
	
}
