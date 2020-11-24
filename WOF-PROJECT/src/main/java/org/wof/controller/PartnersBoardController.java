package org.wof.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wof.domain.CommunityAttachVO;
import org.wof.domain.PageDTO;
import org.wof.domain.PartnersBoardVO;
import org.wof.domain.Standard;
import org.wof.service.PartnersBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/community/*")
@Controller
@AllArgsConstructor
@Log4j
public class PartnersBoardController {
	private PartnersBoardService service;
	
/*	@GetMapping("/partners_community_list")
	public void list(Model model) {
		log.info("listlistlist");
		model.addAttribute("list", service.getList());
	}*/
	
	@GetMapping("/partners_community_list")
	public void list(Standard standard, Model model) {
		
		log.info("list : " + standard);
		model.addAttribute("list", service.getList(standard));
		//model.addAttribute("pageMaker", new PageDTO(st, 123));
		int total = service.getTotal(standard);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(standard, total));

	}
	
	@GetMapping("/partners_community_register")
	@Secured({"ROLE_PARTNERS"})
	public void register() {
		
	}
	
	@PreAuthorize("hasRole('ROLE_PARTNERS')")
	@PostMapping("/partners_community_register")
	public String register(PartnersBoardVO pboard, RedirectAttributes rttr) {
		
		log.info("=================================");
		log.info("register : " + pboard);
		
		
		if(pboard.getAttachList() != null) {
			pboard.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("==================================");
		
		service.register(pboard);
		
		rttr.addFlashAttribute("result", pboard.getBno());
		
		
		
		return "redirect:/community/partners_community_list";
	}
	
	@GetMapping({"/partners_community_get", "/partners_community_modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("standard") Standard standard, Model model) {
		
		log.info("/partners_community_get or modify");
		
		//service.plusCnt(bno);
		model.addAttribute("pboard", service.get(bno));
	}

	
	@PreAuthorize("principal.username == #pboard.writer")
	@PostMapping("/partners_community_modify")
	public String modify(PartnersBoardVO pboard, @ModelAttribute("standard") Standard standard, RedirectAttributes rttr) {
		log.info("modify: " + pboard);
		
		if(service.modify(pboard)) {
			rttr.addFlashAttribute("result", "success");
			//rttr.addAttribute("result", "success");
		}

		
		return "redirect:/community/partners_community_list" + standard.getListLink();
	}
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/partners_community_remove")
	public String remove(@RequestParam("bno") Long bno, Standard standard, RedirectAttributes rttr, String writer) {
		log.info("remove" + bno);
		
		List<CommunityAttachVO> attachList = service.getAttachList(bno);
		
		if(service.remove(bno)) {
			
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/community/partners_community_list" + standard.getListLink();
	}
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<CommunityAttachVO>> getAttachList(Long bno) {
		
		log.info("getAttachList" + bno);
		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	public void deleteFiles(List<CommunityAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("파일 삭제 처리");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload1\\" + attach.getUploadPath() + "\\" + attach.getUuid()+ "_" +
			attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload1\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + 
				attach.getFileName());
					
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("삭제하지 못했습니다." + e.getMessage());
			}
		});
	}
	
}
