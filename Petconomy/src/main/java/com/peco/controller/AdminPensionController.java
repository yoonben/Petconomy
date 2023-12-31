package com.peco.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.peco.service.AdminPensionService;
import com.peco.vo.Criteria;
import com.peco.vo.PageDto;
import com.peco.vo.PensionFiileuploadVO;
import com.peco.vo.PensionVO;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/peco/*")
public class AdminPensionController extends CommonRestController {

	@Autowired
	AdminPensionService adminPensionService;
	
	@GetMapping("/adminPension/list/{page}")
	public Map<String, Object> getPensionList(@PathVariable("page") int page){
		Criteria cri = new Criteria();
		cri.setPageNo(page);
		
		List<PensionVO> list = adminPensionService.getPensionList(cri);
		
		int totalCnt = adminPensionService.totalCnt();
		
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		return responseMemberListMap(list, pageDto);
	}
	
	@GetMapping("/adminPension/update/{p_id}")
	public Map<String, Object> update(@PathVariable("p_id") String p_id){
		
		return responseDeleteMap(adminPensionService.update(p_id));
	}
	
	@GetMapping("/adminPension/imgOn/{p_id}")
	public Map<String, Object> imgOn(@PathVariable("p_id") String p_id){
		
		List<PensionFiileuploadVO> blist = adminPensionService.getPensionBList(p_id);
		
		System.out.println(blist.toString()+"============================================");
		
		return responsePensionBListMap(blist);
	}
	
}
