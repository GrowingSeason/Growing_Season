package com.kosmo.example;

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

import com.kosmo.applyfarm.ApplyFarmService;
import com.kosmo.member.MemberService;
import com.kosmo.member.MemberVO;

@Controller
public class example {
		
		
	@RequestMapping(value="/examplesidebar")
	public ModelAndView viewTest(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("example_example_exam_exam_sidebar");
		return mav;
	}
	@RequestMapping(value="/examplewithoutsidebar")
	public ModelAndView viewTest2(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("example_example_exam_exam_withoutsidebar");
		return mav;
	}
	
	
}
