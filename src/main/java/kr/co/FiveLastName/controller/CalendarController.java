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

import kr.co.FiveLastName.domain.ProgressInspectionDTO;
import kr.co.FiveLastName.service.ProgressInspectionService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CalendarController {
	
	@Inject
	ProgressInspectionService service;
	
	@RequestMapping(value = "piCalendar", method = RequestMethod.GET)
	public String calendar(Model model) {
		
		List<ProgressInspectionDTO>pi = service.piAllSelect();
		
		model.addAttribute("pi", pi);
		model.addAttribute("msg", "차 \n검수예정");
		
		for(int i = 0; i<pi.size();i++) {
		System.out.println(i+".pi = " + pi.get(i));
		};
		return "piCalendar";
	}
	
}
