package kr.co.FiveLastName.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.StaffDTO;
import kr.co.FiveLastName.service.PurchaseOrderService;
import javax.servlet.http.HttpSession;

@RequestMapping("/purchaseOrder/*")
@Controller
public class PurchaseOrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseOrderController.class);
	
	
	@Inject
	PurchaseOrderService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView poAllSelect() {
		
		ModelAndView mav = new ModelAndView();
		
		List<PrintPODTO> poList = service.poAllSelect();
		
		mav.setViewName("/purchaseOrder/purchaseOrderList");
		
		mav.addObject("poList", poList);
		
		return mav;
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public ModelAndView poSelect(int po_id /* , HttpSession session */) {
		
		ModelAndView mav = new ModelAndView();
		
		PrintPODTO po = service.poSelect(po_id);

		//StaffDTO staff = (StaffDTO)session.getAttribute("staff");// staff를 세션값주는걸로변경 
		
		mav.setViewName("/purchaseOrder/purchaseOrderSelect");
		
		mav.addObject("po", po);
		
		return mav;
	}
	
	@RequestMapping(value = "/print", method = RequestMethod.GET)
	public ModelAndView poPrint(int po_id /* , HttpSession session */) {
		
		ModelAndView mav = new ModelAndView();
		
		PrintPODTO po = service.poSelect(po_id);
		
		//StaffDTO staff = (StaffDTO)session.getAttribute("staff");// staff를 세션값주는걸로변경 
		
		mav.setViewName("/purchaseOrder/purchaseOrder");
		
		mav.addObject("po", po);
		
		return mav;
	}
	
}
