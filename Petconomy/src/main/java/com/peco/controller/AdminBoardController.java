package com.peco.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.peco.service.AdminBoardService;
import com.peco.vo.BoardVO;
import com.peco.vo.Criteria;
import com.peco.vo.PageDto;

@RestController
@RequestMapping("/peco/*")
public class AdminBoardController extends CommonRestController {
	
	@Autowired
	AdminBoardService adminService;
	
	@GetMapping("/adminBoard/list/{page}")
	public Map<String, Object> getBoardList(@PathVariable("page") int page){
		Criteria cri = new Criteria();
		cri.setPageNo(page);
		
		List<BoardVO> list = adminService.getList(cri);
		
		int totalCnt = adminService.getTotalCnt();
		
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		return responseMemberListMap(list, pageDto);
	}
	
	@GetMapping("/adminBoard/delete/{bno}")
	public Map<String, Object> delete(@PathVariable("bno") int bno){
		
		return responseDeleteMap(adminService.delete(bno));
	}

}
