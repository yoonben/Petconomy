package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.BoardMapper;
import com.peco.mapper.R_ReplyMapper;
import com.peco.vo.Criteria;
import com.peco.vo.R_ReplyVO;

@Service
public class R_ReplyServiceImpl implements R_ReplyService {

	@Autowired
	R_ReplyMapper mapper;
	
	@Autowired
	BoardMapper boardmapper;

	@Override
	public List<R_ReplyVO> getList(int rno) {
		
		return mapper.getList(rno);
	}

	@Override
	public int insert(R_ReplyVO r_reply) {
		return mapper.insert(r_reply);
	}

	@Override
	public int update(R_ReplyVO r_reply) {
		return mapper.update(r_reply);
	}

	@Override
	public int delete(int rrno) {
		return mapper.delete(rrno);
	}

	@Override
	public int totalCnt(int bno) {
		return mapper.totalCnt(bno);
	}

	@Override
	public R_ReplyVO getOne(String rrno) {
		return mapper.getOne(rrno);
	}
	



}
