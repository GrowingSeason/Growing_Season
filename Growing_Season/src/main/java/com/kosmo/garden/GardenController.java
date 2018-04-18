package com.kosmo.garden;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class GardenController {


	String upload_file_dir="C:\\Users\\정규반\\git\\Growing_Season\\Growing_Season\\src\\main\\webapp\\uploads";

	@Autowired
	GardenService service;
	
	@RequestMapping(value="/applyGarden/user/applyGarden_step1.do")
	public ModelAndView applyGardenStep1(HttpServletRequest request, HttpServletResponse response) {

		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		int mseq = (Integer)session.getAttribute("LVL_SESS_MSEQ");
		MemberVO mvo = service.getMemberInfo(mseq);
		
		mav.addObject("LVL_MVO",mvo);
		mav.setViewName("applyGarden_garden_user_applygarden_step1");
		return mav;
	}
	
	
	
	@RequestMapping(value="/applyGarden/user/applyGarden_step2.do")
	public ModelAndView applyGardenStep2(HttpServletRequest request,HttpServletResponse response, 
			@RequestParam(value="fgseq") int fgseq
			,@RequestParam(value="apdivision") String apdivision) {
		
		
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		int mseq = (Integer)session.getAttribute("LVL_SESS_MSEQ");

		MemberVO mvo = service.getMemberInfo(mseq);
		
		FarmGardenVO fgvo = service.getFgInfoByFseq(fgseq);
		System.out.println(fgvo.getFgaddress());
		mav.addObject("LVL_FGVO",fgvo);
		mav.addObject("LVL_MVO",mvo);
		mav.addObject("LVL_FGSEQ", fgseq);
		mav.addObject("LVL_APDIVISION", apdivision);
		
		mav.setViewName("applyGarden_garden_user_applygarden_step2");
		return mav;
	}
	
	@RequestMapping(value="/apply/user/apply_main.do")
	public ModelAndView applyMain(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
			
		mav.setViewName("applyGarden_apply_user_apply_main2");
		return mav;
	}

		
	@RequestMapping(value="/applyGarden/user/documentInsert.do")
	public String applyGardenInsert(HttpServletRequest request,@ModelAttribute(value = "dvo") DocumentVO dvo, 
			@ModelAttribute(value = "avo") ApplyGardenVO avo,
			@RequestParam(value="files") MultipartFile [] files){
		int tryNum=0;

		
		HttpSession session = request.getSession();
		int mseq = (Integer)session.getAttribute("LVL_SESS_MSEQ");

		int cnt = service.applyGardenCntByMseq(mseq);
		
		if(cnt==0){//기존 신청서가 없을때만.
		int r = service.applyGardenInsert(avo);
		System.out.println(r+"건 입력");
		}
		
		ApplyGardenVO avo2 = service.applyGardenByMseq(mseq);
		
		int apseq = avo2.getApseq();
		dvo.setApseq(apseq);
		
		
		
		//반려된 서류가 있을경우, 반려된 기존서류들의 dreturn컬럼값을 'NN'으로 변경
		int dr = service.documentReturnChange(apseq);
		System.out.println(dr+"건 NN으로 변경");
		
		
		
		
		for(int i=0;i<files.length;i++){
		//Multipart+어노테이션이용
		if(!files[i].isEmpty()) { // multipart파일 : byte[] 타입. 
			String fullPath = upload_file_dir+"\\"+dvo.getMseq()+"_"+files[i].getOriginalFilename(); 
			File newFile = new File(fullPath); //파일생성. path에 파일 만듬. 아직 빈깡통상태.
			dvo.setDfileSize(newFile.length()); // 사이즈 아직 0
			
			try {
				files[i].transferTo(newFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			dvo.setDfileSize(files[i].getSize()); // 이제 사이즈 0 아님 ㅎ
			dvo.setDfilePath(upload_file_dir); // 경로 셋
			dvo.setDfileName(dvo.getMseq()+"_"+files[i].getOriginalFilename());
		}
		service.documentInsert(dvo);
		tryNum++;
		}
		
		
		
		System.out.println("총"+tryNum + "건 업로드");
		
		return "redirect:/applyGarden/user/applyGarden_complete.do";
	}
	
	@RequestMapping(value="/myGarden/user/cancelGarden.do")
	public String applyCancel(HttpServletRequest request,@RequestParam("apseq") int apseq) {
		
		int res = service.applyGardenCancel(apseq);
		System.out.println(res + "건 취소됨. apseq = "+apseq);
		return "redirect:/myApplyCondition/all/applyCondition_main.do";
	}
	
	
	
	
	
	@RequestMapping(value="/applyGarden/user/applyGarden_complete.do")
	public ModelAndView applyGardenComplete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("applyGarden_garden_user_applygarden_complete");
		return mav;
	}
	
	
	
	@RequestMapping(value="/applyGarden/user/applyGarden_payment.do")
	public ModelAndView applyGardenPaymentPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("applyGarden_garden_user_applygarden_payment");
		return mav;
	}
	
	
	

	@RequestMapping(value="/applyGarden/user/applyGarden_payexecute.do")
	public String applyGardenPayment(HttpServletRequest request,HttpServletResponse response, @RequestParam String pay) {
		
		HttpSession session = request.getSession();
		int mseq = (Integer)session.getAttribute("LVL_SESS_MSEQ");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		ApplyGardenVO avo = service.applyGardenByMseq(mseq);
		
		int i = service.applyGardenPayComplete(avo.getApseq());
		
		System.out.println(i+"건 입력 완료");
		out.println("<script>alert('결제처리가 완료되었습니다.')</script>");
		
		
		return "redirect:/myGarden/user/mygarden_condition";
	}
	
	
	@RequestMapping(value="/applyGarden/user/applyGarden_document.do")
	public ModelAndView document(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		int mseq = (Integer)session.getAttribute("LVL_SESS_MSEQ");
		ArrayList<DocumentVO> dlist = service.documentListByMseq(mseq);
		mav.addObject("LVL_DOCLIST",dlist); 
		mav.setViewName("applyGarden_garden_user_mygarden_document");
		return mav;
	}
	
	
	
	
	
	@RequestMapping(value="/location/all/farmLocation.do")
	public ModelAndView farmAddress(HttpServletRequest request){

		ModelAndView mav = new ModelAndView();
		
		ArrayList<String> fgdivList = service.getFgDivision();
		
		mav.addObject("LVL_FGDIVLIST",fgdivList);
		
		mav.setViewName("applyGarden_garden_all_farm_location");
		return mav;
	}
	
	
	
	
	
	
	

	
	@RequestMapping(value="/findFarmAddress1.do")
	@ResponseBody
	public ArrayList<String> findFarmAddress1(HttpServletRequest request, HttpServletResponse response, @RequestParam String fgDivision){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		
		System.out.println(fgDivision);
		ArrayList<String> fgDetailDivList = service.getFgDetailDiv(fgDivision);
		System.out.println(fgDetailDivList.size()+"사이즈");
		
		return fgDetailDivList;
	}

	
	@RequestMapping(value="/findFarmAddress2.do")
	@ResponseBody
	public ArrayList<String> findFarmAddress2(HttpServletRequest request, HttpServletResponse response,@RequestParam String fgDetailDiv){
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		System.out.println(fgDetailDiv);
		ArrayList<String> fgLocationList = service.getFgLocation(fgDetailDiv);
		System.out.println(fgLocationList.size()+"사이즈");
		
		return fgLocationList;
	}
	
	
	
	@RequestMapping(value="/findFarmAddress3.do")
	@ResponseBody
	public ArrayList<String> findFarmAddress3(HttpServletRequest request, HttpServletResponse response,@RequestParam String fgDivision,@RequestParam String fgDetailDiv,@RequestParam String fgLocation){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		
		System.out.println(fgDivision+fgDetailDiv+fgLocation);
		ArrayList<String> fgNameList = service.getFgName(fgDivision, fgDetailDiv, fgLocation);
		System.out.println(fgNameList.size()+"사이즈");
		return fgNameList;
	}
	
	@RequestMapping(value="/findFarmAddress4.do")
	@ResponseBody
	public FarmGardenVO findFarmAddress4(HttpServletRequest request, HttpServletResponse response,@RequestParam String fgDivision,@RequestParam String fgDetailDiv,
			@RequestParam String fgLocation,@RequestParam String fgName){
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		
		FarmGardenVO fvo = service.getFgInfo(fgDivision, fgDetailDiv, fgLocation, fgName);
		return fvo;
	}
	

	
	@RequestMapping(value="/myApplyCondition/all/applyCondition_main.do")
	public ModelAndView applyConditionMain(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("applyGarden_garden_all_applycondition_main");
		return mav;
	}	

	

	@RequestMapping(value="/myGarden/user/mygarden_condition.do")
	public ModelAndView gardenCondition(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		int mseq = (Integer)session.getAttribute("LVL_SESS_MSEQ");
		
		ApplyGardenVO avo = service.applyGardenByMseq(mseq);
		ArrayList<DocumentVO> docList = service.documentListByMseq(mseq);
		
		FarmGardenVO fgvo = service.getFgInfoByFseq(avo.getFgseq());
		
		String docuReturn="";
		
		int apseq = service.applyGardenByMseq(mseq).getApseq();
		
		if(service.documentReturnCount(apseq)==0){
		docuReturn="N" ;
		}else{
		docuReturn="Y" ;	
		}

		String dreturnCause="";
		for(int i=0;i<docList.size();i++){
			if(docList.get(i).getDreturnCause()!=null){
				dreturnCause=docList.get(i).getDreturnCause();
				break;
			}
		}

		
		mav.addObject("LVL_DRETURNCAUSE",dreturnCause);
		mav.addObject("LVL_DOCURETURN",docuReturn);
		mav.addObject("LVL_DOCLIST",docList);
		mav.addObject("LVL_AGVO", avo);
		mav.addObject("LVL_FGVO",fgvo);
		mav.setViewName("applyGarden_garden_user_mygarden_condition");
		return mav;
	}	
	
	
	
}
