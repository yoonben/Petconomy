package com.peco.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.peco.service.AdminMemberService;
import com.peco.vo.Criteria;
import com.peco.vo.MemberVO;
import com.peco.vo.PageDto;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/peco/*")
public class AdminMemberController extends CommonRestController {
	
	@Autowired
	AdminMemberService adminService;
	
	@GetMapping("/adminMember/list/{page}")
	public Map<String, Object> getMemberList(@PathVariable("page") int page){
		Criteria cri = new Criteria();
		cri.setPageNo(page);
		
		List<MemberVO> list = adminService.getMemberList(cri);
		
		int totalCnt = adminService.totalCnt();
		
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		return responseMemberListMap(list, pageDto);
	}
	
	@GetMapping("/adminMember/delete/{m_id}")
	public Map<String, Object> delete(@PathVariable("m_id") String m_id){
		
		return responseDeleteMap(adminService.delete(m_id));
	}
	
	@GetMapping("/adminMember/deletemember/{m_id}")
	public Map<String, Object> deletemember(@PathVariable("m_id") String m_id,HttpSession session){
		
		        int res = adminService.delete(m_id);
		        session.removeAttribute("member");
		return responsememberDeleteMap(res);
	}
	
	@GetMapping("/adminMember/update/{m_id}")
	public Map<String, Object> update(@PathVariable("m_id") String m_id){
		
		return responseDeleteMap(adminService.update(m_id));
	}
	
	
}
