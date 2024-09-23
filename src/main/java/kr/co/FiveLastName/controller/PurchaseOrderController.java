package kr.co.FiveLastName.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ProcurementPlanRegistrationDTO;
import kr.co.FiveLastName.domain.StaffDTO;
import kr.co.FiveLastName.service.PprService;
import kr.co.FiveLastName.service.ProgressInspectionService;
import kr.co.FiveLastName.service.PurchaseOrderService;
import javax.servlet.http.HttpSession;

@RequestMapping("/purchaseOrder/*")
@Controller
public class PurchaseOrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseOrderController.class);
	
	
	@Inject
	PurchaseOrderService service;
	
	@Inject
	ProgressInspectionService piService;

	@Inject
	PprService pprService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView poAllSelect() {
		
		ModelAndView mav = new ModelAndView();
		
		List<PrintPODTO> poList = service.poAllSelect();
		
		mav.setViewName("/purchaseOrder/purchaseOrderList");
		
		mav.addObject("poList", poList);
		
		return mav;
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public ModelAndView poSelect(int po_id , HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		PrintPODTO po = service.poSelect(po_id);

		String st_id = (String) session.getAttribute("st_id");// staff를 세션값주는걸로변경 
		
		StaffDTO st = piService.stSelect(st_id);
		
		mav.addObject("st",st);
		
		mav.setViewName("/purchaseOrder/purchaseOrderSelect");
		
		mav.addObject("po", po);
		
		return mav;
	}
	
	@RequestMapping(value = "/print", method = RequestMethod.GET)
	public ModelAndView poPrint(int po_id , HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		PrintPODTO po = service.poSelect(po_id);
		
		String st_id = (String) session.getAttribute("st_id");// staff를 세션값주는걸로변경 
		
		StaffDTO st = piService.stSelect(st_id);
		
		mav.addObject("st",st);
		
		mav.setViewName("/purchaseOrder/purchaseOrder");
		
		mav.addObject("po", po);
		
		return mav;
	}
	
	@RequestMapping(value = "/prev", method = RequestMethod.GET)
	public ModelAndView poPrev(int ppr_id , HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("/purchaseOrder/purchaseOrderInsert");
		
		mav.addObject("po",service.poPrev(ppr_id));
		
		return mav;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String poInsertMove(Model model,RedirectAttributes redirectAttributes, HttpSession session) {
	    
	    System.out.println("insert 페이지입니다.");
	    
	    int count = service.pprCount();
	    
	    System.out.println("count = " + count);
	    
	    if(count > 1) {
	        List<ProcurementPlanRegistrationDTO> ppr = service.pprList();
	        List<PrintPODTO> po = service.pprAll();
	        model.addAttribute("count", count);
	        model.addAttribute("po", po);
	        model.addAttribute("ppr", ppr);
	        for(int i = 0; i<po.size(); i++) {
	        	System.out.println("po " + i + " = " + po.get(i));
	        }
	        return "/purchaseOrder/purchaseOrderInsert";
	    } else if(count == 1) {
	        ProcurementPlanRegistrationDTO ppr = service.pprOne();
	        PrintPODTO po = service.ppr();
	        model.addAttribute("count", count);
	        model.addAttribute("po", po);
	        model.addAttribute("ppr", ppr);
	        return "/purchaseOrder/purchaseOrderInsert";
	    } else {
	    	redirectAttributes.addFlashAttribute("msg", "insertFail");
	        return "redirect:/purchaseOrder/list";
	    }
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String poInsert(int ppr_id) {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("ppr_id = " + ppr_id);
		
		service.poInsert(ppr_id);
		
		service.poComplete(ppr_id);
		
		 return "redirect:/purchaseOrder/list";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView poSearch(int ppr_id , HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		PrintPODTO po = service.poSearch(ppr_id);

		String st_id = (String) session.getAttribute("st_id");// staff를 세션값주는걸로변경 
		
		StaffDTO st = piService.stSelect(st_id);
		
		mav.addObject("st",st);
		
		mav.setViewName("/purchaseOrder/purchaseOrderSelect");
		mav.addObject("po", po);
		
		return mav;
	}
}
