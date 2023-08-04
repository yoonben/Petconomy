package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.Criteria;
import com.peco.vo.MemberVO;

public interface AdminPageMapper {
	public List<MemberVO> getMemberList(@Param(value="cri") Criteria cri);
	
	public int totalCnt();
}
