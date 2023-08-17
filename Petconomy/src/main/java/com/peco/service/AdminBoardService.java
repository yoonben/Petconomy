package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.peco.vo.BoardVO;
import com.peco.vo.Criteria;

@Service
public interface AdminBoardService {
	
	public List<BoardVO> getList(Criteria cri);
	
	public int delete(int bno);
	
	public int getTotalCnt();

}
