package com.peco.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.peco.service.PensionService;
import com.peco.vo.PensionVO;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/peco/*")
@Log4j
public class MainController {
	
	@Autowired
	PensionService pensionService;
	
	@GetMapping("/main/pension")
	public String list(Model model) {
		List<PensionVO> list = pensionService.mapList();
		model.addAttribute("lists", list);
		return "/main/pension";
	}
}
