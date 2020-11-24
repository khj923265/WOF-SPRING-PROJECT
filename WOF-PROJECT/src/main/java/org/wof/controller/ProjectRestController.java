package org.wof.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.wof.domain.FollowProjectVO;
import org.wof.service.ProjectService2;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.core.JsonParser;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class ProjectRestController {
	
	@Autowired
	private ProjectService2 projectService2;
	
	@PostMapping("follwProject/{related_project}")
	public ResponseEntity<Integer> addFollowProject(Model model,@PathVariable String related_project,String related_member){
		log.info("rest controller add " + related_project);
		FollowProjectVO vo = new FollowProjectVO();
		vo.setRelated_project(related_project);
		vo.setRelated_member(related_member);
		int result = projectService2.addFollowProject(vo);
		if (result == 1){
			return new ResponseEntity<Integer>(1, HttpStatus.OK);
		}else return new ResponseEntity<Integer>(500, HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@DeleteMapping("follwProject/{related_project}/{related_member}")
	public ResponseEntity<Integer> removeFollowProject(Model model,@PathVariable String related_project, @PathVariable String related_member){
		log.info("rest controller delete " + related_project);
		FollowProjectVO vo = new FollowProjectVO();
		vo.setRelated_project(related_project);
		vo.setRelated_member(related_member);
		vo = projectService2.detailFollowProject(vo);
		return new ResponseEntity<Integer>(1, HttpStatus.OK);
	}
	

}
