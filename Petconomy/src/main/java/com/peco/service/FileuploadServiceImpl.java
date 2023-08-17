package com.peco.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import com.peco.controller.FileuploadController;
import com.peco.mapper.FileuploadMapper;
import com.peco.vo.BusinessFileuploadVO;
import com.peco.vo.FileuploadVO;
import com.peco.vo.PensionFiileuploadVO;
import com.peco.vo.PensionRoomFiluploadVo;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Service
@Log4j
public class FileuploadServiceImpl implements FileuploadService{
	
	@Autowired
	FileuploadMapper mapper;

	@Override
	public int insertProfile(FileuploadVO vo) {
		return mapper.insertProfile(vo);
	}
	
	@Override
	public int insertPensionfile(PensionFiileuploadVO vo) {
		return mapper.insertPensionfile(vo);
	}
	
	@Override
	public int insertPensionRoomfile(PensionRoomFiluploadVo vo) {
		return mapper.insertPensionRoomfile(vo);
	}
	
	
	@Override
	public int insertBusinessfile(BusinessFileuploadVO vo) {
		return mapper.insertBusinessfile(vo);
	}
	
	@Override
	public int delete_Img(String m_id, String uuid) {
		return mapper.delete_Img(m_id, uuid);
	}
	
	@Override
	public int delete_Img(String m_id) {
		return mapper.delete_Img(m_id);
	}
	
