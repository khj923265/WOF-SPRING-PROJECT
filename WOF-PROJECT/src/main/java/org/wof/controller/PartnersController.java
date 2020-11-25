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


@RequestMapping("/partners/*")
@Controller
@AllArgsConstructor
@Log4j
public class PartnersController {

	private PartnersService partnersService;
	
	@GetMapping("/project_apply_detail")
	public void project_apply_detail(Model model, Standard standard, @RequestParam("member_no") String member_no) {
		log.info("지원한 프로젝트 list");
		model.addAttribute("project_apply_detail", partnersService.applyProject(member_no, standard));
	}
	
	@GetMapping("/partners_support")
	public void partnersSupport(Model model) {
		log.info("파트너스 지원 현황 list");
		model.addAttribute("partnersSupport", partnersService.partnersSupport());
	}
	
	@GetMapping("/dashboard_partners")
	public void dashboardpartnersApplyProject(Model model, @RequestParam("member_no") String member_no) {
		log.info("파트너스 대쉬보드 지원 리스트");
		model.addAttribute("dashboardpartnersApplyProject", partnersService.dashboardpartnersApplyProject(member_no));
	}
	
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
	
<<<<<<< HEAD

=======
	@RequestMapping("/recommend")
	public void recommend(
			@RequestParam("member_no") String member_no, Model model){
		log.info("controller recommendList: " + partnersService.recommend(member_no));
		model.addAttribute("recommendList", partnersService.recommend(member_no));
	}
	
>>>>>>> fdac15a0971af09718703a4b504b1c3a9403a641
	
	

}
