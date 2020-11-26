package org.wof.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wof.domain.PageDTO;
import org.wof.domain.PointVO;
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

	 @GetMapping("/question")
	    public String getCharging(){
		 
	    	return "qna/question";
	    }
	    
	    @PostMapping("/question")
	    public String charging(QuestionVO quest, RedirectAttributes rttr ){
	    	
	    	if(service.QuestionService(quest) == 1){
	    		rttr.addFlashAttribute("resulst", "success");
	    	}
	    	
	    	return "qna/question-list";
	    }
	    
	    @GetMapping("/question-list")
	    public String getQuestionList(QuestionVO quest, Model model, Standard standard){
		 
	    	log.info("포인트 관리 페이지(충전/인출/조회)");
	    	
	    	model.addAttribute("getList", service.ListService(standard));
	    	
	    	int total = service.getTotalService(standard);
	    	//log.info(standard);
	    	//log.info(total);
	    	model.addAttribute("pageMaker", new PageDTO(standard, total));
	    	
	    	return "qna/question-list";
	    }
	    
	    @PostMapping("/question-list")
	    public String questionList(){
	    		
	    		return "qna/question-list";
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
