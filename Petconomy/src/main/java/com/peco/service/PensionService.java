package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peco.vo.PensionReviewVO;
import com.peco.vo.PensionRoomVO;
import com.peco.vo.PensionVO;



@Service
public interface PensionService {

	public List<PensionVO> mapList();

	public List<PensionVO> pensionList();
	

	public int pensionInsert(PensionVO vo);
	
	

	public PensionVO getOne_P(String m_id);

	public int update_P(PensionVO vo);
	
	public PensionVO getOne(String p_id);
	
	public List<PensionRoomVO> roomList(String p_id);
	
	public List<PensionReviewVO> reviewList(String p_id);
	
	public int starAvg(String p_id);
}
