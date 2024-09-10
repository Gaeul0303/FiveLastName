package kr.co.FiveLastName.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.ProcurmentPlanDTO;
import kr.co.FiveLastName.service.PpService;
import kr.co.FiveLastName.service.ProductService;
@RequestMapping("/procurmentPlan/*")

@Controller
public class PpController {
	private static final Logger logger = LoggerFactory.getLogger(PpController.class);	
	
	@Inject
	private PpService ppService;
	@Inject
	private ProductService pService;
	
	//계획 둥록 화면 페이지
	@GetMapping(value="/insertForm")
	public ModelAndView pp_insert(Model model) {
		logger.info("insert get");
		
		pService.list();
		
		
		ModelAndView mav = new ModelAndView();
		
		model.addAttribute("list",pService.list());
		mav.setViewName("/insertForm");	
		return mav;			
	}
	
	//계획 등록
	@PostMapping(value="/insertForm")
	public String insert(ProcurmentPlanDTO dto) {
		logger.info("insert : " + dto);	
		
		ppService.pp_selectAll();
		
		return "redirect:/procurmentPlan/list";
		
	}
	
	
	//등록된 계획 목차
	@RequestMapping(value="procurmentPlan/list")
	public ModelAndView pp_selectAll() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("procurmentPlan/list");
		mav.addObject("list", ppService.pp_selectAll());
		mav.addObject("prlist", pService.list());
		return mav;
	}

	//등록된 계획 상세보기
	@GetMapping(value="/information")
	public ModelAndView pp_detail(Model model,@RequestParam("pp_id") int pp_id) {
		logger.info("information get");
		
		ProcurmentPlanDTO procurmentPlan = ppService.pp_selectOne(pp_id);
		
		ModelAndView mav = new ModelAndView();
		
		model.addAttribute("procurmentPlan",procurmentPlan);
		mav.setViewName("procurmentPlan/information");	
		return mav;			
	}
	
	//등록된 계획 수정하는 페이지
	@GetMapping(value="/updateForm")
	public ModelAndView updateForm(@RequestParam("pp_id") int pp_id, Model Model) {
		ModelAndView mav = new ModelAndView();
		
		Model.addAttribute("emp", ppService.pp_selectOne(pp_id));
		mav.setViewName("procurmentPlan/updateForm");
		
		return mav;
	}
	
}
