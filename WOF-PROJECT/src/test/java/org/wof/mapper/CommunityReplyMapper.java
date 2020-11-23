package org.wof.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wof.domain.CommunityReplyVO;
import org.wof.domain.Standard;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CommunityReplyMapper {
	
	@Setter(onMethod_ = @Autowired)
	private CommunityReplyMapper mapper;

	@Test
	public void testMapper() {
		log.info(mapper);
	}
/*
	@Test
	public void testList2() {
		Standard st = new Standard(2, 10);
		
		List<CommunityReplyVO> replies = mapper.get
		
	}*/
}
