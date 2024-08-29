package kr.co.FiveLastName.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.FiveLastName.service.PpService;

@Controller
public class PpController {
		
	@Inject
	PpService ppService;
	
	@GetMapping(value="/")

}
