package com.kosmo.applyfarm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	public HashMap<String, Integer> selectArea(@RequestParam int fgseq){
		System.out.println(fgseq);
		System.out.println(applyFarmServiceImpl.selectFarmArea(fgseq));
		return applyFarmServiceImpl.selectFarmArea(fgseq);
	}
	
	@RequestMapping(value="/applyFarm/all/writeForm.do")
	public ModelAndView goWriteForm(@RequestParam int fgseq,
									@RequestParam int areaseq){
		ModelAndView mav = new ModelAndView();
		mav.addObject("FG_SEQ", fgseq);
		mav.addObject("AREA_SEQ", areaseq);
		mav.setViewName("applyFarm_applyfarm_all_applyfarm_selectarea");
		return mav;
	}
	
}
