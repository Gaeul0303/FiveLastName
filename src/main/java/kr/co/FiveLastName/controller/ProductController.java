package kr.co.FiveLastName.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.FiveLastName.domain.ProductDTO;
import kr.co.FiveLastName.service.ProductService;

@RequestMapping("/product/*")
@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private ProductService service;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public void listGET(Model model) {
		logger.info("list get");
		
		model.addAttribute("list",service.list());
	}
	@RequestMapping(value = "/read",method = RequestMethod.GET)
	public void read(@RequestParam("pr_id") int pr_id,Model model) {
		
		model.addAttribute(service.productOne(pr_id));
	}
	
	
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public void registerGET() {
		logger.info("register get");
	}
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String registerPOST(@ModelAttribute ProductDTO dto, @RequestParam("file") MultipartFile file, RedirectAttributes rttr) throws IOException {
	    // 파일 정보 로그
	    logger.info("origin: " + file.getOriginalFilename());
	    logger.info("size: " + file.getSize());
	    logger.info("contentType: " + file.getContentType());

	    // 파일 업로드 처리
	    String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
	    dto.setPr_image(savedName);

	    // 서비스 호출
	    service.register(dto);
	    
	    // 리다이렉트 속성 설정
	    rttr.addFlashAttribute("msg", "success");
	    
	    return "redirect:/product/list";
	}
	

	private String uploadFile(String originalName, byte[] fileData) throws IOException {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;

		File target = new File(uploadPath, savedName);

		FileCopyUtils.copy(fileData, target);

		return savedName;

	}
	
	@RequestMapping(value = "/modify",method = RequestMethod.GET)
	public void modifyGET(@RequestParam("pr_id") int pr_id,Model model) {
		model.addAttribute(service.productOne(pr_id));
	}
}
