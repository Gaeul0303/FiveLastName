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
	public ModelAndView print(String id_code) {
		ModelAndView mav = new ModelAndView();
		
		
		
		List<TransactionStatementDTO> ts_list = tsService.ts_selectList(id_code);
		
		if(!ts_list.isEmpty()) {
			TransactionStatementDTO tsDTO = ts_list.get(0);
			mav.addObject("pa_name", tsDTO.getPa_name());
			mav.addObject("pa_address", tsDTO.getPa_address());
			mav.addObject("st_name", tsDTO.getSt_name());
			mav.addObject("pa_tel", tsDTO.getPa_tel());
		}
		
		mav.addObject("ts_list", ts_list);
		mav.setViewName("transactionStatement/tsPrint");
		
		return mav;
	}
	
	
}
