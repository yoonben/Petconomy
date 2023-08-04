package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peco.vo.PensionVO;



@Service
public interface PensionService {

	public List<PensionVO> mapList();
}
