package com.peco.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.peco.vo.Criteria;
import com.peco.vo.PageDto;
import com.peco.vo.R_ReplyVO;
import com.peco.vo.ReplyVO;
import com.peco.controller.CommonRestController;
import com.peco.service.R_ReplyService;
import com.peco.service.ReplyService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class ReplyController extends CommonRestController{
	
	@Autowired
	ReplyService service;
	
	@Autowired
	R_ReplyService r_service;
	
	/*
	 * @GetMapping("/reply/list/{bno}/{page}") public Map<String,Object>
	 * getList(@PathVariable("bno") int bno,@PathVariable("page") int page){
	 * 
	 * System.out.println("--댓글 조회 진입--"); log.info("bno : "+bno);
	 * log.info("page : "+page);
	 * 
	 * Criteria cri = new Criteria(); cri.setPageNo(page);
	 * 
	 * //페이지 처리 (시작번호~끝번호) List<ReplyVO> list =service.getList(bno, cri); int
	 * totalCnt = service.totalCnt(bno);
	 * 
	 * 
	 * //페이지 블럭을 생성 PageDto pageDto = new PageDto(cri, totalCnt) ;
	 * 
	 * Map<String,Object> map = new HashMap<String, Object>(); map.put("list",
	 * list); map.put("pageDto",pageDto); map.put("totalCnt",totalCnt);
	 * 
	 * return map;
	 * 
	 * //return responseListMap(list, pageDto); }
	 */
	
	@GetMapping("/reply/list/{bno}/{page}")
	public Map<String, Object> getList(@PathVariable("bno") int bno, @PathVariable("page") int page) {
	    log.info("--댓글 조회 진입--");
	    log.info("bno : " + bno);
	    log.info("page : " + page);

	    Criteria cri = new Criteria();
	    cri.setPageNo(page);

	    // 댓글 및 대댓글 정보 조회
	    List<ReplyVO> replyList = service.getList(bno, cri);
	    List<ReplyVO> rreplyList = service.getListWithRReply(bno, cri);
	    int totalCnt = service.totalCnt(bno);

	    // 페이지 블럭을 생성
	    PageDto pageDto = new PageDto(cri, totalCnt);

	    Map<String, Object> map = new HashMap<>();
	    map.put("list", replyList);
	    map.put("rlist", rreplyList);
	    map.put("pageDto", pageDto);
	    map.put("totalCnt", totalCnt);

	    return map;
	}

	
	
	@GetMapping("/reply/delete/{rno}")
	public Map<String,Object> delete(@PathVariable("rno")String rno) {
		System.out.println("--- 댓글 삭제 진입 ---");
		/*
		 * Map<String,Object> map = new HashMap<String, Object>();
		 * 
		 * int res = service.delete(rno);
		 * 
		 * if(res > 0) { map.put("result", "success"); }else { map.put("result",
		 * "fail"); map.put("message", "댓글 삭제중 예외가 발생하였습니다."); }
		 * 
		 * return map;
		 */
				//위의 과정을 함수로 만든거로 처리
		return responseDeleteMap(service.delete(rno));
	}
	
	/**
	 * RequestBody
	 * 		JSON데이터를 원하는 타입으로 바인딩 처리
	 * 
	 * @param vo
	 * @return
	 */
	@PostMapping("/reply/insert/")
	public Map<String,Object> insert(@RequestBody ReplyVO vo) {
		System.out.println("--- 댓글 추가 진입 ---");
		
		log.info("replyVO :"+vo);
		Map<String,Object> map = new HashMap<String, Object>();
		
		
		try {
			int res = service.insert(vo);
			return map = responseWriteMap(res);
				
		}catch (Exception e) {
			map.put("result","fail");
			//map.put("message",e.getMessage());
			
			// 에러 메시지를 가져와서 처리
	        String errorMessage = e.getMessage();
	        if (errorMessage.contains("REPLYER")) {
	            map.put("message", "로그인 후 등록가능합니다.");
	            
	            
	        } else if(errorMessage.contains("SQLIntegrityConstraintViolationException")) {
	        	map.put("message", "로그인 후 등록가능합니다.");
	        }else {
	        	map.put("message", errorMessage);
	        	
	        }
			
		}

		
		return map;
		
	}
	
	@PostMapping("/reply/update/")
	public Map<String,Object> update(@RequestBody ReplyVO vo) {
		
		System.out.println("--- 댓글 수정 진입 ---");
		
		log.info("replyVO :"+vo);
		
		/*
		 * int res = service.update(vo);
		 * 
		 * Map<String,Object> map = new HashMap<String, Object>();
		 * 
		 * if(res > 0) { map.put("result", "success"); }else { map.put("result",
		 * "fail"); map.put("message", "댓글 수정중 예외가 발생하였습니다."); }
		 * 
		 * return map;
		 */
		return responseEditMap(service.update(vo));
	}

	
	
	//-----------------------------대댓글 시작--------------------//
	
	@GetMapping("/r_reply/list/{rno}/{page}")
	public Map<String,Object> getRList(@PathVariable("rno") int rno,@PathVariable("page") int page){
		
		System.out.println("--댓글 조회 진입--");
		log.info("rno : "+rno);
		log.info("page : "+page);
		
		Criteria cri =  new Criteria();
		cri.setPageNo(page);
		
		//페이지 처리 (시작번호~끝번호)
		List<R_ReplyVO> list =r_service.getList(rno, cri);
		int totalCnt = service.totalCnt(rno);
		
		//페이지 블럭을 생성
		PageDto pageDto = new PageDto(cri, totalCnt) ;
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageDto",pageDto);
		map.put("totalCnt",totalCnt);
		
		return map;
		
	}
	
	
	
	
	@PostMapping("/r_reply/insert/")
	public Map<String,Object> insert(@RequestBody R_ReplyVO vo) {
		System.out.println("--- 대댓글 작성 진입 ---");
		
		log.info("r_replyVO :"+vo);
		Map<String,Object> map = new HashMap<String, Object>();
		
		
		try {
			int res = r_service.insert(vo);
			return map = responseWriteMap(res);
				
		}catch (Exception e) {
			map.put("result","fail");
			//map.put("message",e.getMessage());
			
			// 에러 메시지를 가져와서 처리
	        String errorMessage = e.getMessage();
	        if (errorMessage.contains("REPLYER")) {
	            map.put("message", "로그인 후 등록가능합니다.");
	            
	            
	        } else if(errorMessage.contains("SQLIntegrityConstraintViolationException")) {
	        	map.put("message", "로그인 후 등록가능합니다.");
	        }else {
	        	map.put("message", errorMessage);
	        	
	        }
			
		}

		
		return map;
		
	}
	
	
}
