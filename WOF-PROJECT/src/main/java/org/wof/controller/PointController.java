package org.wof.controller;

import java.lang.reflect.Member;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wof.domain.MemberVO;
import org.wof.domain.PageDTO;
import org.wof.domain.PointSearch;
import org.wof.domain.PointVO;
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
    public String admin(PointVO point, Model model, Standard standard){
    	
    	log.info("포인트 관리 페이지(충전/인출/조회)");
    	
    	model.addAttribute("admin", service.ListService(standard));
    	
    	model.addAttribute("getList", service.ListService(standard));
    	
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
    
    
    @GetMapping("/getPointTotal")
    public void getPointTotal(Model model){
    	
    	MemberVO member = new MemberVO();
    	
    	model.addAttribute("getPointTotal", service.getPointTotalService(member));
    }
    
}
