package org.wof.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.wof.service.PartnersService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/partners/*")
@Controller
@AllArgsConstructor
@Log4j
public class PartnersController {

	private PartnersService partnersservice;
	
	@GetMapping("/project_apply_detail")
	public void project_apply_detail(Model model) {
		log.info("지원한 프로젝트 list");
		model.addAttribute("project_apply_detail", partnersservice.applyProject());
	}
	
	@GetMapping("/partners_support")
	public void partnersSupport(Model model) {
		log.info("파트너스 지원 현황 list");
		model.addAttribute("partnersSupport", partnersservice.partnersSupport());
	}
	
	@GetMapping("/dashboard_partners")
	public void dashboardpartnersApplyProject(Model model) {
		log.info("파트너스 대쉬보드 지원 리스트");
		model.addAttribute("dashboardpartnersApplyProject", partnersservice.dashboardpartnersApplyProject());
	}
}
