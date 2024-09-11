package kr.co.FiveLastName.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ReceivingInspectionDTO;
import kr.co.FiveLastName.domain.ShippingStatusDTO;
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
	
	@GetMapping(value = "/updateForm")
	public ModelAndView updateForm(@RequestParam("ri_id") int ri_id, Model model) { 
		ModelAndView mav = new ModelAndView();
		
		model.addAttribute("updateform", riService.ri_selectOne(ri_id));
		
		mav.setViewName("/receivingInspection/riUpdateForm");
		
		return mav;
	}
	
	@PostMapping(value = "/update")
	public ModelAndView ri_update(ReceivingInspectionDTO riDTO) {
		int result = riService.ri_update(riDTO);
		
		ModelAndView mav = new ModelAndView();
		if(result<0) {
			mav.setViewName("error");
			return mav;
		}
		
		mav.setViewName("rediect:/receivingInspection/riList");
		
		return mav;
	}
	
	
}
