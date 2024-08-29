package kr.co.FiveLastName.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.ShippingStatementDTO;
import kr.co.FiveLastName.service.ShippingStatementService;

@Controller
public class shController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private ShippingStatementService service;
	
	@GetMapping(value = "/shList")
	public ModelAndView sh_List() {
		ModelAndView mav = new ModelAndView();
		
		List<ShippingStatementDTO> sh_List = service.sh_List();
		
		mav.addObject("sh_List", sh_List);
		mav.setViewName("ShippingStatement");
		
		return mav;
		
	}
}
