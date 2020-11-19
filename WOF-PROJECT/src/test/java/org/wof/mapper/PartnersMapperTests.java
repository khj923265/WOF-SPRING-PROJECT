package org.wof.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wof.domain.FollowPartnersVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PartnersMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private PartnersMapper mapper;
	
//	@Test
//	public void testPartnersList(){
//		mapper.partnersList().forEach(mem_id -> log.info(mem_id));
//	}
	
	@Test
	public void testFollowDelete(){
		FollowPartnersVO followPartnersVO = new FollowPartnersVO();
		followPartnersVO.setSource_member("member7");
		followPartnersVO.setTarget_member("member26");
		mapper.followNo(followPartnersVO);
	}

}
