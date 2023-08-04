package com.peco.mapper;

import java.util.List;

import com.peco.vo.PensionVO;



public interface PensionMapper {
	public List<PensionVO> mapList();
	
	public List<PensionVO> pensionList();
	
	public int pensionInsert(PensionVO vo);
}
