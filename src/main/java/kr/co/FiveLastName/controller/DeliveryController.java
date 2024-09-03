package kr.co.FiveLastName.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	public ModelAndView inventorySelectList(int in_id) {
		      ModelAndView mav = new ModelAndView();
		      
		      DeliveryDTO inventorySelectList = service.inventorySelectList(in_id);
		      
		      mav.addObject("inv", inventorySelectList);
		      mav.setViewName("/delivery/selectInventory");
		      
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
	
}
