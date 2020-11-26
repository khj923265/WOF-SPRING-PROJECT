package org.wof.controller;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.wof.domain.ProjectReplyVO;
import org.wof.domain.Standard;
import org.wof.service.ProjectReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/reply/")
@RestController
@Log4j
@AllArgsConstructor
public class ProjectReplyController {
	private ProjectReplyService service;
	
	@PostMapping(value = "/new", consumes="application/json",produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ProjectReplyVO vo){
		log.info("ProjectReplyVO: "+vo);
		int insertCount = service.register(vo);
		log.info("Reply INSERT COUNT: "+insertCount);
		
		return insertCount ==1? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{proj_id}/{page}",
			produces={MediaType.APPLICATION_XML_VALUE,
					  MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ProjectReplyVO>> getList(@PathVariable("page") int page, @PathVariable("proj_id") String proj_id){
		log.info("getList.....");
		Standard stand = new Standard(page,10);
		log.info(stand);
		return new ResponseEntity<>(service.getList(stand, proj_id),HttpStatus.OK);
	}
	
	@GetMapping(value = "/{p_rno}",
			produces={ MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ProjectReplyVO> get(@PathVariable("p_rno") String p_rno){
		log.info("Get: " +p_rno);
		return new ResponseEntity<>(service.get(p_rno), HttpStatus.OK);
	}
	
	@DeleteMapping(value= "/{p_rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("p_rno") String p_rno){
		log.info("remove: "+p_rno);
		return service.remove(p_rno)==1? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value ="/{p_rno}", 
			consumes ="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ProjectReplyVO vo, @PathVariable("p_rno") String p_rno){
		vo.setProj_reply_no(p_rno);
		log.info("p_rno: "+p_rno);
		
		log.info("modify: "+vo);
		return service.modify(vo) ==1? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}