package com.peco.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.peco.vo.Criteria;
import com.peco.vo.BoardVO;

@Service
public interface BoardService {
	
	public List<BoardVO> getMain();
	
	public List<BoardVO> getBest();
	
	public List<BoardVO> getFree(Criteria cri, Model model);
	
	public List<BoardVO> getHealing(Criteria cri, Model model);
	
	public List<BoardVO> getSearch(Criteria cri, Model model);
	
	public BoardVO selectOne(int bno);
	
	public int insertSelectKey(BoardVO boardvo, List<MultipartFile> files )throws Exception ;
	
	public int edit(BoardVO boardvo, List<MultipartFile> files) throws Exception;
	
	public int getTotalCnt(Criteria cri);
	
	public int getFreeTotalCnt(Criteria cri);
	
	public int getHealingTotalCnt(Criteria cri);
	
	public int delete(int bno);
	
	public int getLike(int bno);
	
	public int likeCnt(int bno);

}
