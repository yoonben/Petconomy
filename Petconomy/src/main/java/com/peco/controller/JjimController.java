package com.peco.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.peco.service.JjimService;
import com.peco.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/peco/*")
@Log4j
public class JjimController {

	@Autowired
	JjimService jimservice;
	
	/*
	@RequestMapping(value = "/main/insert", method = RequestMethod.POST)
	public String insert(@RequestParam("p_id") String p_id, HttpSession session) {
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    int count = jimservice.count(member.getId(), p_id);
		if(count==0) {
			jimservice.insert(member.getId(), p_id);
		} 
		return "redirect:/main/pesion";
	}
	*/
	/*
	@RequestMapping(value="/main/insert.do", method = RequestMethod.POST)
	public String insert(String p_id, HttpSession session) {
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    int count = jimservice.count(member.getId(), p_id);
		if(count==0) {
			jimservice.insert(member.getId(), p_id);
		} 
		return "redirect:/peco/main/pesion";
	}
	
	@RequestMapping("/main/delete.do")
	public String delete(String p_id, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		int count = jimservice.count(member.getId(), p_id);
		if(count!=0) {
			jimservice.delete(member.getId(), p_id);
		} 
		return "redirect:/peco/main/pesion";
	}
	*/
	
}
