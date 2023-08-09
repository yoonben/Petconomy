package com.peco.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.peco.service.AdminReviewService;
import com.peco.vo.Criteria;
import com.peco.vo.HospitalReviewVO;
import com.peco.vo.MemberVO;
import com.peco.vo.PageDto;
import com.peco.vo.PensionReviewVO;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/peco/*")
public class AdminReviewController extends CommonRestController {
	
	@Autowired
	AdminReviewService adminReviewService;
	
	@GetMapping("/adminPpReview/list/{page}")
	public Map<String, Object> getPReviewList(@PathVariable("page") int page){
		Criteria cri = new Criteria();
		cri.setPageNo(page);
		
		List<PensionReviewVO> list = adminReviewService.getPReviewList(cri);
		
		int totalCnt = adminReviewService.ptotalCnt();
		
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		return responseMemberListMap(list, pageDto);
	}
	
	@GetMapping("/adminHhReview/list/{page}")
	public Map<String, Object> getHReviewList(@PathVariable("page") int page){
		Criteria cri = new Criteria();
		cri.setPageNo(page);
		
		List<HospitalReviewVO> list = adminReviewService.getHReviewList(cri);
		
		int totalCnt = adminReviewService.htotalCnt();
		
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		return responseMemberListMap(list, pageDto);
	}
	
	@GetMapping("/adminPpReview/delete/{pr_no}")
	public Map<String, Object> pdelete(@PathVariable("pr_no") int pr_no){
		
		return responseDeleteMap(adminReviewService.pdelete(pr_no));
	}
	
	@GetMapping("/adminHhReview/delete/{hr_no}")
	public Map<String, Object> hdelete(@PathVariable("hr_no") int hr_no){
		
		return responseDeleteMap(adminReviewService.hdelete(hr_no));
	}

}
