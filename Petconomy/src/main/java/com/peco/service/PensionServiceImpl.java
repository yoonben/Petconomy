package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.PensionMapper;
import com.peco.vo.PensionFiileuploadVO;
import com.peco.vo.PensionReviewVO;
import com.peco.vo.PensionRoomVO;
import com.peco.vo.PensionVO;
import com.peco.vo.RegionCri;

@Service
public class PensionServiceImpl implements PensionService {

	@Autowired
	PensionMapper pensionMapper;
	
	@Override
	public int getOne_P(String m_id) {
		return pensionMapper.getOne_P(m_id);
	}

	@Override
	public int update_P(PensionVO vo) {
		return pensionMapper.update_P(vo);
	}
	
	@Override
	public List<PensionVO> mapList(RegionCri cri) {

		return pensionMapper.mapList(cri);
	}
	
	@Override
	public PensionVO getOne(String p_id) {

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
	public List<PensionVO> pensionList(RegionCri cri) {

		return pensionMapper.pensionList(cri);
	}

	@Override
	public int pensionInsert(PensionVO vo) {

		return pensionMapper.pensionInsert(vo); 
		
	}

	@Override
	public int totalCnt(RegionCri cri) {

		return pensionMapper.totalCnt(cri);
	}

	@Override
	public List<PensionVO> pensiontop() {

		return pensionMapper.pensiontop();
	}

	@Override
	public PensionFiileuploadVO getPesionImg(String p_id) {

		return pensionMapper.getPesionImg(p_id);
	}

	@Override
	public List<PensionFiileuploadVO> getRoomImg(String p_id) {
		
		return pensionMapper.getRoomImg(p_id);
	}

	@Override
	public int totalCount(RegionCri cri) {
		// TODO Auto-generated method stub
		return pensionMapper.totalCount(cri);
	}

	@Override
	public List<PensionVO> mypensionlist(String m_id) {
		return pensionMapper.mypensionlist(m_id);
	}



}
