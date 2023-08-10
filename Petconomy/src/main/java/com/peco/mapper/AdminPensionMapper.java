package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.Criteria;
import com.peco.vo.PensionFiileuploadVO;
import com.peco.vo.PensionVO;

public interface AdminPensionMapper {

	public List<PensionVO> getPensionList(@Param(value="cri") Criteria cri);
	
	public List<PensionFiileuploadVO> getPensionBList(@Param(value="p_id") String p_id);
	
	public int totalCnt();
	
	public int update(String p_id);
	
	public int imgOn(String p_id);
	
	
}
