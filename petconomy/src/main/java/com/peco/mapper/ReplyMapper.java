package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.Criteria;
import com.peco.vo.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> getList(@Param(value="bno") int bno,@Param(value="cri")Criteria cri);
	
	public int insert(ReplyVO vo);
	
	public int delete(@Param(value="rno") String rno);
	
	public int update(ReplyVO vo);
	
	public int totalCnt(int bno);
	
	public ReplyVO getOne(String rno);

}
