package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import com.peco.vo.Criteria;
import com.peco.vo.BoardVO;

public interface BoardMapper {
	
	
	public List<BoardVO> getMain();
	
	public List<BoardVO> getBest();
	
	public List<BoardVO> getFreeBest();
	
	public List<BoardVO> getHealingBest();
	
	public List<BoardVO> getFree(Criteria cri);
	
	public List<BoardVO> getHealing(Criteria cri);
	
	public List<BoardVO> getSearch(Criteria cri);
	
	public BoardVO selectOne(@Param(value="bno") int bno);
	
	public int insertSelectKey(BoardVO boardvo);
	
	public int delete(int bno);
	
	public int edit(BoardVO boardvo);
	
	public int getTotalCnt(Criteria cri);
	
	public int getFreeTotalCnt(Criteria cri);
	
	public int getHealingTotalCnt(Criteria cri);
	
	public int getLike(@Param("bno") int bno);
	
	public int likeCnt(int bno);
	
	public int visitCnt(int bno);
	
	public int updateReplyCnt(@Param("bno") int bno,@Param("amount") int amount);
	
	public List<BoardVO> selectMyBoard(String m_id);
	
	public void deleteBno(String bno);

}
