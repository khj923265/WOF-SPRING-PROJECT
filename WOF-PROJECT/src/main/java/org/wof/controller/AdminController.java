package org.wof.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wof.domain.NoticeVO;
import org.wof.domain.PageDTO;
import org.wof.domain.Standard;
import org.wof.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@RequestMapping("/admin/*")
@Controller
@AllArgsConstructor
@Log4j
public class AdminController {
	
	private AdminService adminService;

	@GetMapping("/dashboard_admin")
	public void dashboard_admin(Standard standard, Model model) {
		log.info("관리자 페이지 확인");
		
		model.addAttribute("totalProject", adminService.getTotal2());
		model.addAttribute("TotalMember", adminService.TotalMember());
		model.addAttribute("RegisterCompany", adminService.RegisterCompany());
		
		int total = adminService.CompanyListTotal(standard);
		log.info(total);
		model.addAttribute("CompanyList", adminService.CompanyList(standard));
		model.addAttribute("pageMaker", new PageDTO(standard, total));
	}
	
	
	@GetMapping("/admin_notice")
	public void list(Standard standard, Model model) {
		
		log.info("공지사항 리스트");
		model.addAttribute("list", adminService.noticeList(standard));
		
		int total = adminService.getTotal(standard);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(standard, total));
		
		
	}
	
	@GetMapping("/notice_register")
	public void register() {
		
	}
	
	@PostMapping("/notice_register")
	public String register(NoticeVO noticeVO, RedirectAttributes rttr) {
		
		adminService.register(noticeVO);
		
		rttr.addFlashAttribute("result", noticeVO.getNno());
		
		return "redirect:/admin/admin_notice";
		
	}
	
	@GetMapping({"/notice_get", "/notice_modify"})
	public void get(Model model, @RequestParam("nno") int nno, @ModelAttribute("standard") Standard standard) {
		log.info("get/////modify");
		model.addAttribute("noticeVO", adminService.get(nno));
	}
	
	@PostMapping("/notice_remove")
	public String remove(@RequestParam("nno") int nno, @ModelAttribute("standard") Standard standard, RedirectAttributes rttr, String nwriter) {
		
		
		if(adminService.remove(nno)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", standard.getPageNum());
		rttr.addAttribute("amount", standard.getAmount());
		
		return "redirect:/admin/admin_notice";
	}
	
	@PostMapping("/notice_modify")
	public String modify(NoticeVO noticeVO, @ModelAttribute("standard") Standard standard, RedirectAttributes rttr) {
		
		if(adminService.modify(noticeVO)) {
			rttr.addFlashAttribute("result", "success");
			
		}
		
		rttr.addAttribute("pageNum", standard.getPageNum());
		rttr.addAttribute("amount", standard.getAmount());
		
	
		return "redirect:/admin/admin_notice";
	}
}
