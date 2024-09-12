package kr.co.FiveLastName.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.service.TransactionStatementService;

@RequestMapping("/TransactionStatement/*")
@Controller
public class TsController {
	
	@Inject
	private TransactionStatementService tsService;
	
	@GetMapping(value = "/print-page")
	public ModelAndView tsPrint(int ts_num) {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	
}
