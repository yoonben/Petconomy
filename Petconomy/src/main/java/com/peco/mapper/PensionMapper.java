package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.PensionFiileuploadVO;
import com.peco.vo.PensionReviewVO;
import com.peco.vo.PensionRoomVO;
import com.peco.vo.PensionVO;
import com.peco.vo.RegionCri;



public interface PensionMapper {
	public List<PensionVO> mapList(RegionCri cri);
	
	public List<PensionVO> pensionList(RegionCri cri);

	public List<PensionVO> pensiontop();
	
	public int pensionInsert(PensionVO vo);
	
	public PensionVO getOne_P(String m_id);
	
	public int update_P(PensionVO vo);

	public PensionVO getOne(@Param(value="p_id") String p_id);
	
	public List<PensionRoomVO> roomList(@Param(value="p_id") String p_id);
	
	public List<PensionReviewVO> reviewList(@Param(value="p_id") String p_id);
	
	public int starAvg(@Param(value="p_id") String p_id);
	
	public int totalCnt(RegionCri cri);
	
	public PensionVO selectPensionList();
	
	public PensionFiileuploadVO getPesionImg(@Param(value="p_id") String p_id);
	
	public List<PensionFiileuploadVO> getRoomImg(@Param(value="p_id") String p_id);
}
