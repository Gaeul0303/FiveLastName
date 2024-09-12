package kr.co.FiveLastName.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.FiveLastName.service.StaffService;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Inject
	private StaffService service;
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(Model model) {
	
		
		return "login";
	}


	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, Object> map, HttpSession session, Model model,RedirectAttributes rttr) {
		logger.info("요청정보 받아서 보내기");		
		Map user = service.login(map);
		System.out.println(user);		
		if(user == null) { //로그인 실패
			rttr.addFlashAttribute("msg", "정보가 일치하지 않습니다.");
	        return "redirect:/login"; // 로그인 페이지로 이동
		} else {// 로그인 성공 세션 부여
			System.out.println("로그인 성공");
			session.setAttribute("st_id", user.get("st_id"));
			session.setAttribute("st_department", user.get("st_department"));
			
			return "redirect:/";
		}
	}
	

	@GetMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}	
	
}