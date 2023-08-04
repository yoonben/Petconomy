package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.FileuploadVO;

public interface FileuploadMapper {
	
	public int insertProfile(FileuploadVO vo);
	
	public List<FileuploadVO> getList(int bno); 
	
	public int insert(FileuploadVO vo);
	
	public int delete_Img(String m_id);
	
	//쿼리문에서 #{}변수를 두개이상 받아야할 경우엔 vo객체를 쓰던가 아니면 @Param 이용해야함
	public int delete(@Param(value="bno") int bno,@Param(value="uuid")String uuid);
	
	public FileuploadVO getOne(@Param(value="bno") int bno,@Param(value="uuid")String uuid);
	
	public List<FileuploadVO> getPath(@Param(value="bno") int bno);
	
	public FileuploadVO getProfile(String m_id);
	
}
