package org.wof.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.wof.service.ClientService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/client/*")
@Controller
@AllArgsConstructor
@Log4j
public class ClientController {
	
	private ClientService clientservice;
	
	@GetMapping("/dashboard_client")
	public void dashboardclientProject(Model model) {
		log.info("클라이언트 대쉬보드 프로젝트 리스트");
		model.addAttribute("dashboardclientProject", clientservice.dashboardclientProject());
	}
	 
}
