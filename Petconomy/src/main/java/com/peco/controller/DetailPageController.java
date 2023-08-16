package com.peco.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.Cookie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpServerErrorException;

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
	public String getOne(Model model, PensionVO pensionVO, String p_id, String pname, String filename, HttpServletRequest request, HttpServletResponse response) {
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
		    ArrayList<String> arr = (ArrayList<String>) session.getAttribute("arr");

		    if (arr == null) {
		        arr = new ArrayList<>();
		    }
			String str = p_id + ',' + pname + ',' + filename;
			arr.add(str);
			while (arr.size() > 5) {
			    arr.remove(0); // Remove the oldest element
			}
			session.setAttribute("arr", arr);
	
	
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
