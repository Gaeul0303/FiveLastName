package kr.co.FiveLastName.controller;

import java.text.DateFormat;
import java.util.ArrayList;
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

import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ProgressInspectionDTO;
import kr.co.FiveLastName.domain.ProgressInspectionRecordDTO;
import kr.co.FiveLastName.service.ProgressInspectionService;
import kr.co.FiveLastName.service.PurchaseOrderService;
import kr.co.FiveLastName.service.ShippingStatusService;
@RequestMapping("/progressInspection/*")
@Controller
public class ProgressInspectionController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProgressInspectionController.class);
	
	@Inject
	ProgressInspectionService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView selectAllShippingStatus() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/progressInspection/progressInspectionList");
		
		List<ProgressInspectionDTO> pi = service.piAllSelect();
		
		mav.addObject("pi", pi);
		mav.setViewName("/progressInspection/progressInspectionList");
		return mav;
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public ModelAndView piSelect(int pi_id) {
		
		ModelAndView mav = new ModelAndView();
		
		ProgressInspectionDTO pi = service.piSelect(pi_id);
		
		mav.setViewName("/progressInspection/progressInspectionSelect");
		mav.addObject("pi", pi);
		
		
		return mav;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView piSearch(int ss_id) {
		
		ModelAndView mav = new ModelAndView();
		
		ProgressInspectionDTO pi = service.piSearch(ss_id);
		
		
		mav.setViewName("/progressInspection/progressInspectionSelect");
		mav.addObject("pi", pi);
		
		return mav;
	}
	
	@RequestMapping(value = "/record", method = RequestMethod.GET)
	public ModelAndView piRecord(int ss_id) {
		
		System.out.println("controller 입니다.");
		
		ModelAndView mav = new ModelAndView();
		
		int result = service.pirSearch(ss_id);

		System.out.println("result = " + result);
		  
		if(result>1) {
			List<ProgressInspectionRecordDTO> pir =service.piRecord(ss_id);
			for(int i = 0; i<pir.size(); i++) {
			System.out.println("pir = " + pir);
			}
			mav.setViewName("/progressInspection/progressInspectionRecord");
			mav.addObject("pir", pir);
		}else {
			System.out.println("pir = " + service.piRecordOne(ss_id));
			
			ProgressInspectionRecordDTO pirOne = service.piRecordOne(ss_id);
			List<ProgressInspectionRecordDTO> pir = new ArrayList<ProgressInspectionRecordDTO>();
			pir.add(pirOne);
			System.out.println("pir = " + pir.get(0));
			mav.setViewName("/progressInspection/progressInspectionRecord");
			mav.addObject("pir", pir);
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView selectShippingStatus() {
		
		ModelAndView mav = new ModelAndView();
		
		
		
		return mav;
		
	}
	
}
