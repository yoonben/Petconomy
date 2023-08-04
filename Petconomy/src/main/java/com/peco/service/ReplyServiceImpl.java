package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.BoardMapper;
import com.peco.mapper.ReplyMapper;
import com.peco.vo.Criteria;
import com.peco.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper mapper;
	
	@Autowired
	BoardMapper boardmapper;
	
	@Override
	public List<ReplyVO> getList(int bno, Criteria cri) {
		
		return mapper.getList(bno, cri);
	}

	@Override
	public int insert(ReplyVO vo) {
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
	public int update(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int totalCnt(int bno) {
		return mapper.totalCnt(bno);
	}


}
