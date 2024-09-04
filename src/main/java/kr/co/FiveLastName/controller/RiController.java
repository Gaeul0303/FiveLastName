package kr.co.FiveLastName.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.ReceivingInspectionDTO;
import kr.co.FiveLastName.persistence.ReceivingInspectionDAO;


@Controller
public class RiController {
	private static final Logger logger = LoggerFactory.getLogger(RiController.class);
	
	@Inject
	ReceivingInspectionDAO riDAO;
	
	@GetMapping(value = "receivingInspectionList")
	public ModelAndView ri_list() {
		ModelAndView mav = new ModelAndView();
		
		return ;
	}
	
	
}
