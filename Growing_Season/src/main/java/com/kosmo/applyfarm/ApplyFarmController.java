package com.kosmo.applyfarm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ApplyFarmController {
		
	private static final String String = null;

	@Value("2018") //차후 프로퍼티 설정 후 프로퍼티로 대체예정
	int thisYear;
	//@Value("${upload_file_max_size}")
	
	@Autowired
	private ApplyFarmService applyFarmServiceImpl;

	//구획선택 진입 컨트롤러(농장별 지역 return함)
	@RequestMapping(value="/applyFarm/all/selectFarmArea.do")
	public ModelAndView selectFarmLocation(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("FARM_LIST", applyFarmServiceImpl.selectFarmLocation());
		mav.setViewName("applyFarm_applyfarm_all_applyfarm_selectarea");
		System.out.println(thisYear);
		return mav;
		
	}
	//지역선택시 해당 지역의 농장명 리스트를 가져오는 메서드
	@RequestMapping(value="/applyFarm/all/selectFarm.do")
	@ResponseBody
	public ArrayList<HashMap<String, Object>> selectFarm(@RequestParam String fglocation){
		System.out.println(fglocation);
		System.out.println(applyFarmServiceImpl.selectFarmName(fglocation));
		return applyFarmServiceImpl.selectFarmName(fglocation);
	}
	
	//농장선택시 해당 농장의 구획정보를 가져오는 메서드
	@RequestMapping(value="/applyFarm/all/selectArea.do")
	@ResponseBody
	public HashMap<String, Object> selectArea(@RequestParam int fgseq)
	{
		System.out.println(fgseq);
		System.out.println(applyFarmServiceImpl.selectFarmArea(fgseq));
		return applyFarmServiceImpl.selectFarmArea(fgseq);
	}
	
	//구획선택 후 농장신청폼으로 이동하는 메서드
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
	
	//농장을 신청한 회원이 자신의 농장 구획정보를 확인하는 컨트롤러
	@RequestMapping(value="/myFarm/user/checkFarm.do")
	public ModelAndView checkMyFarmArea(HttpSession session){
		ModelAndView mav = new ModelAndView();
//		int mseq = Integer.parseInt(session.getAttribute("mseq").toString());
		//int year = Integer.parseInt(thisYear);
		
		mav.addObject("MY_FARM_INFO", applyFarmServiceImpl.myApplyFarmInfo(3, thisYear));
		mav.setViewName("applyFarm_applyfarm_user_myfarm_checkfarm");
		return mav;
	}
	
	//신청한 농장을 취소하는 컨트롤러
	@RequestMapping(value="/myFarm/user/cancelFarm.do")
	public ModelAndView cancelMyFarmArea(HttpSession session, ApplyFarmVO vo){
		ModelAndView mav = new ModelAndView();
//		int mseq = Integer.parseInt(session.getAttribute("mseq").toString());
		int mseq = 3; // 세션으로 받아올 예정
		vo.setMseq(mseq);
		vo.setYear(thisYear);
		applyFarmServiceImpl.cancelMyFarm(vo);
		mav.setViewName("applyFarm_applyfarm_user_myfarm_cancelresult");

		return mav;
	}
	//신청한 농장이 없는경우 나타날 페이지
	@RequestMapping(value="/myFarm/user/haventFarm.do")
	public ModelAndView haventFarm(){
		ModelAndView mav = new ModelAndView();

		mav.setViewName("applyFarm_applyfarm_user_myfarm_haventfarm");

		return mav;
	}
	
	@RequestMapping(value="/applyFarm/all/smsauth.do")
	@ResponseBody
	public String sendSmsAuth(@RequestParam String phoneNumber)
	{
		applyFarmServiceImpl.sendSmsAuthNumber(phoneNumber);
		System.out.println(phoneNumber);
		return "aa"; 
	}
	
	@RequestMapping(value="/applyFarm/all/checkAuthNumber.do")
	@ResponseBody
	public HashMap<String, Object> checkAuthNumber(@RequestParam String authNumber,
												  @RequestParam String phoneNumber)
	{
		//applyFarmServiceImpl.sendSmsAuthNumber(1);
		//System.out.println(phoneNumber);
		return applyFarmServiceImpl.checkAuthNumber(authNumber, phoneNumber);
	}
	
	//농장별 구획 셋팅하는 메서드...임시
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
	
	@RequestMapping(value="/test")
	public ModelAndView viewTest(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("applyFarm_applyfarm_all_applyfarm_smsauth");
		return mav;
	}
	
}
