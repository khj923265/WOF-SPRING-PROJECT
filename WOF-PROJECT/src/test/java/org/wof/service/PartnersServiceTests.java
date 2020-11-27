package org.wof.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wof.domain.Standard;
import org.wof.mapper.PartnersMapperTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml"})
@Log4j
public class PartnersServiceTests {


/*	@Test
	public void testapplyProject() {
		service.applyProject().forEach(project -> log.info(project));
		
	}*/
	
	@Setter(onMethod_ = {@Autowired})
	private PartnersService service;
		
	//페이징 테스트
//	@Test
//	public void testListPaging() throws Exception{
//		
//		service.partnersList(new Standard(2, 10)).forEach(board -> log.info(board));
//	}


}
