package org.wof.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
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
import org.wof.domain.Coolsms;
import org.wof.domain.MemberVO;
import org.wof.domain.PageDTO;
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

	@PreAuthorize("hasRole('ROLE_CLIENT')")
	@GetMapping("/point_client")
	public String point_client(Principal principal,PointVO point, MemberVO member, Model model, Standard standard){

		member.setUserid(principal.getName());
		log.info("포인트 관리 페이지(충전/인출/조회)");
		log.info("=============member : "+member);
		log.info("=============point : "+point);

		int totalpoint = service.totalPoinAjaxtService(member);

		//model.addAttribute("admin", service.ListService(standard));
		log.info("stnadard!!!!!!!!!!!!!!!!!!!!!"+standard);
		//model.addAttribute("getList", service.ListService(member, point, standard));
		log.info("stnadard!!!!!!!!!!!!!!!!!!!!!"+standard);
		int total = service.getTotalService(standard);
		log.info(standard);
		log.info(total);
		//model.addAttribute("pageMaker", new PageDTO(standard, total));
		model.addAttribute("totalpoint",totalpoint);


		return "point/point-client";
	}


	@PreAuthorize("hasRole('ROLE_PARTNERS')")
	@GetMapping("/point_partners")
	public String point_partners(Principal principal,PointVO point, MemberVO member, Model model, Standard standard){

		member.setUserid(principal.getName());
		log.info("포인트 관리 페이지(충전/인출/조회)");
		log.info("=============member : "+member);
		log.info("=============point : "+point);

		int totalpoint = service.totalPoinAjaxtService(member);

		//model.addAttribute("admin", service.ListService(standard));
		log.info("stnadard!!!!!!!!!!!!!!!!!!!!!"+standard);
		model.addAttribute("getList", service.ListService(member, point, standard));
		log.info("stnadard!!!!!!!!!!!!!!!!!!!!!"+standard);
		int total = service.getTotalService(standard);
		log.info(standard);
		log.info(total);
		//model.addAttribute("pageMaker", new PageDTO(standard, total));
		model.addAttribute("totalpoint",totalpoint);


		return "point/point-partners";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/charging")
	public String getcharging(){
		return "point/point-charging";
	}

	@PreAuthorize("hasRole('ROLE_CLIENT')")
	@PostMapping("/charging")
	public String charging(PointVO point, MemberVO member, RedirectAttributes rttr){
		log.info(point);
		if(service.ChargingService(point, member) == 1){
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/point/point_client";
	}

	@PreAuthorize("hasRole('ROLE_PARTNERS')")
	@PostMapping("/charging2")
	public String charging2(PointVO point, MemberVO member, RedirectAttributes rttr){
		log.info(point);
		if(service.ChargingService(point, member) == 1){
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/point/point_partners";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/withdraw")
	public String getwithdarw(){
		return "point/point-withdraw";
	}

	@PreAuthorize("hasRole('ROLE_CLIENT')")
	@PostMapping("/withdraw")
	public String withdraw(PointVO point, MemberVO member, RedirectAttributes rttr){

		if(service.WithdrawService(point, member) == 1){
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/point/point_client";
	}

	@PreAuthorize("hasRole('ROLE_PARTNERS')")
	@PostMapping("/withdraw2")
	public String withdraw2(PointVO point, MemberVO member, RedirectAttributes rttr){

		if(service.WithdrawService(point, member) == 1){
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/point/point_partners";
	}

/*    @PreAuthorize("isAuthenticated()")
    @GetMapping("/totalPoint")
    public void totalPoint(PointVO point, RedirectAttributes rttr){

       if(service.totalPointService(point) == 1){
          rttr.addFlashAttribute("result", "success");
       }

    }
    */

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/point/pwCheck", method=RequestMethod.GET)
	@ResponseBody
	public MemberVO pwCheck(@RequestParam("userpw") String userpw ,MemberVO member, Principal principal){

		log.info("--------------------!!!" + userpw);

		log.info("======== principal.getName() : ========" + principal.getName());
		member.setUserid(principal.getName());
		member.setUserpw(userpw);
		member.setUserpw(service.pwCheckService(member));
		return member;
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/pointTest")
	public String pointTest(){
		return "point/point-test";
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/paymentIn")
	public String paymentIn(ContractSourceVO contract, PointVO point, Model model){
		log.info("paymentIn 1st" + contract);
		log.info("------------"+point);

		model.addAttribute("paymentIn", service.PaymentInService(point, contract));

		return "point/point-admin";
	}

  /* @PreAuthorize("isAuthenticated()")
    @PostMapping("/paymentOut")
    public String paymentOut(PointVO point, MemberVO member, ContractSourceVO contract, RedirectAttributes rttr){

       if(service.PaymentOutService(point, member, contract) == 1){
          rttr.addFlashAttribute("result", "success");
       }
          return "point/point-admin";
    }*/

}