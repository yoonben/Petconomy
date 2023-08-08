package com.peco.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.peco.vo.BusinessFileuploadVO;
import com.peco.vo.FileuploadVO;
import com.peco.vo.PensionFiileuploadVO;

@Service
public interface FileuploadService {
	
	public int insertProfile(FileuploadVO vo);
	
	public int insertPensionfile(PensionFiileuploadVO vo);

	public int insertBusinessfile(BusinessFileuploadVO vo);
	
	public int Pensionfileupload(List<MultipartFile> pensionimg, String p_id)throws Exception;
	
	public int PensionfileupRoomload(List<MultipartFile> roonimg, String p_id)throws Exception;
	
	public int Businessfileupload(List<MultipartFile> files, String p_id)throws Exception;
	
	public int Profileupload(List<MultipartFile> files, String m_id) throws Exception;
	
	public int delete_Img(@Param("m_id")String m_id, @Param("uuid") String uuid);
	
	public int delete_Img(String m_id);
	
	/**
	 * 하나의 게시물에 저장된 파일의 목록을 조회
	 * 
	 * @param bno
	 * @return
	 */
	public List<FileuploadVO> getList(int bno); 
	
	public int insert(FileuploadVO vo); 
	
	public int delete(int bno, String uuid);
	
	public int fileupload(List<MultipartFile> files, int bno ) throws Exception;
	
	public List<FileuploadVO> getPath(int bno);
	
	public FileuploadVO getProfile(String m_id);
}
