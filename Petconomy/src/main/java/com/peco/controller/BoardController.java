package com.peco.controller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.peco.controller.CommonRestController;
import com.peco.service.BoardService;
import com.peco.service.FileuploadService;
import com.peco.vo.BoardVO;
import com.peco.vo.Criteria;
import com.peco.vo.FileuploadVO;
import com.peco.vo.ReplyVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/peco/*")
public class BoardController extends CommonRestController{
	
	@Autowired
	BoardService service;
	
	@Autowired
	FileuploadService fservice;
	
	
	@GetMapping("/board/main")
	public String board(Model model,Criteria cri) {

		List<BoardVO> Bestlist = service.getBest();
		List<BoardVO> Freelist = service.getFree(cri, model);
		List<BoardVO> Healinglist = service.getHealing(cri,model);
		
	    // 파일 경로를 슬래시(/)로 변경
	    if (Bestlist != null) {
	    	for (BoardVO Best : Bestlist) {
	        String convertedPath = Best.getSavePath().replace("\\", "/");
	        String convertedThumPath = Best.getS_savePath().replace("\\", "/");
	        Best.setSavePath(convertedPath);
	        Best.setS_savePath(convertedThumPath);
	    	}
	    }
	    // 파일 경로를 슬래시(/)로 변경
	    if (Freelist != null) {
	    	for (BoardVO Free : Freelist) {
	    		String convertedPath = Free.getSavePath().replace("\\", "/");
	    		String convertedThumPath = Free.getS_savePath().replace("\\", "/");
	    		Free.setSavePath(convertedPath);
	    		Free.setS_savePath(convertedThumPath);
	    	}
	    }
	    // 파일 경로를 슬래시(/)로 변경
	    if (Healinglist != null) {
	    	for (BoardVO Healing : Healinglist) {
	    		String convertedPath = Healing.getSavePath().replace("\\", "/");
	    		String convertedThumPath = Healing.getS_savePath().replace("\\", "/");
	    		Healing.setSavePath(convertedPath);
	    		Healing.setS_savePath(convertedThumPath);
	    	}
	    }
		
		
		model.addAttribute("Best",Bestlist);
		model.addAttribute("Free",Freelist);
		model.addAttribute("Healing",Healinglist);
		
		return "board/main";
		
	}
	
	
	  @GetMapping("/board/free")
	  public String free(Model model,Criteria cri) {
	  
	  List<BoardVO> list = service.getFree(cri,model); List<BoardVO> 
	  
	  Bestlist = service.getBest(); 
	  
	  
	  // 파일 경로를 슬래시(/)로 변경 
	  if (Bestlist != null) { for (BoardVO Best : Bestlist) {
	  String convertedPath = Best.getSavePath().replace("\\", "/"); String
	  convertedThumPath = Best.getS_savePath().replace("\\", "/");
	  Best.setSavePath(convertedPath); Best.setS_savePath(convertedThumPath); } }
	 
	  
	  model.addAttribute("list",list); model.addAttribute("Best",Bestlist);
	  
	  return "board/free"; 
	  }
	 
	
	@GetMapping("/board/healing")
	public String healing(Model model,Criteria cri) {
		
	  List<BoardVO> list = service.getHealing(cri,model); 
	  
	  List<BoardVO> Bestlist = service.getBest(); 
	  
	  
	  // 파일 경로를 슬래시(/)로 변경 
	  if (Bestlist != null) { 
		  for (BoardVO Best : Bestlist) {
		  String convertedPath = Best.getSavePath().replace("\\", "/"); 
		  String convertedThumPath = Best.getS_savePath().replace("\\", "/");
		  Best.setSavePath(convertedPath); Best.setS_savePath(convertedThumPath); 
		  } 
	  }
	 
	  
	  model.addAttribute("Best",Bestlist);

		
	  model.addAttribute("list",list);
		
		
		
	  return "board/healing";
	}
	
	@GetMapping("/board/search")
	public String search(Model model,Criteria cri) {
		
	  List<BoardVO> list = service.getSearch(cri, model); 


		
	  model.addAttribute("list",list);

	  return "board/search";
	}
	/*
	 * @GetMapping("/board") public String freeboard(@RequestParam("category")
	 * String category, Model model) {
	 * 
	 * List<BoardVO> list = service.getList(category);
	 * 
	 * model.addAttribute("list",list);
	 * 
	 * 
	 * // category에 따라서 다른 뷰로 매핑되도록 합니다. if ("free".equals(category)) { return
	 * "board/free"; // WEB-INF/views/board/free.jsp } else if
	 * ("healing".equals(category)) { return "board/healing"; //
	 * WEB-INF/views/board/healing.jsp } else { // 기타 경우, 예외처리 또는 기본 뷰를 반환할 수 있습니다.
	 * return "board/boardmain"; // 예를 들어, 에러 페이지로 이동하거나 기본 뷰로 이동할 수 있습니다. } }
	 */
	
	@GetMapping("/board/write")
	public String write() {
		
		return "board/write";
	}
	
	@PostMapping("/board/write")
	public String writeAction(Criteria cri,Model model,BoardVO board,RedirectAttributes rttr,List<MultipartFile> files) {
		System.out.println("작성 포스트 진입");
		
		log.info(board);
		
		int res;
		try {
			//board.getBno로 값을 가져오기 위해 insertSelectKey를 써야함
			//시퀀스를 먼저 조회후 시퀀스 번호를 bno에 저장 하고 난 후에 실행함
			//게시물 등록 및 파일 첨부
			res = service.insertSelectKey(board,files);
			
			System.out.println(res);
			String msg = "";
			
			if(res>0) {
			
				//rttr.addAttribute는 
				//url?msg=등록되었습니다 (쿼리스트링으로 전환됨. 화면에서 받을때 param.으로 받아야함)
				//rttr.addAttribute("msg",msg);
				
				//세션영역에 잠시 저장 -> param. 안붙이고 msg로 호출 가능
				//잠깐 쓰고 사라지기때문에 새로고침시 유지되지않음
				
				
				rttr.addFlashAttribute("msg",msg);
				rttr.addAttribute("pageNo",cri.getPageNo());
				rttr.addAttribute("searchField",cri.getSearchField());
				rttr.addAttribute("searchWord",cri.getSearchWord());
				return "redirect:/peco/board/view?bno="+board.getBno();
				
			}else {
				msg="등록중 오류가 발생하였습니다.";
				model.addAttribute("msg",msg);
				return "/board/free";
			}
			
		} catch (Exception e) {
	        log.info(e.getMessage());
	        model.addAttribute("msg", e.getMessage());
	        e.printStackTrace();
	        return "/board/free";
	    }
				
	}
	
	
	@GetMapping("/board/edit")
	public String edit(Model model,BoardVO paramVO) {
		model.addAttribute("board",service.selectOne(paramVO.getBno()));
		
		return "/board/edit";
	}
	
	@PostMapping("/board/edit")
	public String editAction(Criteria cri,RedirectAttributes rttr ,List<MultipartFile> files,BoardVO board,Model model) {
		System.out.println("==========================================");
		System.out.println("================포스트 에딧 진입==============");
		System.out.println("==========================================");
		
		/* 값 주고 받는 종류 차이를 알아야함
		 * request.getParam("pageNo"); 
		 * request.setAttr(""); 
		 * ${param.pageNo}
		 * 
		 * request.getAttr(""); 
		 * session.setAttr(""); 
		 * ${pageNo}
		 */
		
		
		log.info(board);

		int res;
		try {
			res = service.edit(board,files);
			System.out.println(res);
			String msg = "";
			String url = "";
			
			if(res>0) {
				
				msg = "게시글이 수정되었습니다.";
				
				rttr.addFlashAttribute("res",res);
				 
				
				//rttr.addAttribute는 
				//url?msg=등록되었습니다 (쿼리스트링으로 전환됨. 화면에서 받을때 param.으로 받아야함)
				
				//세션영역에 잠시 저장 -> param. 안붙이고 msg로 호출 가능
				//잠깐 쓰고 사라지기때문에 새로고침시 유지되지않음
				rttr.addFlashAttribute("msg",msg);
				//rttr.addFlashAttribute("cri",cri);
				
				//검색키워드 페이지 유지하고 돌아가기 구현
				//유지하기위해선 jsp에서 보낸 검색 및 페이지 정보 파라미터를 매개변수 cri로 받고 
				//cri로 받은 파라미터를 다시 addAttribute에 저장해서 화면으로 보내줄때 사용
				rttr.addAttribute("pageNo",cri.getPageNo());
				rttr.addAttribute("searchField",cri.getSearchField());
				rttr.addAttribute("searchWord",cri.getSearchWord());
				return "redirect:/peco/board/view?bno="+board.getBno();
				
	
				
			}else {
				msg="수정중 오류가 발생하였습니다.";
				model.addAttribute("msg",msg);
				return "/peco/board/main";
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			if(e.getMessage().indexOf("첨부파일")> -1) {
				model.addAttribute("msg",e.getMessage());
			}else {
				model.addAttribute("msg","등록중 예외사항이 발생하였습니다.");	
			}
			e.printStackTrace();
			return "/peco/board/main";
		}
	}
	
	
	
	@GetMapping("/board/view")
	public String selectOne(Model model,BoardVO paramVO) {
		
		BoardVO board = service.selectOne(paramVO.getBno());
		
		List<FileuploadVO> filelist = fservice.getPath(paramVO.getBno());
		
	    // 파일 경로를 슬래시(/)로 변경
	    if (filelist != null) {
	    	for (FileuploadVO file : filelist) {
	        String convertedPath = file.getSavePath().replace("\\", "/");
	        String convertedThumPath = file.getS_savePath().replace("\\", "/");
	        file.setSavePath(convertedPath);
	        file.setS_savePath(convertedThumPath);
	    	}
	    }
		
		model.addAttribute("board",board);
		model.addAttribute("filelist",filelist);
		
		
		
		return "board/view";
		
	}
	
	@GetMapping("/board/delete")
	public String delete(RedirectAttributes rttr,BoardVO board ,Model model) {
		
		System.out.println(board.getBno());
		
		int res = service.delete(board.getBno());
		
		if(res > 0) {
			
			//rttr.addFlashAttribute("msg","삭제 되었습니다.");
			return "redirect:/peco/board/free";
		}else {
			model.addAttribute("msg","삭제중 예외가 발생하였습니다.");
			return "/peco/board/free";
		}
	}
	

	
	
	 @GetMapping("/like/{bno}")
	 @ResponseBody
     public int updateLike(@PathVariable("bno") int bno, Model model) {
       
	 	int count = service.getLike(bno);

        
        return count;
    }
}
