package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.Criteria;
import com.peco.vo.PensionReviewVO;

public interface ReviewMapper {

public List<PensionReviewVO> getList(@Param(value="p_id") String p_id
			, @Param(value="cri") Criteria cri);

public int insert(PensionReviewVO vo);

public int delete(int pr_no);

public int update(PensionReviewVO vo);

public int totalCnt(String p_id);

public PensionReviewVO getOne(int pr_no);

public List<PensionReviewVO> getReviewerList(@Param(value="p_id") String p_id);
}
