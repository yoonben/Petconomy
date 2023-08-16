package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peco.vo.Criteria;
import com.peco.vo.R_ReplyVO;

@Service
public interface R_ReplyService {
	
	public List<R_ReplyVO> getList(int rno,Criteria cri);
	
	public int insert(R_ReplyVO vo);
	
	public int delete(String rrno);
	
	public int update(R_ReplyVO vo);
	
	public int totalCnt(int bno);
}
