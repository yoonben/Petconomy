package com.peco.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.peco.service.BoardService;
import com.peco.service.FileuploadService;
import com.peco.service.HospitalService;
import com.peco.service.MemberService;
import com.peco.service.PensionService;
import com.peco.service.ResService;
import com.peco.vo.BoardVO;
import com.peco.vo.FileuploadVO;
import com.peco.vo.HospitalVO;
import com.peco.vo.MemberVO;
import com.peco.vo.P_RESVO;
import com.peco.vo.PensionFiileuploadVO;
import com.peco.vo.PensionVO;
import com.peco.vo.RegionCri;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

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

	@Autowired
	ResService resService;

	//회원 프로필 조회
	@GetMapping("profile")
	public String getOne(HttpSession session, MemberVO vo, Model model, BoardVO boardVo, FileuploadVO fileVo, P_RESVO resVo) {
		try {
			log.info("======================= m_id" + vo);
			if(!(vo.getM_id().equals("")) || vo.getM_id() != null ) {
				System.out.println("msg");
				System.out.println("======================= Pension" + resService.getResPensionList(resVo.getM_id()));
				System.out.println("======================= Hospital" + resService.getResHospitalList(resVo.getM_id()));
				
				//펜션 예약 정보를 profile.jsp에서 출력
				 List<P_RESVO> reslist = resService.getResPensionList(resVo.getM_id());
				
				if (reslist != null) {
			    	for (P_RESVO res : reslist) {
			        String convertedPath = res.getSavePath().replace("\\", "/");
			        res.setSavePath(convertedPath);
			        
			    	}
			    	System.out.println("=============reslist================== (2) : " +  reslist);
			    } 
				model.addAttribute("getPrList",reslist);
				model.addAttribute("getHrList",resService.getResHospitalList(resVo.getM_id()));
			}
			
			System.out.println("=========================================="+resService.getResPensionList(resVo.getM_id()));
			
			//하나의 회원 조회
			MemberVO member = service.getOne(vo.getM_id());

			// 프로필 사진 조회
			//System.out.println(fileuploadService.getProfile(fileVo.getM_id()));
			
			FileuploadVO fileuploadVO = fileuploadService.getProfile(member.getM_id());
			
			String profile = null;
			
			// 파일 경로를 슬래시(/)로 변경
		    if (fileuploadVO != null) { 	
		        
		        String convertedPath = fileuploadVO.getSavePath().replace("\\", "/");
	            String convertedThumPath = fileuploadVO.getS_savePath().replace("\\", "/");
		        fileuploadVO.setSavePath(convertedPath);
		        fileuploadVO.setS_savePath(convertedThumPath);
		        
		        profile = fileuploadVO.getSavePath();
		    
		    } else {
		    	// 파일 정보가 없을 경우에 대한 처리 
		    	String defaultProfileImage = "/profile/default_profile_image.jpg";
		    	//이미지 호스팅하면 외부서버에서도 사용가능
		    	//String defaultProfileImage = "https://example.com/path/to/default_profile_image.jpg";
		    	
		    	
		    	profile = defaultProfileImage;
		    }
		    
		    List<PensionVO> pensionlist = pensionService.mypensionlist(vo.getM_id());
			
			if (pensionlist != null) {
		    	for (PensionVO pension : pensionlist) {
		        String convertedPath = pension.getSavePath().replace("\\", "/");
		        pension.setSavePath(convertedPath);
		        
		    	}
		    	System.out.println("=============pensionlist================== (2) : " +  pensionlist);
		    } 
			
			model.addAttribute("pension",pensionlist); 
		    
		    model.addAttribute("profile", profile);
		    
			return "/member/profile";
			
		} catch (Exception e) {
			//TODO 메세지 처리하기
			return "";
		}
	}

	
	//회원프로필 수정페이지로 이동
	@PostMapping("profile_Update")
	public String updatePage(Model model, HttpSession session, MemberVO vo, FileuploadVO fileVo) {
	    System.out.println("vo : "+ vo);
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    System.out.println(member);
	    model.addAttribute("member", member);
	    
	    System.out.println("vo.getM_id() : " + vo.getM_id());
	    
	    //프로필 이미지 조회
	    FileuploadVO fileuploadVO = fileuploadService.getProfile(fileVo.getM_id());
		
		String profile = null;
		
		// 파일 경로를 슬래시(/)로 변경
	    if (fileuploadVO != null) { 	
	        
	        String convertedPath = fileuploadVO.getSavePath().replace("\\", "/");
            String convertedThumPath = fileuploadVO.getS_savePath().replace("\\", "/");
	        fileuploadVO.setSavePath(convertedPath);
	        fileuploadVO.setS_savePath(convertedThumPath);
	        
	        profile = fileuploadVO.getSavePath();
	    
	    } else {
	    	// 파일 정보가 없을 경우에 대한 처리 
	    	String defaultProfileImage = "/profile/default_profile_image.jpg";
	    	//이미지 호스팅하면 외부서버에서도 사용가능
	    	//String defaultProfileImage = "https://example.com/path/to/default_profile_image.jpg";
	    	
	    	
	    	profile = defaultProfileImage;
	    }
	    
	    model.addAttribute("profile", profile);
	    

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
		        String profile = fileuploadVO.getSavePath();
		        
		        // 파일 경로를 슬래시(/)로 변경
		        if (profile != null) {     
		            String convertedPath = profile.replace("\\", "/");
		            String convertedThumPath = profile.replace("\\", "/");
		            fileuploadVO.setSavePath(convertedPath);
		            fileuploadVO.setS_savePath(convertedThumPath);
		        }

		        map.put("profileImg",  fileuploadVO.getSavePath());
		    } else {
		        // 파일 정보가 없을 경우에 대한 처리 (예: 기본 이미지 사용 또는 알림)
		        map.put("profile", "default_profile_image.jpg");
		    }
		    
			return map;
		} catch (Exception e) {
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

	    
	  // 프로필 이미지 처리=======================================================
	  //프로필 이미지 조회
	    FileuploadVO fileuploadVO = fileuploadService.getProfile(member.getM_id());
	    System.out.println("진입1 : " + fileuploadVO);
	    
	    String profile = null;
	    
	    if (fileuploadVO != null) {
	    	
	    	profile = fileuploadVO.getSavePath();
	    	
	        System.out.println("진입2");
	        // 파일 경로를 슬래시(/)로 변경
	        	System.out.println("진입3");
	            String convertedPath = profile.replace("\\", "/");
	            String convertedThumPath = profile.replace("\\", "/");
	            fileuploadVO.setSavePath(convertedPath);
	            fileuploadVO.setS_savePath(convertedThumPath);
		        profile = fileuploadVO.getSavePath();
			    
		    } else {
		    	System.out.println("파일없는곳 진입");
		    	// 파일 정보가 없을 경우에 대한 처리 
		    	String defaultProfileImage = "/profile/default_profile_image.jpg";
		    	
		    	profile = defaultProfileImage;
		    }
	        model.addAttribute("profile", profile);
	    
	    // 프로필 이미지 처리========================================================
	    
	    	//회원정보 업데이트
	  		int res = service.update(vo);
	  		System.out.println("================= 회원프로필 수정저장res : " + res);

	  		
	  		//업데이트된 회원정보 다시 조회
	  		//만약 fileuploadVO가  null이면 회원정보만 수정(getOneNoImg) 아니면 getOne으로 수정처리
	  		 if (fileuploadVO != null) {
		  		MemberVO updateMember = service.getOne(vo.getM_id());
		  		System.out.println("파일없는곳 진입 vo.getM_id(): " + vo.getM_id());
		  		System.out.println("================= 회원프로필 정보조회 : " + updateMember);
		  		session.setAttribute("member", updateMember);
		  		 } else {
		  			MemberVO updateMember = service.getOneNoImg(vo.getM_id());
		  			session.setAttribute("member", updateMember);
		  		 }
		  		// 기존 세션 무료화
		  		//session.removeAttribute("member");
		  		
		  		//모델에 업데이트된 회원 정보 추가
		  		//model.addAttribute("profile", profile);
	  		 
	    return "/member/profile";
	}
	    
	


	// 게시글 조회
	@GetMapping("/myBoard")
	public String myBoard(Model model, BoardVO vo, MemberVO membervo, HttpSession session) {
		
		MemberVO member = (MemberVO) session.getAttribute("member");
	    if (member == null) {
	        return "/login"; // 로그인 페이지로 리다이렉션 예시
	    }

	    List<BoardVO> board = boardService.selectMyBoard(member.getM_id());
	    
	    if (board != null) {
	        model.addAttribute("board", board);
	    }
	    
	    return "/member/myBoard";
	}
	

	//TODO : 게시글 삭제 기능 구현
	// 게시글 삭제
	@PostMapping("/peco/myBoard")
	public @ResponseBody Map<String, Object> boardDelete(HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			boardService.deleteBno(ajaxMsg[i]);
		}
		
		map.put("result", "success");
		
		return map;
	}
	
	
	
	




