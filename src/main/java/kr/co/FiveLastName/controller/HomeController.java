package kr.co.FiveLastName.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.DeliveryDTO;
import kr.co.FiveLastName.domain.ProductDTO;
import kr.co.FiveLastName.domain.ProgressInspectionDTO;
import kr.co.FiveLastName.service.DeliveryService;
import kr.co.FiveLastName.service.ProgressInspectionService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	ProgressInspectionService service;
	@Autowired
	DeliveryService deservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@GetMapping("/barChart")
    @ResponseBody
    public List<Map<String, Object>> getItemWiseReport() {
        // 전체 출고 데이터 가져오기
        List<DeliveryDTO> deliveryList = deservice.idmReportList();

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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
List<ProgressInspectionDTO>pi = service.piAllSelect();
		
		model.addAttribute("pi", pi);
		for(int i = 0; i<pi.size();i++) {
		System.out.println(i+".pi = " + pi.get(i));
		};
	
		
		return "index";
	}
	
	
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public String accessDenied(Locale locale, Model model) {
		
		
		return "accessDenied";
	}
	@RequestMapping(value = "chart", method = RequestMethod.GET)
	public String chart(Locale locale, Model model) {
		
		
		return "chart";
	}
	@RequestMapping(value = "dataTables", method = RequestMethod.GET)
	public String dataTables(Locale locale, Model model) {
		
		
		return "dataTables";
	}
	
	@RequestMapping(value = "form", method = RequestMethod.GET)
	public String form(Locale locale, Model model) {
		
		
		return "form";
	}
	@RequestMapping(value = "calendar", method = RequestMethod.GET)
	public String calendar(Locale locale, Model model) {
		
		
		return "calendar";
	}
	@RequestMapping(value = "shm", method = RequestMethod.GET)
	public void shm(Locale locale,ModelAndView mav) throws Exception {
		
		mav.setViewName("shm");
		
	}
	@RequestMapping(value = "shm2", method = RequestMethod.GET)
	public void shm2(Locale locale,ModelAndView mav) throws Exception {
		
		mav.setViewName("shm2");
		
	}
	 
	
	
}
