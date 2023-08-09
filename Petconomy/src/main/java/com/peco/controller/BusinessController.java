package com.peco.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peco.service.BusinessService;
import com.peco.vo.PensionRoomVO;
import com.peco.vo.PensionVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/peco/*")
@Log4j
public class BusinessController extends CommonRestController{
	
	@Autowired
	BusinessService service;
	
	@GetMapping("/business")
	public String login() {
		return "business";
	}
	
	@PostMapping("/pensionInsert")
	public @ResponseBody Map<String, Object> pensionInsert(@RequestBody Map<String, Object> map, Model model) {
		
		
		try {
			System.out.println(map);
			
			PensionVO pension = new PensionVO();
			
			PensionRoomVO pensionroom = new PensionRoomVO();
			
			pension.setM_id((String) map.get("m_id"));
			pension.setPname((String) map.get("pname"));
			pension.setAddr((String) map.get("addr"));
			pension.setOpenhour((String) map.get("openhour"));
			pension.setParkyn((String) map.get("parkyn"));
			
			System.out.println(pension);
			
			List<String> roomnames = (List<String>) map.get("romnames");

			List<String> prices = (List<String>) map.get("prices");

			int res = service.pensionInsert(pension);
			
			if(res > 0) {
			res = 0;	
			
			pension = service.pensionGetOne(pension);
			
			map.put("p_id", pension.getP_id());
			
			for (int i = 0; i < roomnames.size(); i++) {
				pensionroom.setP_id(pension.getP_id());
				
				int priceValue = Integer.parseInt(prices.get(i));
				pensionroom.setPrice(priceValue);
				
				pensionroom.setRoom_no(String.valueOf(i));
				
				pensionroom.setRoomname(roomnames.get(i));
				
				res += service.pensionRoomInsert(pensionroom);
			}
			
				if(res>0) {
					map = responseWriteMap(res);
					
					map.put("p_id", pension.getP_id());
					System.out.println(pension.getP_id()+"=============================pension.getP_id()==================================");
					return map;
				}else {
					
					return responseMap(REST_FAIL, "등록중 예외사항이 발생 하였습니다.");
				}
			
			}else {
				return responseMap(REST_FAIL, "등록중 예외사항이 발생 하였습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "등록중 예외사항이 발생 하였습니다.");
		}
	}

}

//	@PostMapping("/pensionInsert")
//	public @ResponseBody Map<String, Object> pensionRoomInsert(@RequestBody PensionRoomVO pensionroom, Model model) {
//		
//		
//		try {
//	
//			int res = service.pensionInsert(pension);
//			
//			pension = service.pensionGetOne(pension);
//			
//			Map<String, Object> map = responseWriteMap(res);
//			
//			map.put("p_id", pension.getP_id());
//			
//			return map;
//	
//		} catch (Exception e) {
//			e.printStackTrace();
//			return responseMap(REST_FAIL, "등록중 예외사항이 발생 하였습니다.");
//		}
//	}
//	
//	}
