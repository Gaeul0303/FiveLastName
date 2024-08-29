package kr.co.FiveLastName.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.FiveLastName.domain.ProductDTO;
import kr.co.FiveLastName.service.ProductService;

@RequestMapping("/product/*")
@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService service;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public void listGET(Model model) {
		logger.info("list get");
		
		model.addAttribute("list",service.list());
	}
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public void registerGET() {
		logger.info("register get");
	}
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String registerPOST(ProductDTO dto,RedirectAttributes rttr) {
		service.register(dto);
		rttr.addFlashAttribute("msg","success");
		
		//return "/board/success";
		return "redirect:/product/list";
	}
	@RequestMapping(value = "/modify",method = RequestMethod.GET)
	public void modifyGET() {
		logger.info("modify get");
	}
}
