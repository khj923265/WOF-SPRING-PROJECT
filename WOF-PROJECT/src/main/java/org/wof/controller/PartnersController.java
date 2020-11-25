package org.wof.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.wof.domain.FollowPartnersVO;
import org.wof.domain.PageDTO;
import org.wof.domain.PartnersVO;
import org.wof.domain.Standard;
import org.wof.service.PartnersService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/partners/*")
@AllArgsConstructor
public class PartnersController {
	
	private PartnersService partnersService;
	
	@RequestMapping("/list")
	public void partnersList(
			@RequestParam("member_no") String member_no, Model model, Standard standard){
		
		log.info("list: "+standard);
		model.addAttribute("partnersList", partnersService.partnersList(member_no, standard));
		
		int total = partnersService.getTotal(standard);
		
		log.info("total: "+total);		
		
		model.addAttribute("pageMaker", new PageDTO(standard, total));
	}
	
	@RequestMapping("/followlist")
	public void followList(
			@RequestParam("member_no") String member_no, Model model, Standard standard){
		
		log.info("followlist: "+standard);	
		model.addAttribute("followList", partnersService.followList(member_no, standard));
		
		int followTotal = partnersService.followCount(member_no, standard);
		log.info("total: "+followTotal);
		
		model.addAttribute("member_no", member_no);
		log.info("member_no: "+member_no);
		
		model.addAttribute("pageMaker", new PageDTO(standard, followTotal));
	}
	
	@RequestMapping("/followCheck")
	@ResponseBody
	public String followCheck(
			@RequestBody FollowPartnersVO followPartnersVO){
		
		log.info("/followCheck..." + followPartnersVO);
		
		return partnersService.followCheck(followPartnersVO);
	}
	
	@RequestMapping("/followYes")
	public ResponseEntity<String> followYes(
			@RequestBody FollowPartnersVO followPartnersVO){
		
		log.info("/followYes..." + followPartnersVO);
		
		int insertCount = partnersService.followYes(followPartnersVO);
		
		return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping("/followNo")
	public ResponseEntity<String> followNo(
			@RequestBody FollowPartnersVO followPartnersVO){
		
		log.info("/followNo..." + followPartnersVO);
		
		int deleteCount = partnersService.followNo(followPartnersVO);
		
		return deleteCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping("/recommend")
	public void recommend(
			@RequestParam("member_no") String member_no, Model model){
		log.info("controller recommendList: " + partnersService.recommend(member_no));
		model.addAttribute("recommendList", partnersService.recommend(member_no));
	}
	
	@RequestMapping("/applystate")
	public void applyState(
			@RequestParam("member_no") String member_no, Model model, Standard standard) {
		log.info("Controller applyState : " + member_no);
		model.addAttribute("applyState", partnersService.applyState(member_no,standard));
	}
	
	
	@RequestMapping("/applydetail")
	public void applyDetail(
			@RequestParam("member_no") String member_no, 
			@RequestParam("proj_id") String proj_id, 
			Model model, Standard standard) {
		
		log.info("Controller applyDetail : " + member_no + proj_id);
		
		model.addAttribute("Project", partnersService.applyDetailProject(proj_id));
		
		model.addAttribute("Partners", partnersService.applyDetailPartners(proj_id, standard));
		int total = partnersService.applyPartnersTotal(proj_id);
		
		model.addAttribute("pageMaker", new PageDTO(standard, total));
	}
}
