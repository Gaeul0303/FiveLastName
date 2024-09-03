package kr.co.FiveLastName.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.FiveLastName.domain.EstimateDTO;
import kr.co.FiveLastName.domain.PartnerDTO;
import kr.co.FiveLastName.domain.ProductDTO;
import kr.co.FiveLastName.service.EsimateService;
import kr.co.FiveLastName.service.PartnerService;
import kr.co.FiveLastName.service.ProductService;

@RequestMapping("/estimate/*")
@Controller
public class ESController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private EsimateService service;
	
	
	@Inject
	private ProductService prService;
	@Inject
	private PartnerService paService;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public void listGET(Model model) {
		logger.info("list get");
		
		model.addAttribute("pa", paService.list());
		
		model.addAttribute("pr", prService.list());
		
		model.addAttribute("list",service.list());
		
		
	}
	
	@RequestMapping(value = "/read",method = RequestMethod.GET)
	public void read(@RequestParam("es_id") int es_id,Model model) {
		model.addAttribute("pa", paService.list());
		
		model.addAttribute("pr", prService.list());
		
		
		model.addAttribute(service.esOne(es_id));
		
		
		
		
		
	}
}
