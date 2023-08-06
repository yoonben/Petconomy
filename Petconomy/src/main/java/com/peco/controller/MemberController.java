package com.peco.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.peco.service.FileuploadService;
import com.peco.service.MemberService;
import com.peco.service.PensionService;
import com.peco.vo.FileuploadVO;
import com.peco.vo.MemberVO;
import com.peco.vo.PensionVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/peco/*")
@Log4j
public class MemberController extends CommonRestController{

	@Autowired
	MemberService service;
	
	@Autowired
	PensionService pensionService;

	@Autowired
	FileuploadService fileuploadService;
	
	//회원 프로필 조회
	@GetMapping("profile")
	public String getOne(HttpSession session, MemberVO vo, Model model ,@RequestParam String m_id) {
		try {
			log.info("======================= m_id" + vo);
			if(vo.getM_id().equals("") || vo.getM_id() == null ) {
				System.out.println("msg");
				return "msg";
			}
			
			MemberVO member = service.getOne(vo.getM_id());
			
			System.out.println(fileuploadService.getProfile(m_id));
			
			FileuploadVO fileuploadVO = fileuploadService.getProfile(m_id);
			
			String profile = fileuploadVO.getS_savePath();
			
			// 파일 경로를 슬래시(/)로 변경
		    if (profile != null) { 	
		        String convertedPath = profile.replace("\\", "/");
		        String convertedThumPath = profile.replace("\\", "/");
		        fileuploadVO.setSavePath(convertedPath);
		        fileuploadVO.setS_savePath(convertedThumPath);
		    }

		    model.addAttribute("profile", fileuploadVO.getS_savePath());
			
			return "/member/profile";
			
		} catch (Exception e) {
			//TODO 메세지 처리하기
			return "";
		}
	}
	
	//회원프로필 수정페이지
	@PostMapping("profile_Update")
	public String updatePage(Model model, HttpSession session, @RequestParam String m_id, MemberVO vo) {
	    
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    model.addAttribute("member", member);

	    FileuploadVO fileuploadVO = fileuploadService.getProfile(m_id);
	    
	    if (fileuploadVO != null) {
	        String profile = fileuploadVO.getS_savePath();
	        
	        // 파일 경로를 슬래시(/)로 변경
	        if (profile != null) {     
	            String convertedPath = profile.replace("\\", "/");
	            String convertedThumPath = profile.replace("\\", "/");
	            fileuploadVO.setSavePath(convertedPath);
	            fileuploadVO.setS_savePath(convertedThumPath);
	        }

	        model.addAttribute("profile", fileuploadVO.getS_savePath());
	    } else {
	        // 파일 정보가 없을 경우에 대한 처리 (예: 기본 이미지 사용 또는 알림)
	        model.addAttribute("profile", "default_profile_image.jpg");
	    }
	    

	    return "/member/profile_Update";
	}
	
	
	//회원프로필 수정페이지
	@PostMapping("profile")
	public String reloadPage(Model model, HttpSession session, @RequestParam String m_id, MemberVO vo) {
	    
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    model.addAttribute("member", member);

	    FileuploadVO fileuploadVO = fileuploadService.getProfile(m_id);
	    
	    if (fileuploadVO != null) {
	        String profile = fileuploadVO.getS_savePath();
	        
	        // 파일 경로를 슬래시(/)로 변경
	        if (profile != null) {     
	            String convertedPath = profile.replace("\\", "/");
	            String convertedThumPath = profile.replace("\\", "/");
	            fileuploadVO.setSavePath(convertedPath);
	            fileuploadVO.setS_savePath(convertedThumPath);
	        }

	        model.addAttribute("profile", fileuploadVO.getS_savePath());
	    } else {
	        // 파일 정보가 없을 경우에 대한 처리 (예: 기본 이미지 사용 또는 알림)
	        model.addAttribute("profile", "default_profile_image.jpg");
	    }
	    
	  //회원정보 업데이트
	  		int res = service.update(vo);
	  		//업데이트된 회원정보 다시 조회
	  		MemberVO updateMember = service.getOne(vo.getM_id());
	  		
	  		//모델에 업데이트된 회원 정보 추가
	  		model.addAttribute("member", updateMember);
	  		
	  		Map<String, Object> map = responseWriteMap(res);
	    

	    return "/member/profile";
	}
	
	/*
	//수정페이지에서 데이터 입력 후 저장
	@PostMapping("profile")
	public @ResponseBody Map<String, Object> updateSave(Model model, @RequestBody MemberVO vo, @RequestParam String m_id,
															@RequestParam("files") MultipartFile profileImage) {
		
		
		FileuploadVO fileuploadVO = fileuploadService.getProfile(m_id);
		if (fileuploadVO != null) {
			String profile = fileuploadVO.getS_savePath();
			
			// 파일 경로를 슬래시(/)로 변경
			if (profile != null) {     
				String convertedPath = profile.replace("\\", "/");
				String convertedThumPath = profile.replace("\\", "/");
				fileuploadVO.setSavePath(convertedPath);
				fileuploadVO.setS_savePath(convertedThumPath);
			}
			
			model.addAttribute("profile", fileuploadVO.getS_savePath());
		} else {
			// 파일 정보가 없을 경우에 대한 처리 (예: 기본 이미지 사용 또는 알림)
			model.addAttribute("profile", "default_profile_image.jpg");
		}
		
		
		// 프로필 사진 업로드 처리 (프로필사진만 바로 변경되게끔 처리)
	    if (!profileImage.isEmpty()) {
	        // 기존 프로필 사진 삭제
	        if (fileuploadVO != null) {
	            String existingProfilePath = fileuploadVO.getUploadpath() + fileuploadVO.getUuid() + "_" + fileuploadVO.getFilename();
	            File existingProfileFile = new File(existingProfilePath);
	            existingProfileFile.delete();
	        }
	        
		    
		    
		    
		//회원정보 업데이트
		int res = service.update(vo);
		//업데이트된 회원정보 다시 조회
		MemberVO updateMember = service.getOne(vo.getM_id());
		
		//모델에 업데이트된 회원 정보 추가
		model.addAttribute("member", updateMember);
		
		Map<String, Object> map = responseWriteMap(res);
		
		return map;
	}
		return null;
}
	// int member = service.update(vo);
	// model.addAttribute("member", member);
	
*/
	/*
	//TODO : 펜션매퍼,서비스, 컨트롤러  > 펜션을 등록한 회원 m_id와  펜션등록 테이블에 있는 m_id가 일치하면 펜션정보 화면에 출력할 수 있는 컨트롤러 작성
	//웹브라우저에서 원활하게 실행되려면 수정해야함 (삭제하니까 잘돌아감 - 세션이 연결안되서 그런것 같기도..)
	
	@PostMapping("/phProfile/{m_id}")
	public String phProfile(@PathVariable("m_id") String m_id, Model model) {
		
		//Member테이블에서 m_id기준으로 회원정보 조회
		MemberVO member = service.getOne(m_id);
		
		if(member==null||"".equals(member)) {
			//TODO : 회원정보가 존재하지 않을 경우 예외처리
			return ""; // 로그인 페이지로 이동
		}
		
	
		//Pension테이블에서 m_id기준으로 펜션정보 조회
		PensionVO pension = pensionService.getOne_P(m_id);
		if(pension==null||"".equals(pension)) {
			//TODO : 펜션정보가 존재하지 않을 경우 예외처리
			return ""; // 로그인 페이지로 이동			
		}
			
		//조회한 정보를 모델에 담아 뷰로 전달
		model.addAttribute("member", member);
		model.addAttribute("pension", pension);
		
		//pension 정보를 보여줄 jsp페이지
	    return "/member/phProfile"; 
	}
	
	*/
	
	//하나의 펜션 조회
	@GetMapping("phProfile")
	public String getOne_P(HttpSession session, PensionVO vo, @RequestParam String m_id) {
		try {
			if(vo.getM_id()==null || vo.getM_id().equals("")) {
				//메세지 처리
				System.out.println("msg");
				return "";  
			}
			
			PensionVO pension = pensionService.getOne_P(vo.getM_id());
			session.setAttribute("pension", pension);
			return "/member/phProfile";
			
		} catch (Exception e) {
			// TODO: 메세지 처리
			return "";
		}
	}
	
	
	//펜션 수정페이지 이동
	@PostMapping("phProfile_Update")
	public String phProfileUpdatePage(Model model, HttpSession session) {
		
		PensionVO pension = (PensionVO) session.getAttribute("pension");
		    //model.addAttribute("pension", pension);
			session.setAttribute("pension", pension);
	    return "/member/phProfile_Update";
	}
	
	//수정 후 펜션페이지로 다시 이동
	@PostMapping("phProfile")
	public String phProfilePage(Model model, HttpSession session, PensionVO vo) {
		
		int pension = pensionService.update_P(vo);
				
		
			session.setAttribute("pension ", pension );
	    return "/member/phProfile";
	}
	/*
	// 펜션 수정페이지에서 데이터 입력 후 저장
	@PostMapping("phProfile")
	public String phProfileUpdateSave(Model model, PensionVO vo, HttpSession session) {
		
		//펜션정보 업데이트
		pensionService.update_P(vo);
		
		//업데이트된 펜션정보 다시 조회
		PensionVO updatePension = pensionService.getOne_P(vo.getM_id());
		
		//모델에 업데이트된 회원 정보 추가
		session.setAttribute("updatePension", updatePension);
		
		return "/member/phProfile";
	}
	
	*/
	
	
	@GetMapping("css")
	public String css(){
		return "member/css";
	}
}
