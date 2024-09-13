package kr.co.FiveLastName.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.TransactionStatementDTO;
import kr.co.FiveLastName.service.TransactionStatementService;

@RequestMapping("/TransactionStatement/*")
@Controller
public class TsController {
	
	@Inject
	private TransactionStatementService tsService;
	
	@GetMapping(value = "/print-page")
	public ModelAndView  {
		ModelAndView mav = new ModelAndView();
		
		List<TransactionStatementDTO> ts_list = tsService.ts_list();
		
		mav.addObject("ts_list", ts_list);
		
		return mav;
	}
	
	
}
