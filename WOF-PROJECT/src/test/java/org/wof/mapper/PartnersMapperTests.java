package org.wof.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PartnersMapperTests {

	@Setter(onMethod_ = @Autowired)
	private PartnersMapper partnersmapper;
	
	@Test
	public void testapplyProject() {
		partnersmapper.applyProject().forEach(project -> log.info(project));
	}

	@Test
	public void testpartnersSupport() {
		partnersmapper.partnersSupport().forEach(project -> log.info(project));
	}
}
