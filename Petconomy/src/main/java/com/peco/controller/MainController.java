package com.peco.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peco.service.PensionService;
import com.peco.vo.PensionVO;

import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;


@Controller
@RequestMapping("/peco/*")
@Log4j
public class MainController {
	
	@Autowired
	PensionService pensionService;
	
	@GetMapping("/main/pension")
	public String list(Model model) {
		List<PensionVO> list = pensionService.pensionList();
		List<PensionVO> lists = pensionService.mapList();
		model.addAttribute("list", list);
		model.addAttribute("lists", lists);
		return "/main/pension";
	}

	@GetMapping("/main/mainpage")
	public String main() {

		return "/main/mainpage";
	}
	
	
	@GetMapping("/main/index")
	public String index() {
		
		return "/main/index";
	}
	


	@RequestMapping(path = "/insertPension")
	@ResponseBody
	public Map<String, Object> insertMemberInfo(@RequestParam String data, PensionVO vo){

	  Map<String, Object> result = new HashMap<>();

	  try {
	    /*JSONArray jsonArray = JSONArray.fromObject(paramData);*/
	    List<Map<String,Object>> info = new ArrayList<Map<String,Object>>();
	    info = JSONArray.fromObject(data);

	    for (Map<String, Object> pensionInfo : info) {
	    	String pname = pensionInfo.get("시설명").toString();
	    	String addr = pensionInfo.get("도로명주소").toString();
	    	String openHour = pensionInfo.get("운영시간").toString();
	    	String parkYN = pensionInfo.get("주차 가능여부").toString();

	        vo.setPname(pname);
	        vo.setAddr(addr);
	        vo.setOpenhour(openHour);
	        vo.setParkyn(parkYN);
	        pensionService.pensionList();
	        

	    }  
	      result.put("result", true);
	  } catch (Exception e) {
	      result.put("result", false);
	  }
	  return result;

	}
}
