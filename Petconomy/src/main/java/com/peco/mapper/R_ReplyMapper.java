package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.Criteria;
import com.peco.vo.R_ReplyVO;

public interface R_ReplyMapper {
	
	public List<R_ReplyVO> getList(@Param(value="rno") int rno,@Param(value="cri")Criteria cri);
	
	public int insert(R_ReplyVO vo);
	
	public int delete(@Param(value="rrno") String rrno);
	
	public int update(R_ReplyVO vo);
	
	public int totalCnt(int bno);
	
	public R_ReplyVO getOne(String rrno);

 
}
