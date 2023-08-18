package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.Criteria;
import com.peco.vo.R_ReplyVO;

public interface R_ReplyMapper {
	
    // 대댓글 리스트 조회
    public List<R_ReplyVO> getList(@Param("rno") int rno);

    // 대댓글 등록
    public int insert(R_ReplyVO r_reply);

    // 대댓글 수정
    public int update(R_ReplyVO r_reply);

    // 대댓글 삭제
    public int delete(int rrno);
	
	public int totalCnt(int bno);
	
	public R_ReplyVO getOne(String rrno);

 
}
