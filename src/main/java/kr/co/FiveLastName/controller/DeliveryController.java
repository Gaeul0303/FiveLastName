package kr.co.FiveLastName.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.DeliveryDTO;
import kr.co.FiveLastName.service.DeliveryService;


@Controller
public class DeliveryController {
	
	private static final Logger logger = LoggerFactory.getLogger(DeliveryController.class);
	
	@Autowired
	DeliveryService service;
	
	@GetMapping(value = "/inventoryList")
	public ModelAndView inventoryList() {
		ModelAndView mav = new ModelAndView();
		
		List<DeliveryDTO> inventoryList = service.inventoryList();
		
		mav.addObject("inventoryList", inventoryList);
		mav.setViewName("/delivery/inventoryList");
		return mav;
	}
	
	@GetMapping(value = "/idmReport")
	public ModelAndView idmReport() {
		ModelAndView mav = new ModelAndView();
		
		List<DeliveryDTO> idmReport = service.inventoryList();
		
		mav.addObject("idmReport", idmReport);
		mav.setViewName("/delivery/idmReport");
		return mav;
	}
	
	@GetMapping(value = "/selectInventory")
	public ModelAndView inventorySelect(@RequestParam("in_id") int in_id) {
		
		      ModelAndView mav = new ModelAndView();
		      
		      DeliveryDTO inventorySelect = service.inventorySelect(in_id);
		      
		      mav.addObject("inv", inventorySelect);
		      mav.addObject("in_id", in_id);
		      mav.setViewName("/delivery/selectInventory");
		      
		      return mav;
		      
		   }
	
	@PostMapping(value = "/selectInventory")
	public ModelAndView idmInsert(@ModelAttribute("dto") DeliveryDTO dto ) {
	    ModelAndView mav = new ModelAndView();
	    
	    service.idmInsert(dto);
	    service.inventoryUpdate(dto);
	    		
	    mav.setViewName("redirect:/selectInventory?in_id=" + dto.getIn_id()); 
	    return mav;
	}

    @GetMapping(value = "/idmReportList")
    public ModelAndView   idmReportList() {
		      ModelAndView mav = new ModelAndView();
		      
		      List<DeliveryDTO> idmReportList = service.idmReportList();
		      
		      mav.addObject("idmReportList", idmReportList);
		      
		      mav.setViewName("/delivery/idmReportList");
		      return mav;
		   }

    @GetMapping(value = "/selectIdm")
	public ModelAndView selectIdm(@RequestParam("in_id") int in_id) {

		      ModelAndView mav = new ModelAndView();

		      List<DeliveryDTO> selectIdm = service.selectIdm(in_id);

		      mav.addObject("selectIdm", selectIdm);
		      mav.addObject("in_id", in_id);
		      mav.setViewName("/delivery/selectIdm");

		      return mav;

		   }
	
    @GetMapping("/barChart")
    @ResponseBody
    public List<Map<String, Object>> getItemWiseReport() {
        // 전체 출고 데이터 가져오기
        List<DeliveryDTO> deliveryList = service.idmReportList();

        // 품목별 출고 수량 집계
        Map<String, Integer> itemTotals = deliveryList.stream()
            .filter(dto -> dto.getPr_name() != null) // 품목 이름이 null이 아닌 경우만 필터링
            .collect(Collectors.groupingBy(
                DeliveryDTO::getPr_name, // 품목 이름 기준으로 그룹화
                Collectors.summingInt(DeliveryDTO::getIdm_quantity) // 출고 수량 합계 계산
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
    
    @RequestMapping(value = "chartJang", method = RequestMethod.GET)
	public String barChart(Locale locale, Model model) {
		
		
		return "chartJang";
	}
}
