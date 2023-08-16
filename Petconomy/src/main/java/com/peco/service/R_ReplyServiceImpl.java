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
	public List<R_ReplyVO> getList(int rno, Criteria cri) {
		
		return mapper.getList(rno, cri);
	}
	


	@Override
	public int insert(R_ReplyVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int delete(String rno) {

		//댓글 삭제시 Board 테이블의 댓글수를 1감소 시킴
		//*무슨 기능인지 기억 안남
//		ReplyVO vo = mapper.getOne(rno);
//		boardmapper.updateReplyCnt(vo.getBno(), -1);
		
		return mapper.delete(rno);
	}

	@Override
	public int update(R_ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int totalCnt(int bno) {
		return mapper.totalCnt(bno);
	}


}
