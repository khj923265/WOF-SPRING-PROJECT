package org.wof.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wof.domain.ProjectVO;
import org.wof.service.ProjectAttachService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@RequestMapping("/project/*")
@Controller
@AllArgsConstructor
@Log4j
public class ProjectAttachController {

	private ProjectAttachService service;
	
	public String register(ProjectVO projectvo, RedirectAttributes rttr) {
	
		log.info("-----------------------====");
		log.info("file register : " + projectvo);
		
		if(projectvo.getAttachList() != null) {
			projectvo.getAttachList().forEach(attach -> log.info(attach));
			
		}
		
		log.info("======================----");
		
		service.register(projectvo);
		
		rttr.addFlashAttribute("result", projectvo.getProj_id());
		
		return "redirect:/project/read";
	}
	
/*	@PostMapping("/file_remove")
	public String remove(@RequestParam("proj_id") String proj_id, RedirectAttributes rttr) {
		
	}*/
	
}
