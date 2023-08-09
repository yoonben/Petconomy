package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.AdminReviewMapper;
import com.peco.vo.Criteria;
import com.peco.vo.HospitalReviewVO;
import com.peco.vo.PensionReviewVO;

@Service
public class AdminReviewServiceImpl implements AdminReviewService {
	
	@Autowired
	AdminReviewMapper adminMapper;
	
	@Override
	public List<PensionReviewVO> getPReviewList(Criteria cri) {
		
		return adminMapper.getPReviewList(cri);
	}

	@Override
	public List<HospitalReviewVO> getHReviewList(Criteria cri) {
		
		return adminMapper.getHReviewList(cri);
	}

	@Override
	public int pdelete(int pr_no) {
		
		return adminMapper.pdelete(pr_no);
	}

	@Override
	public int hdelete(int hr_no) {
		
		return adminMapper.hdelete(hr_no);
	}

	@Override
	public int ptotalCnt() {
		// TODO Auto-generated method stub
		return adminMapper.ptotalCnt();
	}

	@Override
	public int htotalCnt() {
		// TODO Auto-generated method stub
		return adminMapper.htotalCnt();
	}

}
