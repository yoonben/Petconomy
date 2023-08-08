package com.peco.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peco.service.BusinessService;
import com.peco.vo.PensionVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/peco/*")
@Log4j
public class BusinessController extends CommonRestController{
	
	@Autowired
	BusinessService service;
	
	@GetMapping("/business")
	public String login() {
		return "business";
	}
	
	@PostMapping("/pensionInsert")
	public @ResponseBody Map<String, Object> pensionInsert(@RequestBody PensionVO pension, Model model) {
		
		
		try {

			int res = service.pensionInsert(pension);
			
			pension = service.pensionGetOne(pension);
			
			Map<String, Object> map = responseWriteMap(res);
			
			map.put("p_id", pension.getP_id());
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "등록중 예외사항이 발생 하였습니다.");
		}
	}

}
