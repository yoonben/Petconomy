package com.peco.mapper;

import java.util.List;


import com.peco.vo.Criteria;
import com.peco.vo.BoardVO;

public interface AdminBoardMapper {
	
	public List<BoardVO> getList(Criteria cri);
	
	public int delete(int bno);
	
	public int getTotalCnt(Criteria cri);
	

}
