package org.wof.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.wof.domain.PageDTO;
import org.wof.domain.Standard;
import org.wof.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@RequestMapping("/admin/*")
@Controller
@AllArgsConstructor
@Log4j
public class AdminController {
	
	private AdminService adminService;

	@GetMapping("/dashboard_admin")
	public void dashboard_admin(Standard standard, Model model) {
		log.info("관리자 페이지 확인");
		log.info(standard);
		
		int total = adminService.getTotal(standard);
		
		log.info("total : " + total);
		
		model.addAttribute("totalProject", new PageDTO(standard, total));

	}
	

}
