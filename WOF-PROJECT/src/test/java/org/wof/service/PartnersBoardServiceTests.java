package org.wof.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wof.domain.PartnersBoardVO;
import org.wof.domain.Standard;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PartnersBoardServiceTests {

	@Setter(onMethod_ = @Autowired)
	private PartnersBoardService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}

	
	@Test
	public void testRegister() {
		
		PartnersBoardVO pboard = new PartnersBoardVO();
		
		pboard.setTitle("new 글");
		pboard.setWriter("member27");
		pboard.setContent("new 글");
		
		service.register(pboard);
		
		log.info("새로 작성 : " + pboard.getBno());
	}
	
/*	@Test
	public void testGetList() {
		service.getList().forEach(pboard -> log.info(pboard));
	}*/
	
	@Test
	public void testGetlist() {
		service.getList(new Standard(2, 10)).forEach(pboard -> log.info(pboard));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(2L));
	}
	
	@Test
	public void tsetUpdate() {
		PartnersBoardVO pboard = service.get(2L);
		
		if(pboard == null) {
			return;
		}
		
		pboard.setTitle("제목 수정");
		log.info("Modify result" + service.modify(pboard));
	}
}
