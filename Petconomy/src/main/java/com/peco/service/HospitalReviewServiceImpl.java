package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.HospitalReviewMapper;
import com.peco.vo.Criteria;
import com.peco.vo.HospitalReviewVO;

@Service
public class HospitalReviewServiceImpl implements HospitalReviewService {
	
	@Autowired
	HospitalReviewMapper reviewMapper;

	public List<HospitalReviewVO> getList(String h_id, Criteria cri) {
		// TODO Auto-generated method stub
		return reviewMapper.getList(h_id, cri);
	}	

	@Override
	public int insert(HospitalReviewVO vo) {
		
		return reviewMapper.insert(vo);
	}

	@Override
	public int delete(int hr_no) {
		
		return reviewMapper.delete(hr_no);
	}

	@Override
	public int update(HospitalReviewVO vo) {
		
		return reviewMapper.update(vo);
	}

	@Override
	public int totalCnt(String h_id) {
		
		return reviewMapper.totalCnt(h_id);
	}

	@Override
	public List<HospitalReviewVO> getReviewerList(String h_id) {
		// TODO Auto-generated method stub
		return reviewMapper.getReviewerList(h_id);
	}

	

}