	/**
	 * 첨부파일 저장및 데이터 베이스에 등록
	 * @param files
	 * @param bno
	 * @return
	 * @throws Exception 
	 */
	public int Profileupload(List<MultipartFile> files,String m_id) throws Exception {
		int insertRes = 0;
		for(MultipartFile file : files) {
			if(file.isEmpty()) {
				continue;
			}
			log.info("=====================================");
			log.info("oFileName : "+file.getOriginalFilename());
			log.info("name : "+file.getName());
			log.info("size : "+file.getSize());
			
			
			try {
				// UUID
				/**
				 * 소프트웨어 구축에 쓰이는 식별자 표준
				 * 파일이름이 중복되어 파일이 소실되지 않도록 uuid를 붙여서 저장
				 */
				UUID uuid = UUID.randomUUID();
				String saveFileName = m_id+file.getOriginalFilename();
				String uploadPath = getProfile();
				
				File sFile = new File(FileuploadController.ATTACHES_DIR
						+uploadPath 
						+saveFileName);
				
				// file(원본파일)을 sFile(저장 대상 파일)에 저장
				file.transferTo(sFile);
				
				//주어진 파일의 Mine유형
				String contentType = Files.probeContentType(sFile.toPath());
				FileuploadVO vo = new FileuploadVO();
				
				// Mine타입을 확인하여 이미지인 경우 썸네일을 생성
				if(contentType.startsWith("image")) {
					vo.setFiletype("I");
					
					// 썸네일 생성 경로
					String thmbnail = FileuploadController.ATTACHES_DIR
									+uploadPath 
									+"s_"
									+saveFileName;
					
					// 썸네일 생성
					// 원본파일.크기.저장될 경로
					Thumbnails.of(sFile).size(100, 100).toFile(thmbnail);
				}else {
					vo.setFiletype("F");
				}
				
				vo.setM_id(m_id);
				vo.setFilename(file.getOriginalFilename());
				vo.setUploadpath(uploadPath);
				vo.setUuid(uuid.toString());
				
				int res = insertProfile(vo);
				
				if(res>0) {
					insertRes++;
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습ㄴ디ㅏ.(IllegalStateException)");
			} catch (IOException e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습ㄴ디ㅏ.(IOException)");
			} catch(Exception e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습ㄴ디ㅏ.(Exception)");
			}
		}
		return insertRes;
	}
	
	// 패션 업로드
	public int Pensionfileupload(List<MultipartFile> pensionimg, String p_id) throws Exception {
		int insertRes = 0;
		for(MultipartFile file : pensionimg) {
			if(file.isEmpty()) {
				continue;
			}
			log.info("=====================================");
			log.info("oFileName : "+file.getOriginalFilename());
			log.info("name : "+file.getName());
			log.info("size : "+file.getSize());
			
			
			try {
				// UUID
				/**
				 * 소프트웨어 구축에 쓰이는 식별자 표준
				 * 파일이름이 중복되어 파일이 소실되지 않도록 uuid를 붙여서 저장
				 */
				String saveFileName = p_id+file.getOriginalFilename();
				String uploadPath = getPension();
				
				File sFile = new File(FileuploadController.ATTACHES_DIR
						+uploadPath
						+saveFileName);
				
				// file(원본파일)을 sFile(저장 대상 파일)에 저장
				file.transferTo(sFile);
				
				//주어진 파일의 Mine유형
				String contentType = Files.probeContentType(sFile.toPath());
				PensionFiileuploadVO vo = new PensionFiileuploadVO();
				
				if(contentType.startsWith("image")) {
					vo.setFiletype("I");
					
				}else {
					vo.setFiletype("F");
				}
				
				vo.setP_id(p_id);
				vo.setFilename(file.getOriginalFilename());
				vo.setUploadpath(uploadPath);
				
				int res = insertPensionfile(vo);
				
				if(res>0) {
					insertRes++;
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습ㄴ디ㅏ.(IllegalStateException)");
			} catch (IOException e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습ㄴ디ㅏ.(IOException)");
			} catch(Exception e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습ㄴ디ㅏ.(Exception)");
			}
		}
		return insertRes;
	}

	public int PensionfileupRoomload(List<MultipartFile> roonimg, String p_id) throws Exception {
		int insertRes = 0;
		
		int i = 0;
		
		for(MultipartFile file : roonimg) {
			if(file.isEmpty()) {
				continue;
			}
			log.info("=====================================");
			log.info("oFileName : "+file.getOriginalFilename());
			log.info("name : "+file.getName());
			log.info("size : "+file.getSize());
			
			
			try {
				// UUID
				/**
				 * 소프트웨어 구축에 쓰이는 식별자 표준
				 * 파일이름이 중복되어 파일이 소실되지 않도록 uuid를 붙여서 저장
				 */
				
				String saveFileName = p_id+file.getOriginalFilename();
				String uploadPath = getPensionRoom();
				
				File sFile = new File(FileuploadController.ATTACHES_DIR
						+uploadPath
						+i
						+saveFileName);
				
				// file(원본파일)을 sFile(저장 대상 파일)에 저장
				file.transferTo(sFile);
				
				//주어진 파일의 Mine유형
				String contentType = Files.probeContentType(sFile.toPath());
				PensionRoomFiluploadVo vo = new PensionRoomFiluploadVo();
				
				// Mine타입을 확인하여 이미지인 경우 썸네일을 생성
				if(contentType.startsWith("image")) {
					vo.setFiletype("I");
					
				}else {
					vo.setFiletype("F");
				}
				
				vo.setP_id(p_id);
				vo.setFilename(file.getOriginalFilename());
				vo.setUploadpath(uploadPath);
				vo.setRoom_no(String.valueOf(i));
				
				int res = insertPensionRoomfile(vo);
				
				i++;
				if(res>0) {
					insertRes++;
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습ㄴ디ㅏ.(IllegalStateException)");
			} catch (IOException e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습ㄴ디ㅏ.(IOException)");
			} catch(Exception e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습ㄴ디ㅏ.(Exception)");
			}
		}
		return insertRes;
	}

	public int Businessfileupload(List<MultipartFile> files, String p_id) throws Exception {
		int insertRes = 0;
		for(MultipartFile file : files) {
			if(file.isEmpty()) {
				continue;
			}
			log.info("=====================================");
			log.info("oFileName : "+file.getOriginalFilename());
			log.info("name : "+file.getName());
			log.info("size : "+file.getSize());
			
			
			try {
				// UUID
				/**
				 * 소프트웨어 구축에 쓰이는 식별자 표준
				 * 파일이름이 중복되어 파일이 소실되지 않도록 uuid를 붙여서 저장
				 */
				String saveFileName = p_id+file.getOriginalFilename();
				String uploadPath = getBusiness();
				
				File sFile = new File(FileuploadController.ATTACHES_DIR
						+uploadPath 
						+saveFileName);
				
				// file(원본파일)을 sFile(저장 대상 파일)에 저장
				file.transferTo(sFile);
				
				//주어진 파일의 Mine유형
				String contentType = Files.probeContentType(sFile.toPath());
				BusinessFileuploadVO vo = new BusinessFileuploadVO();
				
				// Mine타입을 확인하여 이미지인 경우 썸네일을 생성
				if(contentType.startsWith("image")) {
					vo.setFiletype("I");
					
				}else {
					vo.setFiletype("F");
				}
				
				vo.setP_id(p_id);
				vo.setFilename(file.getOriginalFilename());
				vo.setUploadpath(uploadPath);
				
				int res = insertBusinessfile(vo);
				
				if(res>0) {
					insertRes++;
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습ㄴ디ㅏ.(IllegalStateException)");
			} catch (IOException e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습ㄴ디ㅏ.(IOException)");
			} catch(Exception e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습ㄴ디ㅏ.(Exception)");
			}
		}
		return insertRes;
	}
	
	// 중복 방지용
	//		업로드 날짜를 폴더 이름으로 사용
	public String getProfile() {
		String uploadPath = "profile" + File.separator;
		log.info("경로 : " + uploadPath);
		
		File saveDir = new File(FileuploadController.ATTACHES_DIR + uploadPath);
		if(!saveDir.exists()) {
			if(saveDir.mkdirs()) {
				log.info("폴더 생성!!");
			}else {
				log.info("폴더 생성 실패!!");
			}
		}
		
		return uploadPath;
	}
	
	public String getPension() {
		String uploadPath = "pension" + File.separator;
		log.info("경로 : " + uploadPath);
		
		File saveDir = new File(FileuploadController.ATTACHES_DIR + uploadPath);
		if(!saveDir.exists()) {
			if(saveDir.mkdirs()) {
				log.info("폴더 생성!!");
			}else {
				log.info("폴더 생성 실패!!");
			}
		}
		
		return uploadPath;
	}
	
	public String getPensionRoom() {
		String uploadPath = "pensionroom" + File.separator;
		log.info("경로 : " + uploadPath);
		
		File saveDir = new File(FileuploadController.ATTACHES_DIR + uploadPath);
		if(!saveDir.exists()) {
			if(saveDir.mkdirs()) {
				log.info("폴더 생성!!");
			}else {
				log.info("폴더 생성 실패!!");
			}
		}
		
		return uploadPath;
	}
	
	public String getBusiness() {
		String uploadPath = "business" + File.separator;
		log.info("경로 : " + uploadPath);
		
		File saveDir = new File(FileuploadController.ATTACHES_DIR + uploadPath);
		if(!saveDir.exists()) {
			if(saveDir.mkdirs()) {
				log.info("폴더 생성!!");
			}else {
				log.info("폴더 생성 실패!!");
			}
		}
		
		return uploadPath;
	}
	
	@Override
	public List<FileuploadVO> getList(int bno) {
		
		return mapper.getList(bno);
	}
	
	@Override
	public int insert(FileuploadVO vo) {
		
		return mapper.insert(vo);
	}

	@Override
	public int delete(int bno,String uuid) {
		//삭제할 파일 조회
		FileuploadVO vo = mapper.getOne(bno, uuid);
		String savePath = vo.getSavePath();
		String s_savePath = vo.getS_savePath();
		System.out.println("savePath : "+ savePath);
		System.out.println("s_savePath : "+ s_savePath);
		
		//서버 로컬 경로에 저장되는 실제 파일삭제				
		if(savePath != null && !savePath.equals("")) {
			File file = new File(FileuploadController.ATTACHES_DIR+savePath);
			
			if(file.exists()) {
				if(!file.delete()){
					System.out.println("path : " + savePath);
					System.out.println("파일 삭제 실패!");
				}else {
				System.out.println("path : " + savePath);
				System.out.println("파일 삭제 성공!");
				}
			}
		}
		if(s_savePath != null && !s_savePath.equals("")) {
			File file = new File(FileuploadController.ATTACHES_DIR+s_savePath);
			
			if(file.exists()) {
				if(!file.delete()){
					System.out.println("path : " + s_savePath);
					System.out.println("파일 삭제 실패!");
				}else {
				System.out.println("path : " + savePath);
				System.out.println("파일 삭제 성공!");
				}
			}
		}
		
		//데이터베이스에서 파일 값 삭제
		return mapper.delete(bno, uuid);
	}
	
	
	/**
	 * 첨부파일 저장 및 데이터 베이스에 등록
	 * @param files
	 * @param bno
	 * @return
	 * @throws Exception
	 */
	@Override
	public int fileupload(List<MultipartFile> files, int bno ) throws Exception {
		int insertRes = 0;
		for(MultipartFile file : files) {
					
					//continue를 걸어주는 이유는
					//jsp에서 input type:file 요소가 여러개일 경우 *multiple 아닌경우
					//선택된 파일이 없는 경우 다음 파일로 이동
					if(file.isEmpty()) {
						continue;
					}
					log.info("-----------------------------------------------------------------");
					log.info("getOriginalFilename: "+file.getOriginalFilename());
					log.info("getName: "+file.getName()); //파일 이름이 아닌 jsp에서 input요소의 name
					log.info("getSize: "+file.getSize());
					log.info("-----------------------------------------------------------------");
					
					try {
						//UUID
						/**
						 * 소프트웨어 구축에 쓰이는 식별자 표준 
						 * 식별자:중복되지않는 값
						 * 파일이름이 중복되어 파일이 소실되지 않도록 파일이름에 uuid를 붙여서 저장
						 */
						UUID uuid = UUID.randomUUID();
						String saveFileName = uuid + "_" +file.getOriginalFilename();
						
						//dir
						//c:/upload/2023/07/18/
						// 			년/월/일
						File sFile = new File(FileuploadController.ATTACHES_DIR
														+getFolder() //경로 2023\07\18\
														+saveFileName);
						
						//file(원본파일)을 sFile(저장 대상 파일)에 저장
						file.transferTo(sFile);
						
						FileuploadVO vo = new FileuploadVO();
		
						//주어진 파일의 Mime 유형을 확인
						String contentType =
											Files.probeContentType(sFile.toPath());
						
						//Mime타입을 확인하여 이미지인 경우 썸네일을 생성
						if(contentType != null && contentType.startsWith("image")) {
							//파일타입 변경
							vo.setFiletype("I");
							//썸네일  저장 경로
							String thumbnail = FileuploadController.ATTACHES_DIR+getFolder()+"s_"+saveFileName;
							
							//썸네일 생성
											  //원본파일, 크기 ,저장될 경로
							Thumbnails.of(sFile).size(500, 500).toFile(thumbnail);
							log.info("------파일경로-------");
							log.info(sFile.getPath());
							log.info("------파일경로-------");
							
						}else {
							vo.setFiletype("F");
						}
						vo.setBno(bno);
						vo.setFilename(file.getOriginalFilename());
						vo.setUploadpath(getFolder());
						vo.setUuid(uuid.toString());
						
						int res = insert(vo);
						
						if(res>0) {
							insertRes++;
						}
						
					} catch (IllegalStateException e) {
						e.printStackTrace();
						throw new Exception("첨부파일 등록중 예외가 발생하였습니다.(IllegalStateException)");
					} catch (IOException e) {
						e.printStackTrace();
						throw new Exception("첨부파일 등록중 예외가 발생하였습니다.(IOException)");
					} catch (Exception e) {
						e.printStackTrace();
						throw new Exception("첨부파일 등록중 예외가 발생하였습니다.(Exception)");
					}
	
				}
		return insertRes;
	}
	
	//중복 방지를 위한 날자별 업로드 폴더 만들기
	//업로드 날자를 폴더 이름으로 사용
	public String getFolder() {
		//현재 시간 가져오기
		LocalDate currentDate = LocalDate.now() ;
		//날자를 2023\07\18\ 형태로 변환해서 경로처럼 만들어주기
		String uploadPath =currentDate.toString().replace("-", File.separator)+File.separator;
		log.info("-----------------------------------------");
		log.info("currentDate = "+currentDate);
		log.info("경로  = "+uploadPath);
		log.info("-----------------------------------------");
		
		//폴더 생성(없을때만)
		File saveDir = new File(FileuploadController.ATTACHES_DIR + uploadPath);
		if(!saveDir.exists()) {
			//경로를 여러개 만들때는 mkdirs  s가 붙은거로
			if(saveDir.mkdirs()) {
				log.info("폴더 생성!");
			}else {
				log.info("폴더 생성 실패!");
			}
		}

		return uploadPath;
	}

	@Override
	public List<FileuploadVO> getPath(int bno) {
		
		return mapper.getPath(bno);
	}

	@Override
	public FileuploadVO getProfile(String m_id) {
		
		return mapper.getProfile(m_id);
	}

}
