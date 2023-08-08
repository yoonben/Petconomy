package com.peco.controller;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peco.service.ResService;
import com.peco.vo.H_RESVO;
import com.peco.vo.P_RESVO;

@Controller
@RequestMapping("/peco/*")
@MultipartConfig
public class ResController {
	
   @Autowired 
   ResService service;
   
   @GetMapping("/pensionRes")
   public String getPensionList(Model model) {   
      
      model.addAttribute("mList", service.getMemberList());
      model.addAttribute("pList", service.getPensionList());
      model.addAttribute("disabledate", service.getPensionDisableDate());
      
	   return "resvation/pensionRes";
   }
   
   @GetMapping("/hospitalRes")
   public String getHospitalList(Model model) {
	   
	   model.addAttribute("mList", service.getMemberList());
	   model.addAttribute("hList", service.getHospitalList());
	   model.addAttribute("disabledate", service.getHospitalDisableDate());
	   
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

           service.insertResvationPension(p_resVO);
           System.out.println("성공");
	}
   
   @RequestMapping(value="/peco/insertHospital", method=RequestMethod.POST)
   public void insertActionHospital(H_RESVO h_resVO, HttpServletRequest request) {
	   
	   System.out.println("aaaaaa");
	   
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
	   String pname = request.getParameter("pname");
	   
//	   System.out.println(hr_id);
//	   System.out.println(hr_pay);
//	   System.out.println(hr_date);
//	   System.out.println(hr_time);
//	   System.out.println(h_id);
//	   System.out.println(pricecnt);
//	   System.out.println(hr_name);
//	   System.out.println(hr_email);
//	   System.out.println(hr_tel);
//	   System.out.println(imp_uid);
//	   System.out.println(m_id);
//	   System.out.println(pname);

	   
	   service.insertResvationHospital(h_resVO);
	   System.out.println("성공");
   }
   
   @GetMapping("/redirect")
   public String redirect(Model model){
	   
	   model.addAttribute("getRList",service.getResPensionList());
	   
	   return "resvation/success";
   }
   
   @ResponseBody
   @RequestMapping(value="/peco/delete", method=RequestMethod.POST)
   public void deleteRes(HttpServletRequest request) {
	   
	   String imp_uid = request.getParameter("imp_uid");
	   
	   System.out.println("del : "+imp_uid);
	   int res = service.deleteResPension(imp_uid);
	   
	   if(res>0) {
		   System.out.println("정상삭제");
	   } else {
		   System.out.println("삭제중 오류");
	   }
	   
   }
   
}