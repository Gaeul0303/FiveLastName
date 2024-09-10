package kr.co.FiveLastName.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.IncomingDeadlineDTO;
import kr.co.FiveLastName.service.IncomingDeadlineService;

@RequestMapping("/incomingDeadline/*")
@Controller
public class IdController {

	private static final Logger logger = LoggerFactory.getLogger(IdController.class);
	
	@Inject
	IncomingDeadlineService idService;
	
	@GetMapping(value = "/list")
	public ModelAndView id_list() {
		ModelAndView mav = new ModelAndView();
		
		List<IncomingDeadlineDTO> id_list = idService.id_list();
		
		mav.addObject("id_list", id_list);
		mav.setViewName("/incomingDeadline/idList");
		
		return mav;
	}
	
}
