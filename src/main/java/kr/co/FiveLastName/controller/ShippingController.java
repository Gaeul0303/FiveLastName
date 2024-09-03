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

import kr.co.FiveLastName.service.PurchaseOrderService;
import kr.co.FiveLastName.service.ShippingStatusService;

@Controller
public class ShippingController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShippingController.class);
	
	@Inject
	ShippingStatusService service;
	
	@RequestMapping(value = "/selectAllShippingStatus", method = RequestMethod.GET)
	public ModelAndView selectAllShippingStatus() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/shippingStatus/shippingStatusList");
		mav.addObject("ssList", service.selectAllShippingStatus());
		
		return mav;
	}
	
	@RequestMapping(value = "/selectShippingStatus", method = RequestMethod.GET)
	public ModelAndView selectShippingStatus(int ss_id) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/shippingStatus/shippingStatusSelect");
		mav.addObject("ss", service.selectShippingStatus(ss_id));
		
		return mav;
		
	}
	
}
