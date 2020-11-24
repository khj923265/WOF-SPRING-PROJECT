package org.wof.controller;

import java.util.List;

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
import org.wof.domain.CommunityReplyPageDTO;
import org.wof.domain.CommunityReplyVO;
import org.wof.domain.Standard;
import org.wof.service.CommunityReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/communityreply/")
@RestController // 데이터만 전달하기 위해
@Log4j
@AllArgsConstructor
public class CommunityReplyController {

	private CommunityReplyService service;
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value= "/new", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody CommunityReplyVO vo) {
		
		log.info("댓글 : " + vo);
		
		int insertCount = service.register(vo);
		
		log.info("reply insert count" + insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/pages/{bno}/{page}", produces= {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE
	})
	public ResponseEntity<CommunityReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno) {
		
		
		Standard standard = new Standard(page, 10);
		log.info("getList.......");
		log.info(standard);
		
		return new ResponseEntity<>(service.getListPage(standard, bno), HttpStatus.OK);
		//json으로 변환하여 리스트를 리턴
	}
	
	@GetMapping(value = "/{rno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	//pathvariable은 url에 있는 값을 출력하기 위해 사용
	public ResponseEntity<CommunityReplyVO> get(@PathVariable("rno") Long rno) {
		
		log.info("get " + rno);
		
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
	@PreAuthorize("principal.username == #vo.replyer")
	@DeleteMapping(value= "/{rno}", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody CommunityReplyVO vo, @PathVariable("rno") Long rno) {
		
		log.info("댓글 삭제" + rno);
		
		log.info("replyer : " + vo.getReplyer());
		
		return service.remove(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("principal.username == #vo.replyer")
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/{rno}", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody CommunityReplyVO vo, @PathVariable("rno") Long rno) {
		
		vo.setRno(rno);
		
		log.info("댓글 수저어어어엉어어어엉" + rno);
		
		log.info("수정 : " + vo);
		
		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : 
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
