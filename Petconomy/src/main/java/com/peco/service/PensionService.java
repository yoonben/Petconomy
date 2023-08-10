package com.peco.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.peco.vo.PensionFiileuploadVO;
import com.peco.vo.PensionReviewVO;
import com.peco.vo.PensionRoomVO;
import com.peco.vo.PensionVO;
import com.peco.vo.RegionCri;



@Service
public interface PensionService {

	public List<PensionVO> mapList(RegionCri cri);

	public List<PensionVO> pensionList(RegionCri cri);
	
	public List<PensionVO> pensiontop();
	
	public int pensionInsert(PensionVO vo);
	
	public int totalCnt(RegionCri cri);

	public PensionVO getOne_P(String m_id);

	public int update_P(PensionVO vo);
	
	public PensionVO getOne(String p_id);
	
	public List<PensionRoomVO> roomList(String p_id);
	
	public List<PensionReviewVO> reviewList(String p_id);
	
	public int starAvg(String p_id);
	
	public PensionFiileuploadVO getPesionImg(@Param(value="p_id") String p_id);
	
	public List<PensionFiileuploadVO> getRoomImg(@Param(value="p_id") String p_id);
	
	public int totalCount(RegionCri cri);
}
