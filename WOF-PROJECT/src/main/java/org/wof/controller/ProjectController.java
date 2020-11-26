package org.wof.controller;

import org.apache.ibatis.annotations.Update;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wof.domain.PageDTO;
import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;
import org.wof.service.ProjectService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/project/*")
@AllArgsConstructor
public class ProjectController {

	private ProjectService ps1;

	@GetMapping("/list")
	public void list(Standard stand,Model model1){
		log.info("list...."+stand);
		model1.addAttribute("list", ps1.getlist(stand));
		//model1.addAttribute("pageMaker", new PageDTO(stand, 123));
		
		int total = ps1.getTotal(stand);
		log.info("total: "+total);
		model1.addAttribute("pageDto", new PageDTO(stand, total));
	
	}
	
	@GetMapping("/create")
	//@PreAuthorize("isAuthenticated()")
	public void create(){
	}
	
	@GetMapping("/create_comp")
	public void create_comp(){
	}
	
	
	@PostMapping("/create")
	//@PreAuthorize("isAuthenticated()")
	public String create(ProjectVO p1, RedirectAttributes rttr1){
		log.info("create: "+ p1);
		ps1.create(p1);
		rttr1.addFlashAttribute("result", p1.getProj_id());
		return "redirect:/project/create_comp";
	}
	
	@GetMapping({"/read", "/update"})
	public void read(@RequestParam("proj_id") String proj_id, @ModelAttribute("stand") Standard stand, Model model1){
		log.info("/read, /get");
		model1.addAttribute("project", ps1.read(proj_id));
	}
	
	@PostMapping("/update")
	public String update(ProjectVO p1,@ModelAttribute("stand") Standard stand, RedirectAttributes rttr1){
		log.info("update : " + p1);
		
		if(ps1.update(p1)){
			rttr1.addFlashAttribute("result", "success");
		}
		rttr1.addAttribute("pageNum", stand.getPageNum());
		rttr1.addAttribute("amount", stand.getAmount());
		
		return "redirect:/project/list";
	}
	@GetMapping("/delete")
	public String delete(@RequestParam("proj_id") String proj_id, @ModelAttribute("stand") Standard stand, RedirectAttributes rttr1){
		log.info("delete...." + proj_id);
		if(ps1.delete(proj_id)){
			rttr1.addFlashAttribute("result", "success");
		}
		
		rttr1.addAttribute("pageNum", stand.getPageNum());
		rttr1.addAttribute("amount", stand.getAmount());
		
		return "redirect:/project/list";
	}
}
