package org.wof.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wof.domain.PageDTO;
import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;
import org.wof.service.ProjectService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.wof.service.ProjectService2;

@Controller
@Log4j
@RequestMapping("/project/*")
@AllArgsConstructor
public class ProjectController {

	private ProjectService ps1;
	
	@GetMapping("/list")
	public void list(Model model1){
		log.info("list");
		model1.addAttribute("list", ps1.getlist());
	}
	@GetMapping("/create")
	public void create(){
	}
	
	@PostMapping("/create")
	public String create(ProjectVO p1, RedirectAttributes rttr1){
		log.info("create: "+ p1);
		ps1.create(p1);
		rttr1.addFlashAttribute("result", p1.getProj_id());
		return "redirect:/project/create_comp";
	}
	
	@GetMapping("/read")
	public void read(@RequestParam("proj_id") String proj_id, Model model1){
		log.info("/read");
		model1.addAttribute("project", ps1.read(proj_id));
	}
	
	@PostMapping("/update")
	public String update(ProjectVO p1, RedirectAttributes rttr1){
		log.info("update : " + p1);
		
		if(ps1.update(p1)){
			rttr1.addFlashAttribute("result", "success");
		}
		return "redirect:/project/list";
	}
	@PostMapping("/delete")
	public String delete(@RequestParam("proj_id") String proj_id, RedirectAttributes rttr1){
		log.info("delete...." + proj_id);
		if(ps1.delete(proj_id)){
			rttr1.addFlashAttribute("result", "success");
		}
		return "redirect:/project/list";
	}

	private ProjectService2 projectService2;

	@GetMapping("recommend_list")
	public String projectRecommendList(Standard standard, Model model){
		int totalPage = projectService2.totalProject();
		model.addAttribute("projects", projectService2.projectList(standard));
		model.addAttribute("pageMaker", new PageDTO(standard, totalPage));
		log.info("recommend List 실행");
		return "project/project_recommend_list";
	}
}
