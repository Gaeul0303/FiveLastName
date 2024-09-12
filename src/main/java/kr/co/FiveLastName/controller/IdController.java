package kr.co.FiveLastName.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.IncomingDeadlineDTO;
import kr.co.FiveLastName.domain.ReceivingInspectionDTO;
import kr.co.FiveLastName.service.IncomingDeadlineService;
import kr.co.FiveLastName.service.ReceivingInspectionService;

@RequestMapping("/incomingDeadline/*")
@Controller
public class IdController {

	private static final Logger logger = LoggerFactory.getLogger(IdController.class);
	
	@Inject
	IncomingDeadlineService idService;
	
	@Inject
	ReceivingInspectionService riService;
	
	@GetMapping(value = "/list")
	public ModelAndView id_list() {
		ModelAndView mav = new ModelAndView();
		
		List<IncomingDeadlineDTO> id_list = idService.id_list();
		
		mav.addObject("id_list", id_list);
		mav.setViewName("/incomingDeadline/idList");
		
		return mav;
	}
	
	@GetMapping(value = "/insertForm")
	public ModelAndView insertForm(@RequestParam("ri_id") int ri_id, Model model) {
		ModelAndView mav = new ModelAndView();
		
		ReceivingInspectionDTO riDTO = riService.ri_selectOne(ri_id);
		
		model.addAttribute("insertForm", riService.ri_selectOne(ri_id));
		mav.setViewName("/incomingDeadline/idInsertForm");
		
		return mav;
	}
	
	@PostMapping(value = "/insert")
	public ModelAndView id_insert(@ModelAttribute IncomingDeadlineDTO idDTO) {
		
		ModelAndView mav = new ModelAndView();
		
		idService.id_insert(idDTO);
		int ri_id = idDTO.getRi_id();
		String id_code = idDTO.getId_code();
		IncomingDeadlineDTO id = idService.id_selectOne(id_code);
		ri_id = id.getRi_id();
		mav.addObject("idDTO", idDTO);
		mav.addObject("id_code", id.getId_code());
		
		mav.setViewName("rediect:/receivingInspection/riList");
		
		return mav;
		
	}
	
	
	
	
	
	
	
}
