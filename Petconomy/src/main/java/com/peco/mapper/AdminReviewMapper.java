package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.Criteria;
import com.peco.vo.HospitalReviewVO;
import com.peco.vo.PensionReviewVO;

public interface AdminReviewMapper {
	
	public List<PensionReviewVO> getPReviewList(@Param(value="cri") Criteria cri);
	
	public List<HospitalReviewVO> getHReviewList(@Param(value="cri") Criteria cri);
	
	public int ptotalCnt();
	
	public int htotalCnt();
	
	public int pdelete(int pr_no);
	
	public int hdelete(int hr_no);
	
}
