package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.Criteria;
import com.peco.vo.BoardVO;

public interface AdminBoardMapper {
	
	public List<BoardVO> getList(@Param(value="cri") Criteria cri);
	
	public int delete(int bno);
	
	public int getTotalCnt();
	

}
