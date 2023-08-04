package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.Criteria;
import com.peco.vo.HospitalReviewVO;

public interface HospitalReviewMapper {

public List<HospitalReviewVO> getList(@Param(value="h_id") String h_id
			, @Param(value="cri") Criteria cri);

public int insert(HospitalReviewVO vo);

public int delete(int hr_no);

public int update(HospitalReviewVO vo);

public int totalCnt(String h_id);

public HospitalReviewVO getOne(int hr_no);

public List<HospitalReviewVO> getReviewerList(@Param(value="h_id") String h_id);
	
}
