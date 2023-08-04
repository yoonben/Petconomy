package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.PensionMapper;
import com.peco.vo.PensionReviewVO;
import com.peco.vo.PensionRoomVO;
import com.peco.vo.PensionVO;

@Service
public class PensionServiceImpl implements PensionService {

	@Autowired
	PensionMapper pensionMapper;
	
	@Override
	public PensionVO getOne_P(String m_id) {
		return pensionMapper.getOne_P(m_id);
	}

	@Override
	public int update_P(PensionVO vo) {
		return pensionMapper.update_P(vo);
	}
	
	@Override
	public List<PensionVO> mapList() {
		// TODO Auto-generated method stub
		return pensionMapper.mapList();
	}
	
	@Override
	public PensionVO getOne(String p_id) {
		// TODO Auto-generated method stub
		return pensionMapper.getOne(p_id);
	}

	@Override
	public List<PensionRoomVO> roomList(String p_id) {
		
		List<PensionRoomVO> roomList = pensionMapper.roomList(p_id);		
		
		return roomList;
	}

	@Override
	public List<PensionReviewVO> reviewList(String p_id) {
		List<PensionReviewVO> reviewList = pensionMapper.reviewList(p_id);
		
		return reviewList;
	}

	@Override
	public int starAvg(String p_id) {
		
		return pensionMapper.starAvg(p_id);
	}

	@Override
	public List<PensionVO> pensionList() {
		// TODO Auto-generated method stub
		return pensionMapper.pensionList();
	}



}
