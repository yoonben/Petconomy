package com.peco.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.peco.service.FileuploadService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/peco/*")
@Log4j
public class FileuploadController extends CommonRestController{
	
	public static final String ATTACHES_DIR = "c:\\upload\\";
	
	@Autowired
	FileuploadService service;
	
	/**
	 * -전달된 파일이 없는경우
	 * 
	 * -enctype="multipart/foem-data" 오타
	 * 
	 * -설정이 안되었을때
	 * 		라이브러리 추가(commons-filupload)
	 * 		bean추가
	 * 
	 * @param files
	 * @return
	 * @throws Exception 
	 */
	@PostMapping("/ProfileloadActionFetch")
	public @ResponseBody Map<String, Object> fileuploadActionFetch(List<MultipartFile> files, String m_id, RedirectAttributes rttr) throws Exception {
		log.info("fileuploadActionFetch");
		int insertRes = service.Profileupload(files, m_id);
		log.info("업로드 건수 : " + insertRes);
		return responseMap("success", "회원가입되었습니다");

	}
	
	@PostMapping("/file/fileUploadAction")
	public  String fileUploadAction(List<MultipartFile> files, int bno ,RedirectAttributes rttr) throws Exception {
		
		
		int insertRes = service.fileupload(files,bno);
		
		String msg = insertRes + "건 저장 되었습니다.";
		rttr.addAttribute("msg",msg);
		
		return "redirect:/file/fileupload";
		
	}
	
	@PostMapping("/file/fileUploadActionFetch")
	public @ResponseBody Map<String,Object> fileUploadActionFetch(List<MultipartFile> files, int bno) throws Exception {
		
		log.info("fileUploadActionFetch");
		int insertRes = service.fileupload(files,bno);
		log.info("업로드 건수 : " + insertRes);

		return responseMap("sucess", insertRes + "건 저장되었습니다.");

	}
	
	
	
	@GetMapping("/file/list/{bno}")
	public @ResponseBody Map<String,Object> fileuploadList(@PathVariable("bno")int bno) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("list",service.getList(bno));
		
		return  map;
	}
	
	
	
	
	
	@GetMapping("/file/delete/{uuid}/{bno}")
	public @ResponseBody Map<String,Object> delete(@PathVariable("uuid")String uuid,@PathVariable("bno")int bno){
			
		int res = service.delete(bno, uuid);
		if(res > 0) {
			
			return responseDeleteMap(res);
		}else {
			
			return responseDeleteMap(res);
		}
	}
	
	/**
	 * 파일 다운로드
	 * 컨텐츠 타입을 다운로드 받을수 있는 형식으로 지정하여 
	 * 브라우저에서 파일을 다운로드 할수있게 처리
	 * @param filename
	 * @return
	 */
	@GetMapping("/file/download")
	public ResponseEntity<byte[]> download(String filename){
	
		log.info("download file : " + filename);
		HttpHeaders header = new HttpHeaders();
		
		File file = new File(ATTACHES_DIR + filename);
		
		System.out.println();
		
		if(file.exists()) {
			//컨텐츠 타입을 지정
			//APLLICATION_OCTET_STREAM : 이전 파일의 컨텐츠 유형
			header.add("contentType", MediaType.APPLICATION_OCTET_STREAM.toString());
			
			//컨텐츠에 대한 추가설명 및 파일 이름 한글처리
			try {
				header.add("Content-Disposition"
								, "attachment; filename=\""
								+ new String(filename.getBytes("UTF-8"),"ISO-8859-1")+"\"");
				
				return new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);

				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				
			} catch (IOException e) {
				e.printStackTrace();
				
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
	}
	
	@GetMapping("/display")
	// 이미지를 화면에 보여줍니다
	//화면에서  태그 사용 <img src='/display?fileName=" + s_savePath+"'></a> 
	public ResponseEntity<byte[]> display(String fileName) {
		log.info("=====fileName : " + fileName);
		
		try {
			// 파일 객체를 생성
			File file = new File(ATTACHES_DIR+fileName);
			HttpHeaders headers = new HttpHeaders();
			
			// 이미지 파일이 존재하면 파일을 이미지를 다운로드
			if(file.exists()) {
				// Mime타입을 설정
				headers.add("Content-Type",Files.probeContentType(file.toPath()));
				return new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
			}else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			
		} catch (IOException e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
}
