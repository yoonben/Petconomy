package com.peco.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
import java.util.List;
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

import com.peco.service.BoardService;
import com.peco.service.FileuploadService;
import com.peco.service.HospitalService;
import com.peco.service.MemberService;
import com.peco.service.PensionService;
import com.peco.vo.BoardVO;
import com.peco.vo.FileuploadVO;
import com.peco.vo.HospitalVO;
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
	
	@Autowired
	HospitalService hospitalService;
	
	@Autowired
	BoardService boardService;
	
	
	//회원 프로필 조회
	@GetMapping("profile")
	public String getOne(HttpSession session, MemberVO vo, Model model, BoardVO boardVo, FileuploadVO fileVo) {
		try {
			log.info("======================= m_id" + vo);
			if(vo.getM_id().equals("") || vo.getM_id() == null ) {
				System.out.println("msg");
				return "msg";
			}
			//하나의 회원 조회
			MemberVO member = service.getOne(vo.getM_id());
			
			//==================================================================
			// 게시글 조회
			/*	List<BoardVO> board = boardService.selectMyBoard(boardVo.getM_id());

			if(board != null && member.getM_id().equals(boardVo.getM_id())) {
				for(BoardVO boardvo : board) {
					model.addAttribute("boardvo", boardvo);
				}
			}
			
			*/
			//==================================================================
			// 프로필 사진 조회
			System.out.println(fileuploadService.getProfile(fileVo.getM_id()));
			
			FileuploadVO fileuploadVO = fileuploadService.getProfile(fileVo.getM_id());
			
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
	
	
	//회원프로필 수정페이지로 이동
	@PostMapping("profile_Update")
	public String updatePage(Model model, HttpSession session, MemberVO vo) {
	    System.out.println("vo : "+ vo);
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    System.out.println(member);
	    model.addAttribute("member", member);
	    
	    System.out.println("vo.getM_id() : " + vo.getM_id());
	    
	    //프로필 이미지 조회
	    FileuploadVO fileuploadVO = fileuploadService.getProfile(vo.getM_id());
	    
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
	
	
	//프로필 이미지 수정(업로드)
	//db에 사진파일이  한 개가 초과되어 저장될 경우 프로필 조회시 오류발생
	@PostMapping("profile_update_img")
	public @ResponseBody Map<String, Object> profile_Update_Img( List<MultipartFile> files,  HttpSession session, MemberVO vo) {
		System.out.println("files : " + files);
		System.out.println("vo : " + vo);
		
		try {
			//프로필 사진 조회
			FileuploadVO fileuploadVO = fileuploadService.getProfile(vo.getM_id());
			
			//프로필 사진 업로드
			int res = fileuploadService.Profileupload(files, vo.getM_id());
			
			//기존에 등록된 이미지가 있으면 삭제처리
			if(res > 0) {
			fileuploadService.delete_Img(vo.getM_id(), fileuploadVO.getUuid());
			} 
			
			//프로필 이미지 조회
		    fileuploadVO = fileuploadService.getProfile(vo.getM_id());
		    
		   Map<String, Object> map = responseMap(REST_SUCCESS, "파일업로드 성공");
		    if (fileuploadVO != null) {
		        String profile = fileuploadVO.getS_savePath();
		        
		        // 파일 경로를 슬래시(/)로 변경
		        if (profile != null) {     
		            String convertedPath = profile.replace("\\", "/");
		            String convertedThumPath = profile.replace("\\", "/");
		            fileuploadVO.setSavePath(convertedPath);
		            fileuploadVO.setS_savePath(convertedThumPath);
		        }

		        map.put("profileImg",  fileuploadVO.getS_savePath());
		    } else {
		        // 파일 정보가 없을 경우에 대한 처리 (예: 기본 이미지 사용 또는 알림)
		        map.put("profile", "default_profile_image.jpg");
		    }
		    
			return map;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return responseMap(REST_FAIL, "파일업로드 중 오류발생");
		}
		
		
	}
	
	//회원프로필 수정 후 마이페이지 이동
	@PostMapping("/profile")
	public  String profileSave(Model model, HttpSession session, MemberVO vo) {
		
	    MemberVO member = (MemberVO) session.getAttribute("member");
	  // session에 model까지 있어서  수정 후 바로 저장 안되고 새로고침해야 수정되는거 적용됬었는데 모델삭제하니 바로 해결됨 
	  //  model.addAttribute("member", member);  

	    // 프로필 이미지 처리========================================================
	    FileuploadVO fileuploadVO = fileuploadService.getProfile(vo.getM_id());
	    
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
	    // 프로필 이미지 처리========================================================
	    
	    	//회원정보 업데이트
	  		int res = service.update(vo);
	  		System.out.println("================= 회원프로필 수정저장 : " + vo);

	  		
	  		//업데이트된 회원정보 다시 조회
	  		MemberVO updateMember = service.getOne(vo.getM_id());
	  		System.out.println("================= 회원프로필 정보조회 : " + updateMember);
	  		
	  		// 기존 세션 무료화
	  		session.removeAttribute("member");
	  		
	  		//모델에 업데이트된 회원 정보 추가
	  		session.setAttribute("member", updateMember);
	  		
	    return "/member/profile";
	}
	
	
	
	// 게시글 조회
	@GetMapping("myBoard")
	public String myBoard(Model model, BoardVO vo) {
		List<BoardVO> board = boardService.selectMyBoard(vo.getM_id());
		System.out.println("board ================== : " + board);
		model.addAttribute("board", board);
		
		return "/member/myBoard";
	}


// 펜션 컨트롤러 부분==========================================================================	
// 펜션 컨트롤러 부분==========================================================================	
//TODO : 펜션매퍼,서비스, 컨트롤러  > 펜션, 병원을 등록한 회원 m_id와  펜션등록 테이블에 있는 m_id가 일치하면 펜션정보 화면에 출력할 수 있는 컨트롤러 작성
	
	//하나의 펜션 조회
	@GetMapping("pensionProfile")
	public String getOne_P(Model model, PensionVO vo, MemberVO memberVo) {
		try {
			MemberVO member = service.getOne(vo.getM_id());
			PensionVO pension = pensionService.getOne_P(vo.getM_id());
			
			System.out.println("pension================== (1) : " + pension);	
			
			if(pension != null && member.getM_id().equals(pension.getM_id())) {
					//PensionVO mypension = pensionService.getOne_P(vo.getM_id()); 다시 안담고 바로 조회후 담아주면된다!!
					
					model.addAttribute("pension", pension);
						
			
				} else {
					//메세지 처리
					System.out.println("msg");
					return "/member/nodata";  
				}
				return "/member/pensionProfile";
				
			} catch (Exception e) {
				e.printStackTrace(); 
		        return "";
			}
	}
	
	//펜션 수정페이지 이동
	@PostMapping("pensionProfile_Update")
	public String phProfileUpdatePage(HttpSession session) {
		
		PensionVO pension = (PensionVO) session.getAttribute("pension");
		    //model.addAttribute("pension", pension);
			session.setAttribute("pension", pension);
	    return "/member/pensionProfile_Update";
	}
	
	
	//수정 후 펜션페이지로 다시 이동
	@PostMapping("pensionProfile")
	public String phProfilePage(Model model, HttpSession session, PensionVO vo) {
		
		//PensionVO pension1 = pensionService.getOne_P(vo.getM_id());
		pensionService.update_P(vo);
		PensionVO updatedPension = pensionService.getOne_P(vo.getM_id());
		//model.addAttribute("pension2", pension2);
		 session.setAttribute("pension", updatedPension);		
		 
		
	    return "/member/pensionProfile";
	}

	
// 병원 컨트롤러 부분==========================================================================	
// 병원 컨트롤러 부분==========================================================================	

	//하나의 병원 조회
	@GetMapping("hospitalProfile")
	public String getOne_H(HttpSession session, HospitalVO vo, MemberVO memeberVo) {
		
		try {
			MemberVO member = service.getOne(vo.getM_id());
			HospitalVO hospital = hospitalService.getOne_H(vo.getM_id());
		
			System.out.println("hospital================== (1) : " + hospital);
			
			if(hospital != null && member.getM_id().equals(hospital.getM_id())) {
				//HospitalVO myhospital = hospitalService.getOne_H(vo.getM_id());
				
				session.setAttribute("hospital", hospital);
				
				
				return "/member/hospitalProfile";		
				
			} else {
				System.out.println("msg");
				return "/member/nodata";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "";
	}
	
	
	//병원 수정페이지 이동
	@PostMapping("hospitalProfile_Update")
	public String hospitalUpdatePage(HttpSession session) {
		
		HospitalVO hospital = (HospitalVO) session.getAttribute("hospital");
			session.setAttribute("hospital", hospital );
			return "/member/hospitalProfile_Update";
		}
		
	//수정 후 병원페이지로 다시 이동
	@PostMapping("hospitalProfile")
	public String hProfilePage(Model model, HttpSession session, HospitalVO vo) {
		
		hospitalService.update_H(vo);
		HospitalVO updateHospital= hospitalService.getOne_H(vo.getM_id());
		session.setAttribute("hospital", updateHospital);		
		 
	    return "/member/hospitalProfile";
	}	
	
	
	
	
	

	
	@GetMapping("css")
	public String css(){
		return "member/css";
	}
	@GetMapping("tabBar")
	public String tabBar(){
		return "member/tabBar";
	}
}
