package org.wof.mapper;

import static org.junit.Assert.*;

import java.util.List;

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
public class PartnersBoardTests {

	@Setter(onMethod_ = @Autowired)
	private PartnersBoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(partnersboard -> log.info(partnersboard));
	}
	
	@Test
	public void testInsert() {
		PartnersBoardVO pboard = new PartnersBoardVO();
		
		pboard.setTitle("테스트 11/18");
		pboard.setWriter("member27");
		pboard.setContent("test");
		
		mapper.insert(pboard);
		log.info(pboard);
	}
	
	@Test
	public void testRead() {
		PartnersBoardVO pboard = mapper.read(2L);
		
		log.info(pboard);
	}

	@Test
	public void testDelete() {
		log.info("delete : " + mapper.delete(3L));
	}
	
	@Test
	public void testUpdate() {
		PartnersBoardVO pboard = new PartnersBoardVO();
		
		pboard.setBno(5L);
		pboard.setTitle("수정");
		pboard.setWriter("수정이");
		pboard.setContent("ㅋㅋ");
		
		int count = mapper.update(pboard);
		log.info("update : " + count);
	}
	
	@Test
	public void testPaging() {
		Standard st = new Standard();
		st.setPageNum(3);
		st.setAmount(10);
		List<PartnersBoardVO> list = mapper.getListWithPaging(st);
		
		list.forEach(pboard -> log.info(pboard));
	}
	
	@Test
	public void testSeach() {
		Standard st = new Standard();
		st.setKeyword("123");
		st.setType("TC");
		
		List<PartnersBoardVO> list = mapper.getListWithPaging(st);
		
		list.forEach(pboard -> log.info(pboard));
	}
 }
