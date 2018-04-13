package com.kosmo.garden;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class GardenController {

	
	@RequestMapping(value="/applyGardenStep1.do")
	public ModelAndView applyGarden(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("applyGarden_garden_user_applygarden_step1");
		return mav;
	}
	
}
