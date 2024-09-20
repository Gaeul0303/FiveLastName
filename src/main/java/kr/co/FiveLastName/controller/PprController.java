package kr.co.FiveLastName.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.FiveLastName.domain.ContractDTO;
import kr.co.FiveLastName.domain.ProcurementPlanRegistrationDTO;
import kr.co.FiveLastName.service.ContractService;
import kr.co.FiveLastName.service.PprService;
@RequestMapping("/procurementPlanRegistration/*")


@Controller
public class PprController {
	private static final Logger logger = LoggerFactory.getLogger(PprController.class);
	
	@Inject
	private PprService pprService;
	@Inject
	private ContractService cService;
	
	//조달 계획 등록 목차
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public ModelAndView ppr_selectAll() {
		logger.info("pprlist get");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ppr/list");
		mav.addObject("list", pprService.ppr_selectAll());
		mav.addObject("colist", cService.list());
		
		return mav;
		
	}
	
	//계약 성립건 조달 계획 등록 화면 페이지
	@GetMapping(value="/insertForm")
	public ModelAndView ppr_insert(Model model) {
		logger.info("insert get");
		
		cService.list();
		
		ModelAndView mav = new ModelAndView();
		
		model.addAttribute("list", cService.list());
		mav.setViewName("ppr/insertForm");
		return mav;
	}
	
	//계획 등록
	@PostMapping(value="/insertForm")
	public String insert(ProcurementPlanRegistrationDTO dto, RedirectAttributes rttr) {
		logger.info("insert : " + dto);
		
		pprService.ppr_insert(dto);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		
		return "redirect:/procurementPlanRegistration/list";
		
	}
	
	@RequestMapping(value ="/data/{co_id}", method = RequestMethod.GET)
	public ResponseEntity<ContractDTO> list(@PathVariable("co_id") int co_id){
		ResponseEntity<ContractDTO> entity = null;
		try {			
			entity = new ResponseEntity<>(cService.coOne(co_id), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			// TODO: handle exception
		}
		return entity;
	}
	
	//등록된 계획 상세보기
	@GetMapping(value="/detail")
	public ModelAndView ppr_detail(Model model, @RequestParam("ppr_id") int ppr_id) {
		logger.info("detail get");
		
		ProcurementPlanRegistrationDTO ppr = pprService.ppr_selectOne(ppr_id);
		
		ModelAndView mav = new ModelAndView();
		
		model.addAttribute("ppr", ppr);
		mav.setViewName("ppr/detail");
		
		return mav;
		
	}
	
	//조달 계획 등록 테이블 수정하기
	@GetMapping(value="/update")
	public ModelAndView updateForm(@RequestParam("ppr_id") int ppr_id, Model model) {
		ModelAndView mav = new ModelAndView();
		
		model.addAttribute("ppr", pprService.ppr_selectOne(ppr_id));
		mav.setViewName("ppr/update");
		
		return mav;
	}

	//조달 계획 등록 테이블 수정 업데이트
	@PostMapping(value="update")
	public String updatePOST(ProcurementPlanRegistrationDTO dto,RedirectAttributes rttr) {
		
		pprService.ppr_update(dto);
		
		rttr.addFlashAttribute("msg", "SUCCESS");		
		return "redirect:/procurementPlanRegistration/list";
		
	}
}
