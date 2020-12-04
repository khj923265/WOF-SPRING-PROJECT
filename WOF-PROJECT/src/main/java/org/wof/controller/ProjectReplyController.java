package org.wof.controller;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.wof.domain.ProjectReplyPageVO;
import org.wof.domain.ProjectReplyVO;
import org.wof.domain.Standard;
import org.wof.service.ProjectReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ProjectReplyController {
	private ProjectReplyService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", consumes="application/json",produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ProjectReplyVO vo){
		log.info("ProjectReplyVO: "+vo);
		int insertCount = service.register(vo);
		log.info("Reply INSERT COUNT: "+insertCount);
		
		return insertCount ==1? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{pno}/{page}",
			produces={MediaType.APPLICATION_XML_VALUE,
					  MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ProjectReplyPageVO> getList(@PathVariable("page") int page, @PathVariable("pno") String pno){
		log.info("getList.....");
		Standard stand = new Standard(page,10);
		log.info(stand);
		return new ResponseEntity<>(service.getListPage(stand, pno),HttpStatus.OK);
	}
	
	@GetMapping(value = "/{rno}",
			produces={ MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ProjectReplyVO> get(@PathVariable("rno") String rno){
		log.info("Get: " +rno);
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping(value= "/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") String rno){
		log.info("remove: "+rno);
		return service.remove(rno)==1? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value ="/{rno}", 
			consumes ="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ProjectReplyVO vo, @PathVariable("rno") String rno){
		vo.setRno(rno);
		log.info("rno: "+rno);
		
		log.info("modify: "+vo);
		return service.modify(vo) ==1? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}
