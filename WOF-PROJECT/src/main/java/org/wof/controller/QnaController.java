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
import org.wof.domain.PointVO;
import org.wof.domain.QuestAttachVO;
import org.wof.domain.QuestionVO;
import org.wof.domain.Standard;
import org.wof.mapper.QnaMapper;
import org.wof.service.PointService;
import org.wof.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/qna/*")
public class QnaController {
	
	private QnaService service;
	    
	    @GetMapping("/question-list")
	    public void getQuestionList(QuestionVO quest, Model model, Standard standard){
		 
	    	log.info("question-list" + standard);
	    	
	    	model.addAttribute("getList", service.ListService(standard));
	    	
	    	int total = service.getTotalService(standard);
	    	
	    	log.info("total: " + total);
	    	
	    	model.addAttribute("pageMaker", new PageDTO(standard, total));
	    }
	    
	    @GetMapping("/question-register")
	    //@Secured({"ROLE_PARTNERS"})
	    public void questionRegister(){
	    	
	    }
	    
	    @PostMapping("/question-register")
	    //@PreAuthorize("hasRole('ROLE_PARTNERS','ROLE_CLIENTS')")
	    public String questionRegister(QuestionVO quest, RedirectAttributes rttr){
		 
	    	log.info("================ 문의사항 내역 ================");
	    	log.info("question-register" + quest);
			
	    	if(quest.getAttachList() != null) {
				quest.getAttachList().forEach(attach -> log.info(attach));
			}   	
	    	log.info("==========================================");
	    	
	    	service.registerService(quest);
	    	
	    	rttr.addFlashAttribute("result", quest.getQuest_no());
	    	
	    	return "redirect:/qna/question-list";
	    	
	    }
	    
	    @GetMapping({"/question_get"})
		public void get(@RequestParam("quest_no") Long quest_no, @ModelAttribute("standard") Standard standard, Model model) {
			
			log.info("/question_get");
			
			model.addAttribute("quest", service.getService(quest_no));
		}
	    
	   
		@PostMapping("/question_remove")
		//@PreAuthorize("principal.username == #writer")
	    public String questionRemove(@RequestParam("quest_id") Long quest_no, Standard standard, RedirectAttributes rttr, String writer) {
			log.info("remove" + quest_no);
			
			List<QuestAttachVO> attachList = service.getAttachListService(quest_no);
					
			
			if(service.removeService(quest_no)) {
				
				deleteFiles(attachList);
				
				rttr.addFlashAttribute("result", "success");
			}
			
			return "redirect:/qna/question-list" + standard.getListLink();
		}
	    

		@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<QuestAttachVO>> getAttachList(Long quest_no) {
			
			log.info("getAttachList" + quest_no);
			
			return new ResponseEntity<>(service.getAttachListService(quest_no), HttpStatus.OK);
		}
		
		public void deleteFiles(List<QuestAttachVO> attachList) {
			if(attachList == null || attachList.size() == 0) {
				return;
			}
			
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
					log.error("=====업로드 실패=====" + e.getMessage());
				}
			});
		}
		
		
	    @GetMapping("/answer")
	    public String answer(){
		 
	    	return "qna/answer-list";
	    }
	    
	    @PostMapping("/answer")
	    public String answerList(){
	    		
	    		return "qna/answer-list";
	    }
}
