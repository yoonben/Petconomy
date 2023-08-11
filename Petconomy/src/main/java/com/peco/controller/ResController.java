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
   
   @GetMapping("/restest")
	public String getOne(Model model) {
		
	    String h_id = "h_01";
	    String a = "";
		
	    HospitalVO hospital = hospitalService.getOne(h_id);
	    if(hospital != null) {
	    	a = "not null";
	    } else {
	    	a = "null";    	
	    }
		
		model.addAttribute("hospital", a);
		
		return "/resvation/resTest";
	}

   @GetMapping("/pensionRes") //url연결 전 임시
   public String getPensionList(Model model) {     
	   
	   	  String m_id = "m_2";
		  String p_id = "p_01";
		  String room_no = "r_01";

		  model.addAttribute("mList", service.getMemberList(m_id));
	      model.addAttribute("pList", service.getPensionList(p_id, room_no));
	      model.addAttribute("disabledate", service.getPensionDisableDate(p_id, room_no));


	   return "resvation/pensionRes";
   }
   
   @GetMapping("/pensionRes/{p_id}/{room_no}")
   public String pathPension(Model model, PensionVO pensionVO
		   , @PathVariable("p_id") String p_id
		   , @PathVariable("room_no") String room_no) {     
	   
	   PensionVO pension = pensionService.getOne(pensionVO.getP_id()); //p_id로 펜션 정보 가져오기
	   room_no = pension.getRn();
	   
	   model.addAttribute("pList", pension);
	   model.addAttribute("disabledate", service.getPensionDisableDate(p_id, room_no));
	   
	   return "resvation/pensionRes";
   }
   
   @GetMapping("/hospitalRes")//url연결 전 임시
   public String getHospitalList(Model model) {

	   String m_id = "m_2"; //getM_id()로 세션에서 받아올 값
	   String h_id = "h_01";//상세페이지에서 요청받을때 파라메터로 같이 가져올 값
	   
	   HospitalVO hospital = hospitalService.getOne(h_id);
	   
	   model.addAttribute("mList", service.getMemberList(m_id));
	   model.addAttribute("hList", service.getHospitalList(h_id));
	   model.addAttribute("disabledate", service.getHospitalDisableDate(h_id));
	   model.addAttribute("hospital", hospital);
	   
	   return "resvation/hospitalRes";
   }
   
   @GetMapping("/hospitalRes/{h_id}")
   public String ajaxHospital(Model model, HospitalVO hospitalVO, String h_id) {
	   
	   HospitalVO hospital = hospitalService.getOne(hospitalVO.getH_id()); //h_id로 병원 정보 가져오기
	   
	   model.addAttribute("hList", hospital);
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
   
   @GetMapping("/redirect")
   public String redirect(Model model){
	   
		  String m_id = "m_2";
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