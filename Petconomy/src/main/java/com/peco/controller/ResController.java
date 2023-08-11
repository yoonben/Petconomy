package com.peco.controller;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peco.service.HospitalService;
import com.peco.service.MemberService;
import com.peco.service.PensionService;
import com.peco.service.ResService;
import com.peco.vo.H_RESVO;
import com.peco.vo.HospitalVO;
import com.peco.vo.MemberVO;
import com.peco.vo.P_RESVO;
import com.peco.vo.PensionVO;

@Controller
@RequestMapping("/peco/*")
@MultipartConfig
public class ResController {
	
   @Autowired 
   ResService service;
   PensionService pensionService;
   HospitalService hospitalService;
   
   @GetMapping("/restest") //연결 테스트
	public String getOne(Model model) {
		
	    String h_id = "99";
	    String p_id = "111";
	    String room_no = "r_02";
	    
	    model.addAttribute("h_id",h_id);
	    model.addAttribute("p_id",p_id);
	    model.addAttribute("room_no",room_no);
		
		return "/resvation/resTest";
	}
   
   @RequestMapping(value="/peco/PensionRes",method = RequestMethod.GET)
   public String getPension(Model model, String p_id, String room_no) {
	   
	   String m_id = "m_3";
	   
	   System.out.println(p_id);
	   System.out.println(room_no);
	   
	   model.addAttribute("mList", service.getMemberList(m_id));
	      model.addAttribute("pList", service.getPensionList(p_id, room_no));
	      model.addAttribute("disabledate", service.getPensionDisableDate(p_id, room_no));
	   
	   
	   return "resvation/pensionRes";
   }
   
   @RequestMapping(value="/peco/hospitalRes",method = RequestMethod.GET)
   public String getHospital(Model model, String h_id) {

	   String m_id = "m_3";
	   
	   model.addAttribute("mList", service.getMemberList(m_id));
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
   
   @RequestMapping(value="/peco/redirect",method = RequestMethod.GET)
   public String redirect(Model model, String m_id){

	   System.out.println("m_id : "+m_id);
	   
	   model.addAttribute("getPrList",service.getResPensionList(m_id));
	   model.addAttribute("getHrList",service.getResHospitalList(m_id));
	   
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
   
   @ResponseBody
   @RequestMapping(value="/peco/hospitalDel", method=RequestMethod.POST)
   public void deleteHospitalRes(HttpServletRequest request) {
	   
	   String imp_uid = request.getParameter("imp_uid");
	   
	   System.out.println("del : "+imp_uid);
	   int res = service.deleteResHospital(imp_uid);
	   System.out.println(res);
	   
	   if(res>0) {
		   System.out.println("정상삭제");
	   } else {
		   System.out.println("삭제중 오류");
	   }
	   
   }
}