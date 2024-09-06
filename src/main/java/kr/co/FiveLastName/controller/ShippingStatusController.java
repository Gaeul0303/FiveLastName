package kr.co.FiveLastName.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.ShippingStatusDTO;
import kr.co.FiveLastName.service.PurchaseOrderService;
import kr.co.FiveLastName.service.ShippingStatusService;
@RequestMapping("/shippingStatus/*")
@Controller
public class ShippingStatusController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShippingStatusController.class);
	
	@Inject
	ShippingStatusService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView ssAllSelect() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/shippingStatus/shippingStatusList");
		mav.addObject("ssList", service.selectAllShippingStatus());
		
		return mav;
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public ModelAndView ssSelect(int ss_id) {
		
		ModelAndView mav = new ModelAndView();
		
		ShippingStatusDTO ss = service.selectShippingStatus(ss_id);
		
		System.out.println(ss);
		
		mav.setViewName("/shippingStatus/shippingStatusSelect");
		mav.addObject("ss", ss);
		
		return mav;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView ssSearch(int po_id) {
		
		ModelAndView mav = new ModelAndView();
		
		ShippingStatusDTO ss = service.search(po_id);
		
		int ss_id = ss.getSs_id();
		
		ss = service.selectShippingStatus(ss_id);
		
		System.out.println(ss);
		
		mav.setViewName("/shippingStatus/shippingStatusSelect");
		mav.addObject("ss", ss);
		
		return mav;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView selectShippingStatus() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/shippingStatus/shippingStatusInsert");
		
		return mav;
		
	}
	
}
