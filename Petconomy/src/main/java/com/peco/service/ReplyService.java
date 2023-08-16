package com.peco.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.peco.vo.Criteria;
import com.peco.vo.ReplyVO;

@Service
public interface ReplyService {
	
	public List<ReplyVO> getList(int bno,Criteria cri);
	
	  // 대댓글 정보도 함께 조회하는 메서드
    public List<ReplyVO> getListWithRReply(@Param("bno") int bno, @Param("cri") Criteria cri);
	
	public int insert(ReplyVO vo);
	
	public int delete(String rno);
	
	public int update(ReplyVO vo);
	
	public int totalCnt(int bno);

}
