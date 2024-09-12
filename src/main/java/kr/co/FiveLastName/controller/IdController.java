package kr.co.FiveLastName.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jdk.jfr.TransitionTo;
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
		
//		System.out.println("list"+id_list);
		mav.addObject("id_list", id_list);
		mav.setViewName("/incomingDeadline/idList");
		
		return mav;
	}
	
	@GetMapping(value = "/insertForm")
	public ModelAndView insertForm(@RequestParam("ri_id") int ri_id, Model model) {
		ModelAndView mav = new ModelAndView();
		
		ReceivingInspectionDTO riDTO = riService.ri_selectOne(ri_id);
		
		model.addAttribute("insertForm", riDTO);
		mav.setViewName("/incomingDeadline/idInsertForm");
		
		return mav;
	}
	
	@Transactional
	@PostMapping(value = "/insert")
	public String id_insert(@ModelAttribute IncomingDeadlineDTO idDTO) throws Exception {
	    System.out.println("1" + idDTO);
	    idService.id_insert(idDTO);
	    
	    System.out.println("2");
	    String id_code = idDTO.getId_code();
	    System.out.println("3");
	    
	    riService.ri_delete(idDTO.getRi_id());
	    System.out.println("4");
	    System.out.println("ri_id 삭제 완료: " + idDTO.getRi_id());
	    
//	    IncomingDeadlineDTO id = idService.id_selectOne(id_code);
	    
	    
//	    if (id == null) {
//	        return "errorpage"; // 에러 페이지로 이동
//	    }
//	    
	    // 리다이렉트 URL에 파라미터를 추가하고 싶다면, URL에 쿼리 파라미터를 추가할 수 있습니다.
	    // return "redirect:/receivingInspection/riList?id_code=" + id_code;

	    return "redirect:/receivingInspection/list";
	}
	
	
	
	
	
	
	
}
