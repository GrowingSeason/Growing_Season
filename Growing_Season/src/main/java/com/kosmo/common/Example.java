package com.kosmo.common;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



/**
 * Handles requests for the application home page.
 */
@Controller
public class Example {
	
	@RequestMapping(value="/snsadmin.do")
	public ModelAndView snsListAdmin(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("sns_sns_admin_sns_sample");

		return mav;
	}
	
	@RequestMapping(value="/common.do")
	public ModelAndView commontest(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
	
		mav.setViewName("board_board_user_board_sample");

		return mav;
	}
	
	@RequestMapping(value="/snsuser.do")
	public ModelAndView commonsnstest(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("sns_sns_user_sns_sample");

		return mav;
	}
	
}
