package org.wof.controller;

import java.lang.reflect.Member;
import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wof.domain.ContractSourceVO;
import org.wof.domain.ContractVO;
import org.wof.domain.MemberVO;
import org.wof.domain.PageDTO;
import org.wof.domain.PointVO;
import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;
import org.wof.service.PointService;
import org.wof.service.PointServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/point/*")
public class PointController {
	
    private PointService service;

    
    @GetMapping("/admin")
    public String admin(Principal principal,PointVO point, MemberVO member, Model model, Standard standard){
    	
    	member.setUserid(principal.getName());
    	log.info("포인트 관리 페이지(충전/인출/조회)");
    	log.info("=============member : "+member);
    	log.info("=============point : "+point);
    	
    	//model.addAttribute("admin", service.ListService(standard));
    	
    	model.addAttribute("getList", service.ListService(member, point, standard));
    	
    	int total = service.getTotalService(standard);
    	log.info(standard);
    	log.info(total);
    	model.addAttribute("pageMaker", new PageDTO(standard, total));
    	
    	return "point/point-admin";
    }
    
    @GetMapping("/charging")
    public String getcharging(){
    	return "point/point-charging";
    }
    
    @PostMapping("/charging")
    public String charging(PointVO point, MemberVO member, RedirectAttributes rttr){
    		log.info(point);
    		if(service.ChargingService(point, member) == 1){
        		rttr.addFlashAttribute("result", "success");
        	}
    		
    	return "redirect:/point-admin";
    }
    
    @GetMapping("/withdraw")
    public String getwithdarw(){
    	return "point/point-withdraw";
    }
    
    @PostMapping("/withdraw")
    public String withdraw(PointVO point, MemberVO member, RedirectAttributes rttr){
    		
    	if(service.WithdrawService(point, member) == 1){
    		rttr.addFlashAttribute("result", "success");
    	}
    	
    		return "point/point-admin";
    }
    
    @RequestMapping(value="/point/pwCheck", method=RequestMethod.GET)
    @ResponseBody
    public String pwCheck(@RequestParam("userpw") String userpw ,MemberVO member, Principal principal){
    	
    	log.info("======== principal.getName() : ========" + principal.getName());
    	member.setUserid(principal.getName());
    	member.setUserpw(userpw);
    	
    	return service.pwCheckService(member);
    }
    
    @GetMapping("/pointTest")
    public String pointTest(){
    	return "point/point-test";
    }
    
    @PostMapping("/paymentIn")
    public String paymentIn(ContractVO contract, PointVO point){
    		log.info("paymentIn 1st" + contract);
    		log.info("------------"+point);
    		
    		return "redirect:/point/point-admin";
    }
    
    @PostMapping("/paymentOut")
    public String paymentOut(PointVO point, MemberVO member, ContractSourceVO contract, RedirectAttributes rttr){
    		
    	if(service.PaymentOutService(point, member, contract) == 1){
    		rttr.addFlashAttribute("result", "success");
    	}
    		return "point/point-admin";
    }
    
}
