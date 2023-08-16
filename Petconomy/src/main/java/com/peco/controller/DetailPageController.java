package com.peco.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.peco.service.PensionService;
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
	public String getOne(Model model, PensionVO pensionVO, String p_id, String pname, String filename, HttpServletRequest request) {
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
		
		HttpSession session = request.getSession();
		session.setAttribute("p_id", p_id);
		session.setAttribute("pname", pname);
		session.setAttribute("filename", filename);
		
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
