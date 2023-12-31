package com.peco.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.peco.service.BoardService;
import com.peco.service.HospitalService;
import com.peco.service.JjimService;
import com.peco.service.PensionService;
import com.peco.vo.BoardVO;
import com.peco.vo.HospitalVO;
import com.peco.vo.JjimVO;
import com.peco.vo.MemberVO;
import com.peco.vo.PageDto;
import com.peco.vo.PensionVO;
import com.peco.vo.RegionCri;

import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/peco/*")
@Log4j
public class MainController extends CommonRestController {

	@Autowired
	PensionService pensionService;

	@Autowired
	HospitalService hospitalService;

	@Autowired
	BoardService boardService;

	@Autowired
	JjimService jjimService;

	// 펜션 페이지
	// 펜션 페이지
	@GetMapping("/main/pension")
	public String plist(RegionCri cri, Model model, HttpServletRequest request, PensionVO pensionVO,
			HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("member");


		List<PensionVO> list = pensionService.pensionList(cri);
		List<PensionVO> lists = pensionService.mapList(cri);

		// if (pensionVO != null && member.getId()!=null) {
		// int jjimCnt = jjimService.count(member.getId(), pensionVO.getP_id());
		// model.addAttribute("jjimCnt", jjimCnt);
		// }

		int totalCnt = pensionService.totalCount(cri);
		PageDto pageDto = new PageDto(cri, totalCnt);

		for (PensionVO pImg : list) {
			String convertedPath = pImg.getSavePath().replace("\\", "/");
			pImg.setSavePath(convertedPath);
		}

		for (PensionVO pImg : lists) {
			String convertedPath = pImg.getSavePath().replace("\\", "/");
			pImg.setSavePath(convertedPath);
		}

		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageDto", pageDto);
		session.setAttribute("list", list);
		// model.addAttribute("list", list);
		model.addAttribute("lists", lists);
		model.addAttribute("member", member);
		model.addAttribute("pension", pensionVO);

		return "/main/pension";
	}

	// 병원 페이지
	@GetMapping("/main/hospital")
	public String hlist(RegionCri cri, Model model) {
		List<HospitalVO> list = hospitalService.hospitalList(cri);
		List<HospitalVO> lists = hospitalService.mapList(cri);

		int totalCnt = hospitalService.totalCount(cri);
		System.out.println(totalCnt);
		PageDto pageDto = new PageDto(cri, totalCnt);

		for (HospitalVO hImg : list) {
			String convertedPath = hImg.getSavePath().replace("\\", "/");
			hImg.setSavePath(convertedPath);
		}

		for (HospitalVO hImg : lists) {
			String convertedPath = hImg.getSavePath().replace("\\", "/");
			hImg.setSavePath(convertedPath);
		}

		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("list", list);
		model.addAttribute("lists", lists);
		return "/main/hospital";
	}

	// 메인 페이지
	@GetMapping("/main/mainpage")
	public String main(Model model) {
		List<PensionVO> plist = pensionService.pensiontop();
		List<HospitalVO> hlist = hospitalService.hospitaltop();
		List<BoardVO> blist = boardService.getBest();

		for (PensionVO pImg : plist) {
			String convertedPath = pImg.getSavePath().replace("\\", "/");
			pImg.setSavePath(convertedPath);
		}

		for (HospitalVO hImg : hlist) {
			String convertedPath = hImg.getSavePath().replace("\\", "/");
			hImg.setSavePath(convertedPath);
		}

		model.addAttribute("plist", plist);
		model.addAttribute("hlist", hlist);
		model.addAttribute("blist", blist);
		return "/main/mainpage";
	}

	// 메인 페이지
	@GetMapping("/main/ex")
	public String ex() {
		return "/main/ex";
	}

	// 카카오맵
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

	@Autowired
	JjimService jimservice;

	@RequestMapping(value = "/jinsert", method = RequestMethod.POST)
	public String insert(HttpServletRequest request, Model model) {
		JjimVO jjimvo = new JjimVO();
		String p_id = request.getParameter("p_id");
		String m_id = request.getParameter("m_id");

		jjimvo.setP_id(p_id);
		jjimvo.setM_id(m_id);

		int count = jimservice.count(jjimvo);

		if (count == 0) {
			jimservice.insert(jjimvo);
		} else {
			jimservice.delete(jjimvo);
		}

		// 리다이렉트할 URL을 지정
		return "redirect:/peco/main/pension";
	}

	// json 데이터 파싱 후 db 저장(펜션)
	@RequestMapping(path = "/insertPension")
	@ResponseBody
	public Map<String, Object> insertPensionInfo(@RequestParam String data) {
		PensionVO vo = new PensionVO();
		Map<String, Object> result = new HashMap<>();

		try {
			/* JSONArray jsonArray = JSONArray.fromObject(paramData); */
			List<Map<String, Object>> info = new ArrayList<Map<String, Object>>();
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
	public Map<String, Object> insertHospitalInfo(@RequestParam String data) {
		HospitalVO vo = new HospitalVO();
		Map<String, Object> result = new HashMap<>();

		try {
			/* JSONArray jsonArray = JSONArray.fromObject(paramData); */
			List<Map<String, Object>> info = new ArrayList<Map<String, Object>>();
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
