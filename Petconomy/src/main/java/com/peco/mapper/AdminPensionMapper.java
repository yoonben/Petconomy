package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.Criteria;
import com.peco.vo.PensionVO;

public interface AdminPensionMapper {

	public List<PensionVO> getPensionList(@Param(value="cri") Criteria cri);
	
	public int totalCnt();
	
}
