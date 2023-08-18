package com.peco.controller;

import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peco.service.HospitalService;
import com.peco.service.PensionService;
import com.peco.service.ResService;
import com.peco.vo.H_RESVO;
import com.peco.vo.HospitalFileuploadVO;
import com.peco.vo.P_RESVO;
import com.peco.vo.PensionFiileuploadVO;
import com.peco.vo.PensionVO;

@Controller
@RequestMapping("/peco/*")
@MultipartConfig
public class ResController {
	
   @Autowired 
   ResService service;
   PensionService pensionService;
   HospitalService hospitalService;
   
   @GetMapping("/restest") //연결테스트
	public String getOne(Model model) {
		
	    String h_id = "h_4";
	    String p_id = "p_3";
	    String room_no = "0";
	    
	    model.addAttribute("h_id",h_id);
	    model.addAttribute("p_id",p_id);
	    model.addAttribute("room_no",room_no);
		
		return "/resvation/resTest";
	}
   
   @RequestMapping(value="/peco/PensionRes",method = RequestMethod.GET)
   public String getPension(Model model, String p_id, String room_no) {
	   
	   
	   System.out.println(p_id);
	   System.out.println(room_no);
	   
	   PensionFiileuploadVO pensionImg = service.getPesionImg(p_id);
	   String pensionConvertedPath = pensionImg.getSavePath().replace("\\", "/");
	   
	   model.addAttribute("pImg",pensionConvertedPath);
       model.addAttribute("pList", service.getPensionList(p_id, room_no));
       model.addAttribute("disabledate", service.getPensionDisableDate(p_id, room_no));
   
	   
	   return "resvation/pensionRes";
   }
   
   @RequestMapping(value="/peco/hospitalRes",method = RequestMethod.GET)
   public String getHospital(Model model, String h_id) {
	   
	   HospitalFileuploadVO HospitalImg = service.getHospitalImg(h_id);
	   String HospitalConvertedPath = HospitalImg.getSavePath().replace("\\", "/");	   

	   model.addAttribute("hImg", HospitalConvertedPath);
	   model.addAttribute("hList", service.getHospitalList(h_id));
	   model.addAttribute("disabledate", service.getHospitalDisableDate(h_id));
	   
	   
	   return "resvation/hospitalRes";
   }
   
   @RequestMapping(value="/peco/insert", method=RequestMethod.POST)
	public void insertAction(P_RESVO p_resVO, HttpServletRequest request) {
           
           String pr_id = request.getParameter("pr_id");
           String startdate = request.getParameter("startdate");
           String enddate = request.getParameter("enddate");
           String pr_pay = request.getParameter("pr_pay");
           String period = request.getParameter("period");
           String p_id = request.getParameter("p_id");
           String pricecnt = request.getParameter("pricecnt");
           String pr_name = request.getParameter("pr_name");
           String pr_email = request.getParameter("pr_email");
           String pr_tel = request.getParameter("pr_tel");
           String imp_uid = request.getParameter("imp_uid");
           String m_id = request.getParameter("m_id");
           String pname = request.getParameter("pname");
           String roomname = request.getParameter("roomname");
           String room_no = request.getParameter("room_no");
           
           System.out.println("room_no"+room_no);

           service.insertResvationPension(p_resVO);
           System.out.println("성공");
	}
   
   @RequestMapping(value="/peco/createHospital", method=RequestMethod.POST)
   public void insertActionHospital(H_RESVO h_resVO, HttpServletRequest request) {
	   
	   String hr_id = request.getParameter("hr_id");
	   String hr_pay = request.getParameter("hr_pay");
	   String hr_date = request.getParameter("hr_date");
	   String hr_time = request.getParameter("hr_time");
	   String h_id = request.getParameter("h_id");
	   String pricecnt = request.getParameter("pricecnt");
	   String hr_name = request.getParameter("hr_name");
	   String hr_email = request.getParameter("hr_email");
	   String hr_tel = request.getParameter("hr_tel");
	   String imp_uid = request.getParameter("imp_uid");
	   String m_id = request.getParameter("m_id");
	   String hname = request.getParameter("hname");
   
	   service.insertResvationHospital(h_resVO);
	   System.out.println("성공");
   }

   @RequestMapping(value="/profile?m_id=${m_id}",method = RequestMethod.POST)
   public String redirect(Model model, String m_id, PensionVO vo){
	   
	   List<PensionVO> pensionlist = pensionService.mypensionlist(vo.getM_id());
		
		if (pensionlist != null) {
	    	for (PensionVO pension : pensionlist) {
	        String convertedPath = pension.getSavePath().replace("\\", "/");
	        pension.setSavePath(convertedPath);
	        
	    	}
	    	System.out.println("=============pensionlist================== (2) : " +  pensionlist);
	    } 
		
		model.addAttribute("pension",pensionlist); 
	   model.addAttribute("getPrList",service.getResPensionList(m_id));
	   model.addAttribute("getHrList",service.getResHospitalList(m_id));
	   
	   
	   return "/member/profile";
   }
   
   @ResponseBody
   @RequestMapping(value="/peco/delete", method=RequestMethod.POST)
   public void deleteRes(HttpServletRequest request) {
	   
	   String imp_uid = request.getParameter("imp_uid");

	   System.out.println("del : "+imp_uid);
	   int res = service.deleteResPension(imp_uid);
	   
	   if(res>0) {
		   System.out.println("삭제완료");
	   } else {
		   System.out.println("삭제중오류");
	   }
	   
   }
   
   @ResponseBody
   @RequestMapping(value="/peco/hospitalDel", method=RequestMethod.POST)
   public void deleteHospitalRes(HttpServletRequest request) {
	   
	   String imp_uid = request.getParameter("imp_uid");
	   
	   System.out.println("del : "+imp_uid);
	   int res = service.deleteResHospital(imp_uid);
	   System.out.println(res);
	   
	   if(res>0) {
		   System.out.println("삭제완료");
	   } else {
		   System.out.println("삭제중오류");
	   }
	   
   }
}