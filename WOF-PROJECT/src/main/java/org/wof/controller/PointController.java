package org.wof.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wof.domain.PointSearch;
import org.wof.domain.PointVO;
import org.wof.service.PointService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/point/*")
public class PointController {
	
    private PointService service;

    
    @GetMapping("/admin")
    public String admin(PointVO point, PointSearch search, Model model){
    	
    	log.info("포인트 관리 페이지");
    	
    	model.addAttribute("admin", service.GetService(search));
    	
    	return "point/point-admin";
    }
    
    @GetMapping("/charging")
    public String getcharging(){
    	return "point/point-charging";
    }
    
    @PostMapping("/charging")
    public String charging(PointVO point, RedirectAttributes rttr){
    		
    	if(service.ChargingService(point) == 1){
    		rttr.addFlashAttribute("result", "success");
    	}
    	
    		return "point/point-admin";
    }
    
    @GetMapping("/withdraw")
    public String getwithdarw(){
    	return "point/point-withdraw";
    }
    
    @PostMapping("/withdraw")
    public String withdraw(PointVO point, RedirectAttributes rttr){
    		
    	if(service.WithdrawService(point) == 1){
    		rttr.addFlashAttribute("result", "success");
    	}
    	
    		return "point/point-admin";
    }
    
    /*@PostMapping("/withdraw")
    public String withdraw(@RequestParam("member_no") String member_no, PointVO point, RedirectAttributes rttr){
    
    	
    		return "redirect:/point/point-admin";
    }*/
    
    @GetMapping("/get")
    public void get(@RequestParam("member_no") String member_no, PointVO point, Model model, RedirectAttributes rttr){
    	
    	
    }
}
