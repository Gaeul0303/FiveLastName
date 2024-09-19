package kr.co.FiveLastName.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kr.co.FiveLastName.domain.EstimateDTO;
import kr.co.FiveLastName.domain.PartnerDTO;
import kr.co.FiveLastName.domain.ProductDTO;
import kr.co.FiveLastName.service.EsimateService;
import kr.co.FiveLastName.service.PartnerService;
import kr.co.FiveLastName.service.PpService;
import kr.co.FiveLastName.service.ProductService;

@RequestMapping("/estimate/*")
@Controller
public class ESController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private EsimateService service;
	
	@Inject
	private PpService ppService;
	@Inject
	private ProductService prService;
	@Inject
	private PartnerService paService;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public void listGET(Model model) {
		logger.info("list get");
		
		model.addAttribute("pa", paService.list());
		
	
		model.addAttribute("list",service.list());
		
		
	}
	
	@RequestMapping(value = "/read",method = RequestMethod.GET)
	   public void read(@RequestParam("pp_id") int pp_id,Model model) {
	      model.addAttribute("pa", paService.list());
	      
	      model.addAttribute("pr", prService.list());
	      
	      model.addAttribute("pp", ppService.pp_selectAll());
	      
	      model.addAttribute("list",service.esOne(pp_id));

	   }
	
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public void registerGET(Model model) {
		logger.info("register get");
		model.addAttribute("pp",ppService.pp_selectAll());
		
	}
	
	@RequestMapping(value = "data/{pr_id}", method = RequestMethod.GET)
	public ResponseEntity<ProductDTO> list(@PathVariable("pr_id") int pr_id) {
		ResponseEntity<ProductDTO> entity = null;

		try {
			entity = new ResponseEntity<>(prService.productOne(pr_id), HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;

	}
	
	
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String registerPOST(@ModelAttribute EstimateDTO dto, RedirectAttributes rttr) throws IOException {

		service.register(dto);
	    System.out.println(dto);
	    // 리다이렉트 속성 설정
	    rttr.addFlashAttribute("msg", "success");
	    
	    return "redirect:/estimate/list";
	}
	
	
	@RequestMapping(value = "/modify",method = RequestMethod.GET)
	public void modifyGET(@RequestParam("es_id") int es_id,Model model,RedirectAttributes rttr) {
		model.addAttribute(service.select(es_id));
		model.addAttribute("pp",ppService.pp_selectAll());

		
	}
	
	@RequestMapping(value = "/modify",method = RequestMethod.POST)
	public String modifyPOST(EstimateDTO dto,RedirectAttributes rttr) throws IOException {
		
		
		service.modify(dto);
		
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/estimate/list";
		
		
	}
}
