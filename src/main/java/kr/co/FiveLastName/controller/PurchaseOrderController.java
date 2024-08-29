package kr.co.FiveLastName.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.PurchaseOrderDTO;
import kr.co.FiveLastName.persistence.PurchaseOrderDAO;
import kr.co.FiveLastName.service.PurchaseOrderService;


@Controller
public class PurchaseOrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseOrderController.class);
	
	
	@Inject
	PurchaseOrderService service;
	
	@RequestMapping(value = "/purchaseOrderList", method = RequestMethod.GET)
	public ModelAndView poAllSelect() {
		
		ModelAndView mav = new ModelAndView();
		
		List<PurchaseOrderDTO> poList = service.poAllSelect();
		
		mav.setViewName("/purchaseOrder/purchaseOrderList");
		
		mav.addObject("poList", poList);
		
		return mav;
	}
	
	@RequestMapping(value = "/purchaseOrderSelect", method = RequestMethod.GET)
	public ModelAndView poSelect(int po_id) {
		
		ModelAndView mav = new ModelAndView();
		
		PurchaseOrderDTO po = service.poSelect(po_id);
		
		mav.setViewName("/purchaseOrder/purchaseOrderSelect");
		
		mav.addObject("po", po);
		
		System.out.println(po);

		
		return mav;
	}
	
	@RequestMapping(value = "/purchaseOrderPrint", method = RequestMethod.GET)
	public ModelAndView poPrint(int po_id) {
		
		ModelAndView mav = new ModelAndView();
		
		PurchaseOrderDTO po = service.poSelect(po_id);
		
		mav.setViewName("/purchaseOrder/purchaseOrder");
		
		mav.addObject("po", po);
		
		System.out.println(po);

		
		return mav;
	}
	
}
