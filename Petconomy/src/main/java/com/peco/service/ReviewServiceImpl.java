package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.ReviewMapper;
import com.peco.vo.Criteria;
import com.peco.vo.PensionReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewMapper reviewMapper;

	@Override
	public List<PensionReviewVO> getList(String p_id, Criteria cri) {
		// TODO Auto-generated method stub
		return reviewMapper.getList(p_id, cri);
	}	

	@Override
	public int insert(PensionReviewVO vo) {
		
		return reviewMapper.insert(vo);
	}

	@Override
	public int delete(int pr_no) {
		
		return reviewMapper.delete(pr_no);
	}

	@Override
	public int update(PensionReviewVO vo) {
		
		return reviewMapper.update(vo);
	}

	@Override
	public int totalCnt(String p_id) {
		
		return reviewMapper.totalCnt(p_id);
	}

	@Override
	public List<PensionReviewVO> getReviewerList(String p_id) {
		// TODO Auto-generated method stub
		return reviewMapper.getReviewerList(p_id);
	}


}
