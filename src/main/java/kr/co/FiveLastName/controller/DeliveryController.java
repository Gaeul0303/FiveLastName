package kr.co.FiveLastName.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.InventoryDTO;
import kr.co.FiveLastName.domain.InventoryDeliveryManagementDTO;
import kr.co.FiveLastName.service.DeliveryService;


@Controller
public class DeliveryController {
	
	private static final Logger logger = LoggerFactory.getLogger(DeliveryController.class);
	
	@Autowired
	DeliveryService service;
	
	@GetMapping(value = "/inventoryList")
	public ModelAndView inventoryList() {
		ModelAndView mav = new ModelAndView();
		
		List<InventoryDTO> inventoryList = service.inventoryList();
		
		mav.addObject("inventoryList", inventoryList);
		
		for(int i = 0; i<inventoryList.size(); i++) {
			System.out.println(inventoryList.get(i));
		}
		
		mav.setViewName("/delivery/inventoryList");
		return mav;
	}
	
	@GetMapping(value = "/selectList")
	public ModelAndView inventorySelectList(int in_id) {
		ModelAndView mav = new ModelAndView();
		
		InventoryDTO inventorySelectList = service.inventorySelectList(in_id);
		
		mav.addObject("inventorySelectList", inventorySelectList);
		mav.setViewName("/selectList");
		
		return mav;
		
	}
	
	@GetMapping(value = "/idmReportList")
	public ModelAndView	idmReportList() {
		ModelAndView mav = new ModelAndView();
		
		List<InventoryDeliveryManagementDTO> idmReportList = service.idmReportList();
		
		mav.addObject("idmReportList", idmReportList);
		
		mav.setViewName("/delivery/idmReportList");
		return mav;
	}
	
}
