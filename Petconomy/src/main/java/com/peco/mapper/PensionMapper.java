package com.peco.mapper;

import java.util.List;

import com.peco.vo.PensionVO;



public interface PensionMapper {
	public List<PensionVO> mapList();
	
	public List<PensionVO> pensionList();
	
	public int pensionInsert(PensionVO vo);
	
	public PensionVO getOne_P(String m_id);
	
	public int update_P(PensionVO vo);

	public PensionVO getOne(@Param(value="p_id") String p_id);
	
	public List<PensionRoomVO> roomList(@Param(value="p_id") String p_id);
	
	public List<PensionReviewVO> reviewList(@Param(value="p_id") String p_id);
	
	public int starAvg(@Param(value="p_id") String p_id);
}
