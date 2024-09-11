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
	public ModelAndView piInsert(@ModelAttribute ProgressInspectionDTO pi) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("insert 작업입니다.");
		System.out.println("pi_date = " + pi.getPi_date());
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
			sendMailStaff(PI.getSt_id(),PI.getPi_id());
			sendMailPartner(PI.getPa_id(),PI.getPi_id());
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
	public ModelAndView piUpdate(@ModelAttribute ProgressInspectionDTO pi) throws Exception {
		System.out.println("pi = " + pi);
		ModelAndView mav = new ModelAndView();
		
		if(pi!=null) {
			service.piUpdate(pi);
			ProgressInspectionDTO PI = service.piSelect(pi.getPi_id());
			System.out.println("업데이트성공!");
			System.out.println("PI = " + PI);
			service.insertRecord(PI);
			sendMailStaff(PI.getSt_id(),PI.getPi_id());
			sendMailPartner(PI.getPa_id(),PI.getPi_id());
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
	
	public void sendMailStaff(String st_id, int pi_id) throws Exception {
	    StaffDTO st = service.stSelect(st_id);
	    ProgressInspectionDTO pi = service.piSelect(pi_id);
	    
	    String subject = "검수계획변경안내";
	    String content = "<body style=\"font-family: Arial, sans-serif; line-height: 1.6; color: #333; margin: 0; padding: 0; background-color: #f4f4f4;\">"
	            + "    <div style=\"width: 80%; margin: 20px auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background-color: #fff;\">"
	            + "        <h1 style=\"color: #0056b3; font-size: 1.5em;\">안녕하세요 " + st.getSt_name() + " 님,</h1>"
	            + "        <p>검수계획이 변경되어 메일드립니다.</p>"
	            + "        <table style=\"width: 100%; border-collapse: collapse; margin-top: 20px;\">"
	            + "            <tr>"
	            + "                <th style=\"padding: 12px; text-align: left; border-bottom: 1px solid #ddd; background-color: #466879; color: white; font-weight: bold;\">검수계획 날짜</th>"
	            + "                <td style=\"padding: 12px; text-align: left; border-bottom: 1px solid #ddd; background-color: #e0f7fa;\">" + pi.getPi_date() + "</td>"
	            + "            </tr>"
	            + "            <tr>"
	            + "                <th style=\"padding: 12px; text-align: left; border-bottom: 1px solid #ddd; background-color: #466879; color: white; font-weight: bold;\">보완내용</th>"
	            + "                <td style=\"padding: 12px; text-align: left; border-bottom: 1px solid #ddd; background-color: #e0f7fa;\">" + pi.getPi_content() + "</td>"
	            + "            </tr>"
	            + "        </table>"
	            + "        <p>변경점 확인 부탁드립니다.</p>"
	            + "        <div style=\"margin-top: 20px; font-size: 0.9em; color: #777;\">"
	            + "            <p>감사합니다,</p>"
	            + "            <p>(주)오성</p>"
	            + "            <p><a href=\"mailto:yungaeul@naver.com\" style=\"color: #0056b3; text-decoration: none;\">yungaeul@naver.com</a></p>"
	            + "        </div>"
	            + "    </div>"
	            + "</body>"
	            + "</html>";
	    
	    String from = "yungaeul@naver.com"; // 보내는 사람
	    String to = st.getSt_email(); // 받는 사람
	    
	    try {
	        MimeMessage mail = mailSender.createMimeMessage();
	        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
	        
	        mailHelper.setFrom(from);
	        mailHelper.setTo(to);
	        mailHelper.setSubject(subject);
	        mailHelper.setText(content, true); // true는 HTML 형식을 의미
	        
	        mailSender.send(mail);
	        System.out.println("스태프에게 메일을 보냈습니다!");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
    
	public void sendMailPartner(int pa_id, int pi_id) throws Exception {
	    PartnerDTO pa = service.paSelect(pa_id);
	    ProgressInspectionDTO pi = service.piSelect(pi_id);
	    
	    String subject = "검수계획변경안내";
	    String content = "<body style=\"font-family: Arial, sans-serif; line-height: 1.6; color: #333; margin: 0; padding: 0; background-color: #f4f4f4;\">"
	            + "    <div style=\"width: 80%; margin: 20px auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background-color: #fff;\">"
	            + "        <h1 style=\"color: #0056b3; font-size: 1.5em;\">안녕하세요 " + pa.getPa_name()+"의" + pa.getPa_manager() +" 님,</h1>"
	            + "        <p>검수계획이 변경되어 메일드립니다.</p>"
	            + "        <table style=\"width: 100%; border-collapse: collapse; margin-top: 20px;\">"
	            + "            <tr>"
	            + "                <th style=\"padding: 12px; text-align: left; border-bottom: 1px solid #ddd; background-color: #466879; color: white; font-weight: bold;\">검수계획 날짜</th>"
	            + "                <td style=\"padding: 12px; text-align: left; border-bottom: 1px solid #ddd;\">" + pi.getPi_date() + "</td>"
	            + "            </tr>"
	            + "            <tr>"
	            + "                <th style=\"padding: 12px; text-align: left; border-bottom: 1px solid #ddd; background-color: #466879; color: white; font-weight: bold;\">보완내용</th>"
	            + "                <td style=\"padding: 12px; text-align: left; border-bottom: 1px solid #ddd;\">" + pi.getPi_content() + "</td>"
	            + "            </tr>"
	            + "        </table>"
	            + "        <p>변경점 확인 부탁드립니다.</p>"
	            + "        <div style=\"margin-top: 20px; font-size: 0.9em; color: #777;\">"
	            + "            <p>감사합니다,</p>"
	            + "            <p>(주)오성</p>"
	            + "            <p><a href=\"mailto:yungaeul@naver.com\" style=\"color: #0056b3; text-decoration: none;\">yungaeul@naver.com</a></p>"
	            + "        </div>"
	            + "    </div>"
	            + "</body>"
	            + "</html>";
	    
	    String from = "yungaeul@naver.com"; // 보내는 사람
	    String to = pa.getPa_email(); // 받는 사람
	    
	    try {
	        MimeMessage mail = mailSender.createMimeMessage();
	        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
	        
	        mailHelper.setFrom(from);
	        mailHelper.setTo(to);
	        mailHelper.setSubject(subject);
	        mailHelper.setText(content, true); // true는 HTML 형식을 의미
	        
	        mailSender.send(mail);
	        System.out.println("파트너에게 메일을 보냈습니다!");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
    
	
}
