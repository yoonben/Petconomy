package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peco.vo.Criteria;
import com.peco.vo.HospitalReviewVO;

@Service
public interface HospitalReviewService {
	
List<HospitalReviewVO> getList(String h_id, Criteria cri);
	
	int insert(HospitalReviewVO vo);
	
	int delete(int hr_no);
	
	int update(HospitalReviewVO vo);
	
	int totalCnt(String h_id);	

	List<HospitalReviewVO> getReviewerList(String h_id);
	
}
