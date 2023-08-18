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

import com.peco.service.R_ReplyService;
import com.peco.vo.R_ReplyVO;

@RestController
@RequestMapping("/r_reply/*")
public class R_ReplyController extends CommonRestController{
	
	   @Autowired
	   R_ReplyService r_replyService;

	    // 대댓글 조회
	    @GetMapping("/list/{rno}")
	    public Map<String, Object> getRReplyList(@PathVariable("rno") int rno) {
	        Map<String, Object> map = new HashMap<>();
	        List<R_ReplyVO> rReplyList = r_replyService.getList(rno);
	        int totalCnt = r_replyService.totalCnt(rno);
	        map.put("rlist", rReplyList);
	        map.put("totalCnt", totalCnt);
	        return map;
	    }

	    // 대댓글 작성
	    @PostMapping("/insert")
	    public Map<String, Object> insertRReply(@RequestBody R_ReplyVO r_reply) {
	    	Map<String,Object> map = new HashMap<String, Object>();
			
			
			try {
				int res = r_replyService.insert(r_reply);
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
		        } else {
		        	map.put("message", errorMessage);
		        	
		        }
				
			}

			
			return map;
	    }

	    // 대댓글 수정
	    @PostMapping("/update")
	    public Map<String, Object> updateRReply(@RequestBody R_ReplyVO r_reply) {
	        
	    	
	    	return responseEditMap(r_replyService.update(r_reply));
	    }

	    // 대댓글 삭제
	    @GetMapping("/delete/{rrno}")
	    public Map<String, Object> deleteRReply(@PathVariable("rrno") int rrno) {
	        
	        return responseDeleteMap(r_replyService.delete(rrno));
	    }

}
