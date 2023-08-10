package com.peco.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.peco.service.PensionService;
import com.peco.service.ReviewService;
import com.peco.vo.BoardVO;
import com.peco.vo.PensionFiileuploadVO;
import com.peco.vo.PensionReviewVO;
import com.peco.vo.PensionRoomVO;
import com.peco.vo.PensionVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/peco/*")
public class DetailPageController {

	public static final String ATTACHES_DIR = "c:\\upload\\";

	@Autowired
	PensionService pensionService;

	@GetMapping("/detail/detailPage")
	public String getOne(Model model, PensionVO pensionVO, String p_id) {
		PensionVO pension = pensionService.getOne(pensionVO.getP_id());
		List<PensionRoomVO> room = pensionService.roomList(p_id);
		List<PensionReviewVO> review = pensionService.reviewList(p_id);
		PensionFiileuploadVO pensionImg = pensionService.getPesionImg(p_id);
		List<PensionFiileuploadVO> roomImg = pensionService.getRoomImg(p_id);
		
		
		String pensionConvertedPath = pensionImg.getSavePath().replace("\\", "/");
		
		for (PensionFiileuploadVO roomI : roomImg) {
	        String convertedPath = roomI.getSavePath().replace("\\", "/");
	        roomI.setSavePath(convertedPath);
	    	}		
		
		int staravg = pensionService.starAvg(p_id);
		model.addAttribute("pension", pension);
		model.addAttribute("room", room);
		model.addAttribute("review", review);
		model.addAttribute("staravg", staravg);
		model.addAttribute("pensionImg", pensionConvertedPath);
		model.addAttribute("roomImg", roomImg);

		return "/detail/detailPage";
	}	 

}
