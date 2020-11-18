package org.wof.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.wof.domain.FollowProjectVO;
import org.wof.service.ProjectService2;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class ProjectRestController {
	
	@Autowired
	private ProjectService2 projectService2;
	
	@PostMapping("/project/follwProject/{related_project}")
	public ResponseEntity<Integer> addFollowProject(@PathVariable String related_project){
		log.info("rest controller add" + related_project);
		projectService2.addFollowProject(related_project);
		return new ResponseEntity<Integer>(1, HttpStatus.OK);
	}
	
	@DeleteMapping("/project/follwProject/{related_project}")
	public ResponseEntity<Integer> removeFollowProject(@PathVariable String related_project){
		log.info("rest controller delete" + related_project);
		projectService2.deleteFollowProject(related_project);
		return new ResponseEntity<Integer>(1, HttpStatus.OK);
	}
	

}
