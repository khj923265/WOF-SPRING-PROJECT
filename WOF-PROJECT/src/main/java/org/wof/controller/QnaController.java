package org.wof.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wof.domain.PointVO;
import org.wof.service.PointService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/qna/*")
public class QnaController {

	 @GetMapping("/question")
	    public String getCharging(){
		 
	    	return "qna/question";
	    }
	    
	    @PostMapping("/question")
	    public String charging(){
	    		
	    		return "qna/question-list";
	    }
	    
	    @GetMapping("/question-list")
	    public String getQuestionList(){
		 
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
