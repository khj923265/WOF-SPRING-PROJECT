package org.wof.controller;

import java.security.Principal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.wof.domain.Standard;
import org.wof.mapper.MemberMapper;
import org.wof.service.ProjectService2;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/project/*")
@AllArgsConstructor
public class ProjectController2 {
	
	private ProjectService2 projectService2;
	private MemberMapper memberMapper;

	@GetMapping("recommend_list")
	public String projectRecommendList(Principal principal, Standard standard, Model model){
		log.info("recommend List 실행");
		String related_member = memberMapper.memberNo(principal.getName());
		model.addAttribute("projects", projectService2.projectList());
		model.addAttribute("follows", projectService2.followProjectList(related_member));
		return "project/project_recommend_list";
	}

}
