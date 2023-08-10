package com.peco.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;




import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peco.service.BoardService;
import com.peco.service.HospitalService;
import com.peco.service.PensionService;
import com.peco.vo.BoardVO;
import com.peco.vo.HospitalVO;
import com.peco.vo.PageDto;
import com.peco.vo.PensionVO;
import com.peco.vo.RegionCri;

import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;


@Controller
@RequestMapping("/peco/*")
@Log4j
public class MainController {
	
	@Autowired
	PensionService pensionService;
	
	@Autowired
	HospitalService hospitalService;
	
	@Autowired
	BoardService boardService;
	
	//펜션 페이지
	//펜션 페이지
	@GetMapping("/main/pension")
	public String plist(RegionCri cri, Model model, HttpServletRequest request) {
		
		List<PensionVO> list = pensionService.pensionList(cri);
		List<PensionVO> lists = pensionService.mapList(cri);
		
		int totalCnt = pensionService.totalCount(cri);
		PageDto pageDto = new PageDto(cri, totalCnt);
		
//		String megaregion = request.getParameter("megaregion");
//		String smallregion = request.getParameter("smallregion");
//		System.out.println("megaregion"+ megaregion);
//		System.out.println("smallregion"+smallregion);
		System.out.println("======"+cri);
		
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("list", list);
		model.addAttribute("lists", lists);
		return "/main/pension";
	}

	// 병원 페이지
	@GetMapping("/main/hospital")
	public String hlist(RegionCri cri, Model model) {
		List<HospitalVO> list = hospitalService.hospitalList(cri);
		List<HospitalVO> lists = hospitalService.mapList();
		int totalCnt = hospitalService.totalCnt(cri);
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("list", list);
		model.addAttribute("lists", lists);
		return "/main/hospital";
	}
	
	//메인 페이지
	@GetMapping("/main/mainpage")
	public String main(Model model) {
		List<PensionVO> plist = pensionService.pensiontop();
		List<HospitalVO> hlist = hospitalService.hospitaltop();
		//List<BoardVO> blist = boardService.getBest();
		model.addAttribute("plist", plist);
		model.addAttribute("hlist", hlist);
		//model.addAttribute("blist", blist);
		return "/main/mainpage";
	}
	
	
	
	//카카오맵
	@GetMapping("/main/kakaomap")
	public String kakaomap() {
		return "/main/kakaomap";
	}
	
	@GetMapping("/main/searchForm")
	public String searchForm() {
		return "/main/searchForm";
	}
	
	@GetMapping("/main/searchForm2")
	public String searchForm2() {
		return "/main/searchForm2";
	}
	

	@GetMapping("/main/index")
	public String index() {	
		return "/main/index";
	}
	
	// json 데이터 파싱 후 db 저장(펜션)
	@RequestMapping(path = "/insertPension")
	@ResponseBody
	public Map<String, Object> insertPensionInfo(@RequestParam String data){
		PensionVO vo = new PensionVO();
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
	        pensionService.pensionInsert(vo);
	        

	    }  
	      result.put("result", true);
	  } catch (Exception e) {
	      result.put("result", false);
	  }
	  return result;

	}
	
	// json 데이터 파싱 후 db 저장(병원)
 	@RequestMapping(path = "/insertHospital")
    @ResponseBody
    public Map<String, Object> insertHospitalInfo(@RequestParam String data){
 		HospitalVO vo = new HospitalVO();
    	Map<String, Object> result = new HashMap<>();
    	
    	try {
    		/*JSONArray jsonArray = JSONArray.fromObject(paramData);*/
    		List<Map<String,Object>> info = new ArrayList<Map<String,Object>>();
    		info = JSONArray.fromObject(data);
    		for (Map<String, Object> hospitalInfo : info) {
    			
    			String pname = hospitalInfo.get("시설명").toString();
    			String addr = hospitalInfo.get("도로명주소").toString();
    			String openHour = hospitalInfo.get("운영시간").toString();
    			String parkYN = hospitalInfo.get("주차 가능여부").toString();
    			vo.setPname(pname);
    			vo.setAddr(addr);
    			vo.setOpenhour(openHour);
    			vo.setParkyn(parkYN);
    			hospitalService.hospitalInsert(vo);
    			
    			
    		}  
	      result.put("result", true);
	  } catch (Exception e) {
	      result.put("result", false);
	  }
	  return result;

	}
}
