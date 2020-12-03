package org.wof.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wof.domain.ContractVO;
import org.wof.service.ContractService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/contract/*")
@Controller
@AllArgsConstructor
@Log4j
public class ContractController {
	
	private ContractService contractService;
	
	@RequestMapping("/read")
	public void sourceWrite(
			@RequestParam("source_no") String source_no, 
			@RequestParam("target_no") String target_no, 
			@RequestParam("proj_id") String proj_id, Model model){
		
		model.addAttribute("source", contractService.contractSource(source_no, proj_id));
		model.addAttribute("target", contractService.contractTarget(target_no));		
	}
	
	@RequestMapping("/sourceregister")
	public String sourceRegister(ContractVO contract, RedirectAttributes attr){
		
		contractService.sourceRegister(contract);
		attr.addAttribute("proj_id", contract.getRelated_proj());
		
		return "redirect:/partners/appliedpartners";
	}

}
