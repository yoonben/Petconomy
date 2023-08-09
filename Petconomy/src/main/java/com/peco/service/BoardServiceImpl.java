package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.peco.vo.Criteria;
import com.peco.vo.PageDto;
import com.peco.service.FileuploadService;
import com.peco.vo.FileuploadVO;
import com.peco.mapper.BoardMapper;
import com.peco.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private FileuploadService service;

	
	
	@Override
	public List<BoardVO> getMain() {

		return mapper.getMain();

	}

	@Override
	public List<BoardVO> getBest() {
		
		return mapper.getBest();
	}
	
	@Override
	public List<BoardVO> getFreeBest() {

		return mapper.getFreeBest();
	}

	@Override
	public List<BoardVO> getHealingBest() {

		return mapper.getHealingBest();
	}

	@Override
	public BoardVO selectOne(int bno) {
		//조회수 증가
		mapper.visitCnt(bno);
		
		return mapper.selectOne(bno);
	}

	@Override
	public List<BoardVO> getFree(Criteria cri,Model model) {
		/*
		 * 1.리스트 조회
		 * 		-검색어,페이지 정보(startNo~endNo까지 조회)
		 * 2.총건수 조회
		 * 3.pageDto 객체 생성
		 */
		List<BoardVO> list = mapper.getFree(cri);
		int totalCnt = mapper.getFreeTotalCnt(cri);
		
		PageDto pageDto = new PageDto(cri,totalCnt);
		
		model.addAttribute("list",list);
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("pageDto",pageDto);
		
		return list;
	}

	@Override
	public List<BoardVO> getHealing(Criteria cri,Model model) {
		/*
		 * 1.리스트 조회
		 * 		-검색어,페이지 정보(startNo~endNo까지 조회)
		 * 2.총건수 조회
		 * 3.pageDto 객체 생성
		 */
		List<BoardVO> list = mapper.getHealing(cri);
		int totalCnt = mapper.getHealingTotalCnt(cri);
		
		PageDto pageDto = new PageDto(cri,totalCnt);
		
		model.addAttribute("list",list);
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("pageDto",pageDto);
		
		return list;
	}
	
	@Override
	public List<BoardVO> getSearch(Criteria cri,Model model) {
		/*
		 * 1.리스트 조회
		 * 		-검색어,페이지 정보(startNo~endNo까지 조회)
		 * 2.총건수 조회
		 * 3.pageDto 객체 생성
		 */
		List<BoardVO> list = mapper.getSearch(cri);
		int totalCnt = mapper.getTotalCnt(cri);
		
		PageDto pageDto = new PageDto(cri,totalCnt);
		
		model.addAttribute("list",list);
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("pageDto",pageDto);
		

		return list;
	}


	@Override
	public int delete(int bno) {
	//게시물을 삭제시 첨부된 파일이 있는 경우 오류가 발생
			//첨부파일을 모두 삭제해야함 (또는 DB테이블 제약조건의 옵션을 변경해도된다.)

			//첨부파일 리스트 조회 - fileuploadService
			List<FileuploadVO> list = service.getList(bno);
			int res = 0 ;
			for(FileuploadVO vo : list) {
				//리스트 돌면서 삭제 처리 - fileuploadService
				res += service.delete(bno, vo.getUuid());
				
			}
			
			/* 2.댓글 리스트 삭제 추가해야함 */
			//replyMapper.deleteReplyList(bno);
			
			//3.게시글 삭제
			return mapper.delete(bno);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertSelectKey(BoardVO boardvo,List<MultipartFile> files ) throws Exception {

		
		//게시물 등록
		int res = mapper.insertSelectKey(boardvo);
		
		//파일 첨부
		service.fileupload(files,boardvo.getBno());
		
		
		return res;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int edit(BoardVO boardvo, List<MultipartFile> files) throws Exception {
		
		int res = mapper.edit(boardvo);
		
		//service.fileupload(files, boardvo.getBno());
		
		return res;
	
	}
	
	@Override
	public int getTotalCnt(Criteria cri) {
		return  mapper.getTotalCnt(cri);
		
	}

	@Override
	public int getFreeTotalCnt(Criteria cri) {
		
		return mapper.getFreeTotalCnt(cri);
	}
	
	@Override
	public int getHealingTotalCnt(Criteria cri) {
		
		return mapper.getHealingTotalCnt(cri);
	}
	
	@Override
	public int getLike(int bno) {
		
		mapper.likeCnt(bno);
		System.out.println("좋아요 +1");
		return mapper.getLike(bno);
	}	

	@Override
	public int likeCnt(int bno) {
		
		
		
		return mapper.likeCnt(bno);
	}

	@Override
	public int visitCnt(int bno) {
	
		return mapper.visitCnt(bno);
	}

	









	

}
