package kr.co.FiveLastName.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		      
		      DeliveryDTO inventorySelect = service.inventorySelect(in_id);
		      
		      mav.addObject("inv", inventorySelect);
		      mav.setViewName("/delivery/selectIdm");
		      
		      return mav;
		      
		   }
	
}
