package com.peco.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.peco.service.HospitalService;
import com.peco.vo.HospitalVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/peco/*")
public class HospitalDetailPageController {
	
	@Autowired
	HospitalService hospitalService;
	
	@GetMapping("/detail/hospitalDetailPage")
	public String getOne(Model model, HospitalVO hospitalVO, String h_id) {
		
		HospitalVO hospital = hospitalService.getOne(hospitalVO.getH_id());
		int staravg = hospitalService.starAvg(h_id);
		
		model.addAttribute("hospital", hospital);
		model.addAttribute("staravg", staravg);
		
		return "/detail/hospitalDetailPage";
	}
}
