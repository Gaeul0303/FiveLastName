package kr.co.FiveLastName.controller;

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
import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ShippingStatusDTO;
import kr.co.FiveLastName.service.PurchaseOrderService;
import kr.co.FiveLastName.service.ShippingStatusService;

@RequestMapping("/shippingStatus/*")
@Controller
public class ShippingStatusController {
    
    private static final Logger logger = LoggerFactory.getLogger(ShippingStatusController.class);
    
    @Inject
    ShippingStatusService service;
    
    @Inject
    PurchaseOrderService pService;
    
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String ssAllSelect(Model model) {
        model.addAttribute("ssList", service.selectAllShippingStatus());
        return "/shippingStatus/shippingStatusList";
    }
    
    @RequestMapping(value = "/select", method = RequestMethod.GET)
    public String ssSelect(@RequestParam int ss_id, Model model) {
        ShippingStatusDTO ss = service.selectShippingStatus(ss_id);
        System.out.println("select 완료!" + ss);
        model.addAttribute("ss", ss);
        return "/shippingStatus/shippingStatusSelect";
    }
    
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String ssSearch(@RequestParam int po_id, RedirectAttributes rttr) {
        int count = service.count(po_id);

        if (count == 1) {
            ShippingStatusDTO ss = service.search(po_id);
            int ss_id = ss.getSs_id();
            ss = service.selectShippingStatus(ss_id);
            System.out.println("search 완료! " + ss);

            rttr.addFlashAttribute("msg", "success");
            rttr.addFlashAttribute("ss", ss);
            return "redirect:/shippingStatus/select?ss_id=" + ss_id;
        } else {
            rttr.addFlashAttribute("msg", "fail");
            return "redirect:/shippingStatus/list";
        }
    }
    
    @RequestMapping(value = "/insert", method = RequestMethod.GET)
    public String moveInsert(@RequestParam int po_id, Model model) {
        PrintPODTO po = pService.poSelect(po_id);
        model.addAttribute("po", po);
        return "/shippingStatus/shippingStatusInsert";
    }
    
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String ssInsert(@ModelAttribute ShippingStatusDTO ss, RedirectAttributes rttr) {
        int po_id = ss.getPo_id();
        System.out.println("po_id = " + po_id);
        int count = service.count(po_id);
        System.out.println("count = " + count);
        
        if (count == 0) {
            service.insert(ss);
            System.out.println("ss가 생성되었습니다." + ss);
            ss = service.search(ss.getPo_id());
            ss = service.selectShippingStatus(ss.getSs_id());
            System.out.println("ss = " + ss);
            po_id = ss.getPo_id();
            System.out.println("po_id = " + po_id);
            PrintPODTO po = pService.poSelect(po_id);
            System.out.println("po = " + po);
            service.poComplete(po_id);

            po = pService.poSelect(po_id);
            System.out.println("poComplete! po = " + po);
            System.out.println("완료! po_status = " + po.getPo_status());

            rttr.addFlashAttribute("ss_id", ss.getSs_id());
            rttr.addFlashAttribute("po", po);
            rttr.addFlashAttribute("ss", ss);
            rttr.addFlashAttribute("msg", "successInsert");
            return "redirect:/shippingStatus/list";
        } else {
            rttr.addFlashAttribute("msg", "fail");
            return "redirect:/shippingStatus/list";
        }
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String moveUpdate(@RequestParam int ss_id, Model model) {
        ShippingStatusDTO ss = service.selectShippingStatus(ss_id);
        int po_id = ss.getPo_id();
        PrintPODTO po = pService.poSelect(po_id);
        model.addAttribute("po", po);
        model.addAttribute("ss", ss);
        return "/shippingStatus/shippingStatusUpdate";
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String ssUpdate(@ModelAttribute ShippingStatusDTO ss, RedirectAttributes rttr) {
        if (ss != null) {
            service.update(ss);
            System.out.println("수정되었습니다. ss = " + ss);
            System.out.println("ss_id = " + ss.getSs_id());
            int ss_id = ss.getSs_id();
            ShippingStatusDTO sa = service.selectShippingStatus(ss_id);
            rttr.addFlashAttribute("msg", "success");
            rttr.addFlashAttribute("ss_id", sa.getSs_id());
            return "redirect:/shippingStatus/select?ss_id=" + ss_id;
        } else {
            rttr.addFlashAttribute("msg", "fail");
            return "redirect:/shippingStatus/list";
        }
    }
    
    @RequestMapping(value = "/complete", method = RequestMethod.POST)
    public String ssComplete(@RequestParam int ss_id, RedirectAttributes rttr) {
        System.out.println("complete의 ss_id = " + ss_id);

        service.complete(ss_id);

        ShippingStatusDTO ss = service.selectShippingStatus(ss_id);
        System.out.println("출하완료! ss = " + ss);

        if (ss == null) {
            System.out.println("실패");
            rttr.addFlashAttribute("msg", "fail");
            return "redirect:/shippingStatus/list";
        } else {
            System.out.println("성공");
            rttr.addFlashAttribute("msg", "success");
            rttr.addFlashAttribute("ss", ss);
            rttr.addFlashAttribute("ss_id", ss.getSs_id());
            return "redirect:/shippingStatus/select?ss_id=" + ss.getSs_id();
        }
    }
}
