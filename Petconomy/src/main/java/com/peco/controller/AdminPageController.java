package com.peco.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/peco/*")
public class AdminPageController extends CommonRestController {
	
	
	
	@GetMapping("/admin/adminPage")
	public String adminPage() {
		
		return "/admin/adminPage";
	}
	
}
