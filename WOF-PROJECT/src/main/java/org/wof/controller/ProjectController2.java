package org.wof.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.wof.domain.Standard;
import org.wof.service.ProjectService2;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/project/*")
@AllArgsConstructor
public class ProjectController2 {
	
	private ProjectService2 projectService2;

	@GetMapping("recommend_list")
	public String projectRecommendList(Standard standard, Model model){
		model.addAttribute("projects", projectService2.projectList());
		log.info("recommend List 실행");
		return "project/project_recommend_list";
	}

}
