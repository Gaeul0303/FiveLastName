package kr.co.FiveLastName.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.FiveLastName.domain.ContractDTO;
import kr.co.FiveLastName.service.ContractService;
import kr.co.FiveLastName.service.EsimateService;
import kr.co.FiveLastName.service.PartnerService;
import kr.co.FiveLastName.service.PpService;
import kr.co.FiveLastName.service.ProductService;



@RequestMapping("/contract/*")
@Controller
public class ContractController {
private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ContractService service;
	@Inject
	private ProductService prService;
	
	@Inject
	private EsimateService esService;
	
	@Inject
	private PpService ppService;
	
	@Inject
	private PartnerService paService;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public void listGET(Model model) {
		logger.info("list get");
		
		
		
		model.addAttribute("list",service.list());
	}
	
	
	@RequestMapping(value = "/read",method = RequestMethod.GET)
	public void read(@RequestParam("co_id") int co_id,Model model) {
		model.addAttribute(service.coOne(co_id));

		model.addAttribute("pr", prService.list());
		
		model.addAttribute("pp", ppService.pp_selectAll());
		
		model.addAttribute("es",esService.list());

	}
	
	
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public void registerGET(Model model) {
		logger.info("register get");
		model.addAttribute("pa", paService.list());
		model.addAttribute("es", esService.list());
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String registerPOST(@ModelAttribute ContractDTO dto, RedirectAttributes rttr) throws IOException {
		System.out.println(dto.getCo_contractDate());
		
	    service.register(dto);
	    rttr.addFlashAttribute("msg", "success");
	    
	    
	    return "redirect:/contract/list";
	}
	

	
	
	@RequestMapping(value = "/modify",method = RequestMethod.GET)
	public void modifyGET(@RequestParam("co_id") int co_id,Model model,RedirectAttributes rttr) {
		model.addAttribute("pa", paService.list());
		
		model.addAttribute("es", esService.list());
		
		model.addAttribute(service.coOne(co_id));
		
	}
	
	@RequestMapping(value = "/modify",method = RequestMethod.POST)
	public String modifyPOST(ContractDTO dto,RedirectAttributes rttr) throws IOException {
	
		service.modify(dto);
		
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/contract/list";
		
		
	}
	
	
}
