package kr.co.FiveLastName.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		System.out.println("idList : "+id_list);
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
	
	@PostMapping(value = "/insert")
	public String id_insert(@ModelAttribute IncomingDeadlineDTO idDTO) throws Exception {
	    System.out.println(idDTO);
	    idService.id_insert(idDTO);
	    
	    System.out.println("insert : "+idDTO);
	    
	    riService.ri_delete(idDTO.getRi_id());
	    System.out.println("ri_id 삭제 완료: " + idDTO.getRi_id());
	    
	    return "redirect:/receivingInspection/list";
	}
	
	@GetMapping("/chartLine")
    @ResponseBody   
    public List<Map<String, Object>> getIdWiseReport() {
        // 전체 출고 데이터 가져오기
        List<IncomingDeadlineDTO> idList = idService.id_list();

        // 품목별 출고 수량 집계
        Map<String, Integer> itemTotals = idList.stream()
            .filter(dto -> dto.getPr_name() != null) // 품목 이름이 null이 아닌 경우만 필터링
            .collect(Collectors.groupingBy(
                IncomingDeadlineDTO::getPr_name, // 품목 이름 기준으로 그룹화
                Collectors.summingInt(IncomingDeadlineDTO::getId_genuineNum) // 출고 수량 합계 계산
            ));

        // 품목별 데이터를 정렬 및 변환
        List<Map<String, Object>> result = itemTotals.entrySet().stream()
            .sorted(Map.Entry.comparingByKey()) // 품목별 정렬
            .map(entry -> {
                Map<String, Object> map = new HashMap<>();
                map.put("item", entry.getKey()); // 품목 이름
                map.put("total_quantity", entry.getValue()); // 총 출고 수량
                return map;
            })
            .collect(Collectors.toList());

        return result;
    }
    
    @RequestMapping(value = "incomingChart", method = RequestMethod.GET)
   public String chartHM(Locale locale, Model model) {
      
      
      return "chartIncoming";
   }
	
	
	
	
	
}
