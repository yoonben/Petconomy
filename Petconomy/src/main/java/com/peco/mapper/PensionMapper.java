package com.peco.mapper;

import java.util.List;

import com.peco.vo.PensionVO;



public interface PensionMapper {
	public List<PensionVO> mapList();
	
	public PensionVO getOne_P(String m_id);
	
	public int update_P(PensionVO vo);
}
