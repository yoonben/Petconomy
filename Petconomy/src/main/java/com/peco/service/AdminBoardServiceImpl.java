package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.peco.mapper.AdminBoardMapper;
import com.peco.vo.BoardVO;
import com.peco.vo.Criteria;
import com.peco.vo.PageDto;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	
	@Autowired
	private AdminBoardMapper mapper;

	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		return mapper.getList(cri);
	}

	@Override
	public int delete(int bno) {
		
		return mapper.delete(bno);
	}

	@Override
	public int getTotalCnt() {
		
		return  mapper.getTotalCnt();
	}

}
