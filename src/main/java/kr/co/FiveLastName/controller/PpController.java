package kr.co.FiveLastName.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.RedirectAttributesMethodArgumentResolver;

import kr.co.FiveLastName.domain.ProcurmentPlanDTO;
import kr.co.FiveLastName.service.PpService;
import kr.co.FiveLastName.service.ProductService;

@Controller
public class PpController {
	private static final Logger logger = LoggerFactory.getLogger(PpController.class);	
	
	@Inject
	private PpService ppService;
	@Inject
	private ProductService pService;
	
	//계획 둥록 화면 페이지
	@GetMapping(value="procurmentPlan/insertForm")
	public ModelAndView pp_insert(Model model) {
		logger.info("insert get");
		
		pService.list();
		
		
		ModelAndView mav = new ModelAndView();
		
		model.addAttribute("list",pService.list());
		mav.setViewName("procurmentPlan/insertForm");	
		return mav;			
	}
	
	//계획 등록
	@PostMapping(value="procurmentPlan/insertForm")
	public String insert(ProcurmentPlanDTO dto) {
		logger.info("insert : " + dto);
		
		ppService.pp_insert(dto);
		
		return "redirect:/procurmentPlan/list";
		
	}
	
	//계획 등록 모델엔뷰버전
//	@PostMapping(value="procurmentPlan/insertForm")
//	public ModelAndView insertForm() {
//		logger.info("insert : " + insertForm());
//		ModelAndView mav = new ModelAndView();
//		
//		mav.setViewName("procurmentPlan/insertForm");
//		mav.addObject("insertForm", ppService.pp_insert(null))
//		
//		
//		return "redirect:/procurmentPlan/list";
//		
//	}
	
	//등록된 계획 목차
	@RequestMapping(value="procurmentPlan/list")
	public ModelAndView pp_selectAll() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("procurmentPlan/list");
		mav.addObject("list", ppService.pp_selectAll());
		mav.addObject("prlist", pService.list());
		return mav;
	}

}
