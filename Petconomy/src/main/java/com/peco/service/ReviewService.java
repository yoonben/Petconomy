package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peco.vo.Criteria;
import com.peco.vo.PensionReviewVO;

@Service
public interface ReviewService {
	List<PensionReviewVO> getList(String p_id, Criteria cri);
	
	int insert(PensionReviewVO vo);
	
	int delete(int pr_no);
	
	int update(PensionReviewVO vo);
	
	int totalCnt(String p_id);	

	List<PensionReviewVO> getReviewerList(String p_id);
}
