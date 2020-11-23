package org.wof.mapper;

import static org.junit.Assert.*;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import org.wof.domain.FollowPartnersVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.Standard;

import lombok.AllArgsConstructor;
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
	
	@Setter(onMethod_ = @Autowired)
	private PartnersMapper mapper;
	
//	@Test
//	public void testPartnersList(){
//		mapper.partnersList().forEach(mem_id -> log.info(mem_id));
//	}
	
//	@Test
//	public void testFollowDelete(){
//		FollowPartnersVO followPartnersVO = new FollowPartnersVO();
//		followPartnersVO.setSource_member("member7");
//		followPartnersVO.setTarget_member("member26");
//		mapper.followNo(followPartnersVO);
//	}
	
	//페이징 테스트
//	@Test
//	public void testPaging(){
//		Standard std = new Standard();
//		//10 개씩 3페이지
//		std.setPageNum(2);
//		std.setAmount(10);
//		
//		List<PartnersVO> list = mapper.partnersList(std);
//		
//		list.forEach(board -> log.info(board.getMember_no()));
//	}
	
//	@Test
//	public void testFollowList(){
//		Standard standard = new Standard();
//		
//		//member7
//		List<PartnersVO> follows = mapper.followList("member7", standard);
//		
//		follows.forEach(follow -> log.info(follow));
//	}
	
	public void testFollowList2(){
		Standard standard = new Standard(1, 10);
		
		//member7
		List<PartnersVO> follows = mapper.followList("member7", standard);
		
		follows.forEach(follow -> log.info(follow));
	}

}
