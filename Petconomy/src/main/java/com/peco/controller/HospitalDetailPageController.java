package com.peco.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.peco.service.HospitalService;
import com.peco.vo.HospitalFileuploadVO;
import com.peco.vo.HospitalVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/peco/*")
public class HospitalDetailPageController {
	
	@Autowired
	HospitalService hospitalService;
	
	@GetMapping("/detail/hospitalDetailPage")
	public String getOne(Model model, HospitalVO hospitalVO, String h_id, String pname, String filename, HttpServletRequest request) {
		
		HospitalVO hospital = hospitalService.getOne(hospitalVO.getH_id());
		HospitalFileuploadVO hospitalImg = hospitalService.getHospitaImg(h_id);
		
		String hospitalConvertedPath = hospitalImg.getSavePath().replace("\\", "/");
		
	  	HttpSession session = request.getSession();
	    ArrayList<String> harr = (ArrayList<String>) session.getAttribute("harr");

	    if (harr == null) {
	    	harr = new ArrayList<>();
	    }
		String str = h_id + ',' + pname + ',' + filename;
		harr.add(str);
		while (harr.size() > 5) {
			harr.remove(0); // Remove the oldest element
		}
		session.setAttribute("arr", harr);

		
		int staravg = hospitalService.starAvg(h_id);
		
		model.addAttribute("hospital", hospital);
		model.addAttribute("staravg", staravg);
		model.addAttribute("hospitalImg", hospitalConvertedPath);
		
		return "/detail/hospitalDetailPage";
	}
}
