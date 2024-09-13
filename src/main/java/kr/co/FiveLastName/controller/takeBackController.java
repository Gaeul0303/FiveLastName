package kr.co.FiveLastName.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.TakeBackDTO;
import kr.co.FiveLastName.service.TakeBackService;

@RequestMapping("/takeBack/*")
@Controller
public class takeBackController {
	private static final Logger logger = LoggerFactory.getLogger(takeBackController.class);
	
	@Inject
	TakeBackService tbService;
	
	@GetMapping(value = "/list")
	public ModelAndView tb_list() {
		ModelAndView mav = new ModelAndView();
		
		List<TakeBackDTO> tb_list = tbService.tb_list();
		
		mav.addObject("tb_list", tb_list);
		mav.setViewName("/takeBack/takeBackList");
		
		return mav;
	}
	
//	@GetMapping(valu = "/updateForm")
//	public ModelAndView updateForm(@RequestParam("ri_id") int ri_id) {
//		
//	}
		
	
}
