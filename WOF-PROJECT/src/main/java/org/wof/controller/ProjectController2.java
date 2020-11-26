package org.wof.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.wof.domain.PartnersVO;
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

/*	@GetMapping("recommend_list")
	public String projectRecommendList(Principal principal, Standard standard, Model model){
		log.info("recommend List 실행");
		String related_member = memberMapper.memberNo(principal.getName());
		PartnersVO vo = memberMapper.partnersInfo(related_member);
		model.addAttribute("projects", projectService2.listRecommendProject(vo));
		return "project/project_recommend_list";
	}*/
	
	@GetMapping("recommend_list")
	public String projectRecommendList(Principal principal, Standard standard, Model model){
		log.info("recommend List 실행");
		String related_member = memberMapper.memberNo(principal.getName());
		PartnersVO vo = memberMapper.partnersInfo(related_member);
		model.addAttribute("projects", projectService2.projectList());
		model.addAttribute("follows", projectService2.listFollowProject(related_member));
		return "project/project_recommend_list";
	}
	
	@GetMapping("follow_list")
	public String projectFollowList(Principal principal, Standard standard, Model model){
		log.info("follow List 실행");
		String related_member = memberMapper.memberNo(principal.getName());
		model.addAttribute("projects", projectService2.listFollowProject(related_member));
		return "project/project_follow";
	}
	
	@GetMapping("partners")
	public String partnerDashBoard(Principal principal, Model model,HttpServletRequest request){
		log.info("파트너스 meeting 실행");
	    HttpSession session = request.getSession();
		String related_member = memberMapper.memberNo(principal.getName());
		PartnersVO vo = memberMapper.partnersInfo("member29");
		session.setAttribute("partners", vo);
		model.addAttribute("meets", projectService2.listMeeting("member29"));
		return "project/partners_dashboard";
	}
	
	

}
