package org.wof.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.wof.domain.Criteria;
import org.wof.domain.PageDTO;
import org.wof.service.ProjectService2;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/project/*")
@Log4j
public class ProjectController {
	
	@Autowired
	private ProjectService2 projectService2;
	
	@GetMapping("recommend_list")
	public String projectRecommendList(Criteria cri, Model model){
		int totalPage = projectService2.totalProject();
		model.addAttribute("projects", projectService2.projectList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, totalPage));
		log.info("recommend List 실행");
		return "project/project_recommend_list";
	}

}
