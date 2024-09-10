package kr.co.FiveLastName.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.FiveLastName.domain.PartnerDTO;
import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ProgressInspectionDTO;
import kr.co.FiveLastName.domain.ProgressInspectionRecordDTO;
import kr.co.FiveLastName.domain.ShippingStatusDTO;
import kr.co.FiveLastName.domain.StaffDTO;
import kr.co.FiveLastName.service.ProgressInspectionService;
import kr.co.FiveLastName.service.PurchaseOrderService;
import kr.co.FiveLastName.service.ShippingStatusService;
@RequestMapping("/progressInspection/*")
@Controller
public class ProgressInspectionController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProgressInspectionController.class);
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Inject
	ProgressInspectionService service;
	
	@Inject
	ShippingStatusService sService;
	
	@Inject
	PurchaseOrderService pService;
	
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
	public ModelAndView piSelect(@RequestParam int pi_id) {
		System.out.println("select입니다!");
		ModelAndView mav = new ModelAndView();
		System.out.println("pi_id = " + pi_id);
		ProgressInspectionDTO pi = service.piSelect(pi_id);
		System.out.println("pi = " + pi);
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
	public ModelAndView piInsert(@RequestParam int ss_id, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		ShippingStatusDTO ss = sService.selectShippingStatus(ss_id);
		
		PrintPODTO po = pService.poSelect(ss.getPo_id());
		
		session.setAttribute("st_id", "ghldnjs234");
		
		System.out.println("insert 페이지입니다.");
		mav.addObject("po", po);
		mav.addObject("ss", ss);
		mav.setViewName("/progressInspection/progressInspectionInsert");
		
		return mav;
		
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView piInsert(@ModelAttribute ProgressInspectionDTO pi) {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("insert 작업입니다.");
		
		if(pi!=null) {
			service.piInsert(pi);
			int ss_id = pi.getSs_id();
			ProgressInspectionDTO pI = service.piSearch(ss_id);
			System.out.println("pi_id = " + pI.getPi_id());
			System.out.println("insert성공! pi = " + pI);
			int pi_id = pI.getPi_id();
			ProgressInspectionDTO PI = service.piSelect(pi_id);
			ss_id = PI.getSs_id();
			service.ssComplete(ss_id);
			service.insertRecord(PI);
			mav.addObject("pi", PI);
			mav.addObject("msg","success");
			mav.addObject("pi_id",pI.getPi_id());
			mav.setViewName("/progressInspection/progressInspectionSelect");
		}else {
			mav.addObject("msg","fail");
			mav.setViewName("/progressInspection/progressInspectionList");
		}
		return mav;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView piUpdate(@ModelAttribute ProgressInspectionDTO pi) {
		System.out.println("pi = " + pi);
		ModelAndView mav = new ModelAndView();
		
		if(pi!=null) {
			service.piUpdate(pi);
			ProgressInspectionDTO PI = service.piSelect(pi.getPi_id());
			System.out.println("업데이트성공!");
			System.out.println("PI = " + PI);
			service.insertRecord(PI);
			mav.addObject("msg","success");
			mav.addObject("pi",PI);
			mav.addObject("pi_id",PI.getPi_id());
			mav.setViewName("progressInspection/progressInspectionSelect");
		}else {
			mav.addObject("msg","fail");
			mav.setViewName("/progressInspection/progressInspectionList");
		}
		
		return mav;
	}
	
    public void sendMailStaff(int st_id) throws Exception{
        
		StaffDTO st = service.stSelect(st_id);
		
        String subject = "진척검수계획";
        String content = "메일 테스트 내용";
        String from = "yungaeul@naver.com"; // 보내는사람
        String to = st.getSt_email();	//	받는사람
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미
            
            /*
             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             */
            
            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            // true는 html을 사용하겠다는 의미입니다.
            
            /*
             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
             */
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
    }
    public void sendMailPartner(int pa_id) throws Exception{
    	
    	PartnerDTO pa = service.paSelect(pa_id);
    	
    	String subject = "test 메일";
    	String content = "메일 테스트 내용";
    	String from = "yungaeul@naver.com"; // 보내는사람
    	String to = pa.getPa_email();	//	받는사람
    	
    	try {
    		MimeMessage mail = mailSender.createMimeMessage();
    		MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
    		// true는 멀티파트 메세지를 사용하겠다는 의미
    		
    		/*
    		 * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
    		 * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
    		 */
    		
    		mailHelper.setFrom(from);
    		// 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
    		// 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
    		//mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
    		mailHelper.setTo(to);
    		mailHelper.setSubject(subject);
    		mailHelper.setText(content, true);
    		// true는 html을 사용하겠다는 의미입니다.
    		
    		/*
    		 * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
    		 */
    		
    		mailSender.send(mail);
    		
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    }
    
	
}
