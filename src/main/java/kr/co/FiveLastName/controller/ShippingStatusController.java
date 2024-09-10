package kr.co.FiveLastName.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ShippingStatusDTO;
import kr.co.FiveLastName.service.PurchaseOrderService;
import kr.co.FiveLastName.service.ShippingStatusService;
@RequestMapping("/shippingStatus/*")
@Controller
public class ShippingStatusController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShippingStatusController.class);
	
	@Inject
	ShippingStatusService service;
	
	@Inject
	PurchaseOrderService pService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView ssAllSelect() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/shippingStatus/shippingStatusList");
		mav.addObject("ssList", service.selectAllShippingStatus());
		
		return mav;
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public ModelAndView ssSelect(@RequestParam int ss_id) {
		
		ModelAndView mav = new ModelAndView();
		
		ShippingStatusDTO ss = service.selectShippingStatus(ss_id);
		
		System.out.println("select 완료!"+ss);
		
		mav.setViewName("/shippingStatus/shippingStatusSelect");
		mav.addObject("ss", ss);
		
		return mav;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView ssSearch(@RequestParam int po_id,RedirectAttributes rttr) {
		
		ModelAndView mav = new ModelAndView();
		
		int count = service.count(po_id);
		
		if(count==1) {
		
		ShippingStatusDTO ss = service.search(po_id);
		
		int ss_id = ss.getSs_id();
		
		ss = service.selectShippingStatus(ss_id);
		
		System.out.println("search 완료! " + ss);
		mav.addObject("msg", "success");
		mav.setViewName("/shippingStatus/shippingStatusSelect");
		mav.addObject("ss", ss);
		}else {
			mav.addObject("msg", "fail");
			mav.addObject("ssList", service.selectAllShippingStatus());
			mav.setViewName("redirect:/shippingStatus/list");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView moveInsert(@RequestParam int po_id) {
		
		ModelAndView mav = new ModelAndView();
		
		PrintPODTO po = pService.poSelect(po_id);
		
		mav.setViewName("/shippingStatus/shippingStatusInsert");
		mav.addObject("po", po);
		
		return mav;
		
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView ssInsert(@ModelAttribute ShippingStatusDTO ss) {
		
		ModelAndView mav = new ModelAndView();
		
		int po_id = ss.getPo_id();
		System.out.println("po_id = " + po_id);
		int count = service.count(po_id);
		System.out.println("count = " + count);
		
		if(count==0) {
			service.insert(ss);
			System.out.println("ss가 생성되었습니다." + ss);
			ss =  service.search(ss.getPo_id());
			ss = service.selectShippingStatus(ss.getSs_id());
			System.out.println("ss = " + ss);
			po_id = ss.getPo_id();
			System.out.println("po_id = " + po_id );
			PrintPODTO po = pService.poSelect(po_id);
			System.out.println("po = " + po );
			service.poComplete(po_id);
			
			po = pService.poSelect(po_id);
			System.out.println("poComplete! po = " + po );
			System.out.println("완료! po_status = " + po.getPo_status());
			mav.addObject("ss_id",ss.getSs_id());
			mav.addObject("po", po);
			mav.addObject("ss",ss);
			mav.addObject("msg", "success");
			mav.setViewName("/shippingStatus/shippingStatusSelect");
		}else {
			mav.addObject("msg", "fail");
			mav.setViewName("/shippingStatus/shippingStatusList");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView moveUpdate(@RequestParam int ss_id) {
		
		ModelAndView mav = new ModelAndView();
		
		ShippingStatusDTO ss = service.selectShippingStatus(ss_id);
		
		int po_id = ss.getPo_id();
		
		PrintPODTO po = pService.poSelect(po_id);
		mav.addObject("po", po);
		mav.addObject("ss",ss);
		mav.setViewName("/shippingStatus/shippingStatusUpdate");
		
		return mav;
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView ssUpdate(@ModelAttribute ShippingStatusDTO ss) {
		
		ModelAndView mav = new ModelAndView();
		
		if(ss!=null) {
			service.update(ss);
			System.out.println("수정되었습니다. ss = " + ss);
			System.out.println("ss_id = " + ss.getSs_id());
			int ss_id = ss.getSs_id();
			ShippingStatusDTO sa = service.selectShippingStatus(ss_id);
			mav.addObject("msg", "success");
			mav.addObject("ss_id",ss.getSs_id());
			mav.setViewName("/shippingStatus/shippingStatusSelect");
		}else {
			mav.addObject("msg", "fail");
			mav.setViewName("/shippingStatus/shippingStatusList");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public ModelAndView ssComplete(@RequestParam int ss_id) {
		
		System.out.println("complete의 ss_id = " + ss_id);
		
		ModelAndView mav = new ModelAndView();
		
		
		service.complete(ss_id);
		
		ShippingStatusDTO ss = service.selectShippingStatus(ss_id);
				
		System.out.println("출하완료! ss = "+ss);
		
	    if (ss == null) {
	    	System.out.println("실패");
	    	mav.addObject("msg", "fail");
	        mav.setViewName("/shippingStatus/shippingStatusList");
	        return mav;
	    }else {
	    	System.out.println("성공");
	    	mav.addObject("msg", "success");
			mav.addObject("ss",ss);
			mav.addObject("ss_id",ss.getSs_id());
			mav.setViewName("/shippingStatus/shippingStatusSelect");
	    }
	    
		return mav;
		
	}
	
}
