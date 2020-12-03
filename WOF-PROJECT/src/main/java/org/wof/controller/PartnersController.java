package org.wof.controller;

import java.security.Principal;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wof.domain.ApplyVO;
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
		log.info("지원한 프로젝트 list" + member_no);
		model.addAttribute("project_apply_detail", partnersService.applyProject(member_no, standard));
		
		int total = partnersService.applyProjectTotal(standard);

		log.info("apply Project count" + total);
		
		model.addAttribute("pageMaker", new PageDTO(standard, total));
	}
	
	@GetMapping("/dashboard_partners")
	public void dashboardpartnersApplyProject(Model model, @RequestParam("member_no") String member_no) {
		log.info("파트너스 대쉬보드 지원 리스트");
		model.addAttribute("dashboardpartnersApplyProject", partnersService.dashboardpartnersApplyProject(member_no));
	}
	
	//파트너스 전체 목록
	@RequestMapping("/list")
	public void partnersList(
			@RequestParam("member_no") String member_no, Model model, Standard standard){
		
		if(standard.getKeyword() != null){
			standard.getKeyword().trim();//키워드 공백제거
		}

		log.info("list: "+standard);
		model.addAttribute("partnersList", partnersService.partnersList(member_no, standard));
		
		int total = partnersService.getTotal(standard);
		
		log.info("total: "+total);
		
		model.addAttribute("pageMaker", new PageDTO(standard, total));
	}
	
	//관심파트너스로 추가한 파트너스 목록
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
	
	//관심파트너스 추가시 기존 추가여부 중복체크
	@RequestMapping("/followCheck")
	@ResponseBody
	public String followCheck(
			@RequestBody FollowPartnersVO followPartnersVO){
		
		log.info("/followCheck..." + followPartnersVO);
		
		return partnersService.followCheck(followPartnersVO);
	}
	
	//관심파트너스 추가
	@RequestMapping("/followYes")
	public ResponseEntity<String> followYes(
			@RequestBody FollowPartnersVO followPartnersVO){
		
		log.info("/followYes..." + followPartnersVO);
		
		int insertCount = partnersService.followYes(followPartnersVO);
		
		return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//관심파트너스 삭제
	@RequestMapping("/followNo")
	public ResponseEntity<String> followNo(
			@RequestBody FollowPartnersVO followPartnersVO){
		
		log.info("/followNo..." + followPartnersVO);
		
		int deleteCount = partnersService.followNo(followPartnersVO);
		
		return deleteCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//추천 파트너스 목록
	@RequestMapping("/recommend")
	public void recommend(
			@RequestParam("member_no") String member_no, Model model, Standard standard){
		log.info("controller recommendList: " + partnersService.recommend(member_no, standard));
		
		int recommendTotal = partnersService.recommendCount(member_no, standard);
		log.info("recommendTotal: "+recommendTotal);
		model.addAttribute("pageMaker", new PageDTO(standard, recommendTotal));
		
		model.addAttribute("recommendList", partnersService.recommend(member_no, standard));
	}
	
	//클라이언트가 등록한 프로젝트들에 지원한 지원자 count
	@RequestMapping("/applystate")
	public void applyState(
			@RequestParam("member_no") String member_no, Model model, Standard standard) {
		log.info("Controller applyState : " + member_no);
		model.addAttribute("applyState", partnersService.applyState(member_no,standard));
		
		int total = partnersService.applyStateTotal(standard);
		
		log.info("페이징 : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(standard, total));
	}
	
	//하나의 프로젝트에 지원한 파트너스의 목록
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
	
	//하나의 프로젝트에 지원한 파트너스 중 선택
	@RequestMapping("/applyRegister")
	public String applyRegister(String[] member_no, String proj_id, RedirectAttributes rttr) {
		
		log.info("applyRegister Controller : " + member_no + proj_id);
		
		partnersService.applyRegister(member_no, proj_id);
		rttr.addAttribute("proj_id", proj_id);
		
		return "redirect:/partners/appliedpartners";
	}
	
	//기존 선택한 파트너스 여부 중복체크
	@RequestMapping("/applyCheck")
	@ResponseBody
	public String applyCheck(
			@RequestBody ApplyVO applyVO){
		
		log.info("/applyCheck..." + applyVO);
		
		return partnersService.applyCheck(applyVO);
	}
	
	//하나의 프로젝트에 지원한 파트너스 삭제
	@RequestMapping("/applyDelete")
	public String applyDelete(
			String[] member_no, String proj_id, String source_no, RedirectAttributes rttr) {
		
		log.info("apply delete : " + member_no + "/" + proj_id);
		
		String proj_idArr[] = proj_id.split(",");
		partnersService.applyDelete(member_no, proj_idArr);
		
		rttr.addAttribute("member_no", source_no);
		
		return "redirect:/partners/appliedpartners";
	}
	
	@RequestMapping("/appliedpartners")
	public void appliedPartners(Model model, @RequestParam("member_no") String member_no, Standard standard) {
		
		log.info("applied partners=============================");
		
		int total = partnersService.appliedpartnersTotal(standard);
		
		model.addAttribute("appliedpartners", partnersService.appliedPartners(member_no, standard));
		model.addAttribute("pageMaker", new PageDTO(standard, total));
	}
	
}
