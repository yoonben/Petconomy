package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peco.vo.Criteria;
import com.peco.vo.HospitalReviewVO;
import com.peco.vo.PensionReviewVO;

@Service
public interface AdminReviewService {

	List<PensionReviewVO> getPReviewList(Criteria cri);
	
    List<HospitalReviewVO> getHReviewList(Criteria cri);
    
    int ptotalCnt();
    
    int htotalCnt();
	
	int pdelete(int pr_no);
	
	int hdelete(int hr_no);
	
}
