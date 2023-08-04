package com.peco.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.peco.service.HospitalReviewService;
import com.peco.vo.Criteria;
import com.peco.vo.HospitalReviewVO;
import com.peco.vo.PageDto;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/peco/*")
public class HospitalReviewController extends CommonRestController {
	
	@Autowired
	HospitalReviewService service;
	
	@GetMapping("/reviewHospital/list/{h_id}/{page}")
	public Map<String, Object> getList(@PathVariable("h_id") String h_id
								, @PathVariable("page") int page){
		
		
		Criteria cri = new Criteria();
		cri.setPageNo(page);
		
		
		
		// 페이지 처리(시작번호~끝번호)
		List<HospitalReviewVO> list = service.getList(h_id, cri);
		List<HospitalReviewVO> reviewerList = service.getReviewerList(h_id);
		
		int totalCnt = service.totalCnt(h_id);		
		// 페이지블럭을 생성
		PageDto pageDto = new PageDto(cri, totalCnt);	
		
		return responseReviewListMap(list, pageDto, reviewerList);
		
	}
	
	
	@GetMapping("/reviewHospital/delete/{hr_no}")
	public Map<String, Object> delete(@PathVariable("hr_no") int hr_no){
		
		return responseDeleteMap(service.delete(hr_no));
	}
	
	
	/**
	 * RequestBody
	 * 		JSON 데이터를 원하는 타입으로 바인딩 처리
	 * 		파라메터 자동수집
	 * 
	 * @param vo
	 * @return
	 */
	@PostMapping("/reviewHospital/insert")
	public Map<String, Object> insert(@RequestBody HospitalReviewVO vo){
		log.info("================= insert");
		log.info("replyVO" + vo);
		
		Map<String, Object> map = new HashMap<String, Object>();

		try {
			int res = service.insert(vo);
			
			return map = responseWriteMap(res);
			
					
		}catch (Exception e) {
			map.put("result", "fail");
			map.put("message", e.getMessage());
		}
			
		return map;
	}
	
	@PostMapping("/reviewHospital/editAction")
	public Map<String, Object> update(@RequestBody HospitalReviewVO vo){
		return responseEditMap(service.update(vo));
	}

}
