package org.wof.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.ibatis.annotations.Update;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wof.domain.ContractTargetVO;
import org.wof.domain.PageDTO;
import org.wof.domain.ProjectAttachVO;
import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;
import org.wof.service.ProjectAttachService;
import org.wof.service.ProjectService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/project/*")
@AllArgsConstructor
public class ProjectController {

	private ProjectService ps1;
	
	private ProjectAttachService service;

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
	
	@GetMapping("/fileup")
	@PostMapping("/fileup")
	public String fileup(ProjectVO projectvo, RedirectAttributes rttr, Model model,  
			@RequestParam("member_no") String member_no, ContractTargetVO contracttargetVO) {
		
		
		log.info("fileup " + projectvo);
		
		if(projectvo.getAttachList() != null) {
			projectvo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.register(projectvo);
		
		
		model.addAttribute("checkAuth", service.checkAuth(contracttargetVO));
		
		log.info("checkAuth : " + contracttargetVO);
		rttr.addFlashAttribute("result", projectvo.getProj_id());
		rttr.addFlashAttribute("result", projectvo.getMember_no());
		
		return "redirect:/partners/project_apply_detail" + "?member_no=" + projectvo.getMember_no();
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
		
		List<ProjectAttachVO> attachList = service.getAttachList(proj_id);
		
		if(ps1.delete(proj_id)) {
			
			deleteFiles(attachList);
			
			rttr1.addFlashAttribute("result", "success");
			
		}
		return "redirect:/project/list";
	}
	
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProjectAttachVO>> getAttachList(String proj_id) {
		
		log.info("getAttachList" + proj_id);
		
		return new ResponseEntity<>(service.getAttachList(proj_id), HttpStatus.OK);
	}
	
	public void deleteFiles(List<ProjectAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("파일 삭제처리");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload1\\" + attach.getUploadPath()
				+ attach.getUuid() + "_" + attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload1\\" + attach.getUploadPath() 
					 + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
				
					Files.delete(thumbNail);
				}
				
			} catch (Exception e) {
				log.error("삭제하지 못했습니다." + e.getMessage());
			}
		});
	}

}
