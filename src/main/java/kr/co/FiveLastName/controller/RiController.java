package kr.co.FiveLastName.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.ReceivingInspectionDTO;
import kr.co.FiveLastName.service.ReceivingInspectionService;

@RequestMapping("/receiveingInspection/*")
@Controller
public class RiController {
	private static final Logger logger = LoggerFactory.getLogger(RiController.class);
	
	@Inject
	ReceivingInspectionService riService;
	
	@GetMapping(value = "/list")
	public ModelAndView ri_list() {
		logger.info("입고 조회");
		
		ModelAndView mav = new ModelAndView();
		
		List<ReceivingInspectionDTO> ri_list = riService.ri_list();
		
		
		mav.addObject("ri_list", ri_list);
		mav.setViewName("/receivingInspection/riList");
		
		return mav;
	}
	
	@GetMapping(value = "/select")
	public ModelAndView ri_selectOne(int ri_id) {
		ModelAndView mav = new ModelAndView();
		
		ReceivingInspectionDTO riDTO = riService.ri_selectOne(ri_id);
		
		mav.addObject("riDTO", riDTO);
		mav.setViewName("/receivingInspection/riSelect");
		
		return mav;
		
	}
	
	
	
}