// 펜션 컨트롤러 부분==========================================================================	
// 펜션 컨트롤러 부분==========================================================================	
//TODO : 펜션매퍼,서비스, 컨트롤러  > 펜션, 병원을 등록한 회원 m_id와  펜션등록 테이블에 있는 m_id가 일치하면 펜션정보 화면에 출력할 수 있는 컨트롤러 작성
	//펜션등록을 여러개 했을 수 있으니 list로 뿌려준다
	
	//하나의 펜션 조회
	@GetMapping("/pensionProfile")
	public String pensionList(PensionVO vo, MemberVO memberVo, Model model, HttpSession session) {
		
		System.out.println("==========mypensionlist(vo.getM_id()================== (1) : " +  pensionService.mypensionlist(vo.getM_id()));	
			MemberVO member = (MemberVO) session.getAttribute("member");
			int res = pensionService.getOne_P(vo.getM_id());
			List<PensionVO> pensionlist = pensionService.mypensionlist(vo.getM_id());
			
			System.out.println("=============pensionlist================== (1) : " +  pensionlist);	
			//펜션 업소 등록한 회원만 펜션프로필 페이지 이동
			if(res > 0) {
			 // 파일 경로를 슬래시(/)로 변경
			    if (pensionlist != null) {
			    	for (PensionVO pension : pensionlist) {
			        String convertedPath = pension.getSavePath().replace("\\", "/");
			        pension.setSavePath(convertedPath);
			        
			    	}
		    	System.out.println("=============pensionlist================== (2) : " +  pensionlist);
		    } 
		    }else {
					//메세지 처리
					System.out.println("msg");
					return "/member/nodata";  
				}
		    
		   		model.addAttribute("pension",pensionlist); 
				return "/member/pensionProfile";
			
	}


	//펜션 수정페이지 이동
	@PostMapping("pensionProfile_Update")
	public String phProfileUpdatePage(PensionVO vo, Model model) {
		List<PensionVO> pensionlist = pensionService.mypensionlist(vo.getM_id());
		
		if (pensionlist != null) {
	    	for (PensionVO pension : pensionlist) {
	        String convertedPath = pension.getSavePath().replace("\\", "/");
	        pension.setSavePath(convertedPath);
	        
	    	}
	    	System.out.println("=============pensionlist================== (2) : " +  pensionlist);
	    } 
		
		model.addAttribute("pension",pensionlist); 
	    return "/member/pensionProfile_Update";
	}
	
	
	//수정 후 펜션페이지로 다시 이동
	@PostMapping("pensionProfile")
	public String phProfilePage(Model model, HttpSession session, PensionVO vo) {
		
		
		
		List<PensionVO> pensionlist = pensionService.mypensionlist(vo.getM_id());
		
		System.out.println("============vo.getM_id()================="+vo.getM_id());
		
		int res = pensionService.update_P(vo);
		
		if (res > 0 && pensionlist != null) {
	    	for (PensionVO pension : pensionlist) {
	        String convertedPath = pension.getSavePath().replace("\\", "/");
	        pension.setSavePath(convertedPath);
	        
	    	}
	    	System.out.println("=============pensionlist================== (2) : " +  pensionlist);
	    } 
		
		model.addAttribute("pension",pensionlist); 
		
		/*
  		
  		 if (fileuploadVO != null) {
	  		MemberVO updateMember = service.getOne(vo.getM_id());
	  		
	  		session.setAttribute("member", updateMember);
	  		
	  		 } else {
	  		 
	  			MemberVO updateMember = service.getOneNoImg(vo.getM_id());
	  			session.setAttribute("member", updateMember);
	  		 }
		*/
	    return "/member/pensionProfile";
	}

	
// 병원 컨트롤러 부분==========================================================================	
// 병원 컨트롤러 부분==========================================================================	

	//하나의 병원 조회
	@GetMapping("hospitalProfile")
	public String getOne_H(HttpSession session, HospitalVO vo, MemberVO memberVo) {
		
		try {
			MemberVO member = service.getOne(memberVo.getM_id());
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
	@GetMapping("mainProfile")
	public String mainProfile(){
		return "member/mainProfile";
	}
	
	
	   @ResponseBody
	   @RequestMapping(value="/peco/mypensionDel", method=RequestMethod.GET)
	   public void deleteHospitalRes(HttpServletRequest request) {
		   
		   String p_id = request.getParameter("p_id");
		   
		   System.out.println("del : "+p_id);
		   int res1 = service.MemDeleteRoom(p_id);
		   
		   if(res1>0) {
			   System.out.println("객실삭제완료");
			   int res2 = service.MemDeletePension(p_id);

			   if(res2>0) {
				   System.out.println("펜션삭제완료");
			   } else {
				   System.out.println("펜션삭제중오류");
			   }
			   
		   } else {
			   System.out.println("객실삭제중오류");
		   }
		   
		   

	   }
	
	
}
