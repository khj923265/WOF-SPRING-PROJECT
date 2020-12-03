package org.wof.mapper;

import static org.junit.Assert.*;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wof.domain.ProjectReplyVO;
import org.wof.domain.Standard;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml"})
@Log4j
public class ProjectReplyMapperTests {

	private String[] projArr = {"project30","project43","project42","project41","project29"};
	private String[] memArr = {"member84", "member92", "member101","member89", "member51"};

	
	@Setter(onMethod_ = @Autowired)
	private ProjectReplyMapper mapper;
	
	/*@Test
	public void testMapper() {
		log.info(mapper);
	}*/
	
	/*@Test
	public void testCreate(){
		IntStream.rangeClosed(1, 10).forEach(i -> {
			ProjectReplyVO vo = new ProjectReplyVO();
			

			vo.setProj_id(projArr[i%5]);
			vo.setProj_reply_cont("이것은 댓글입니다." +i);
			vo.setProj_reply_date("2020-11-30");
			vo.setMember_no(memArr[i%5]);
			
			mapper.insert(vo);
		});
	}*/
	
	/*@Test
	public void testRead(){
		String targetRno = "p_reply1";
		ProjectReplyVO vo = mapper.read(targetRno);
		log.info(vo);
	}

	@Test
	public void testDelete(){
		String p_rno = "p_rno1";
		mapper.delete(p_rno);
	}*/
	
	@Test
	public void testUpdate(){
		String targetRno = "p_rno2";
		ProjectReplyVO vo = mapper.read(targetRno);
		vo.setProj_reply_cont("update reply test");
		int count = mapper.update(vo);
		log.info("update count : " +count);
	}
	
	/*@Test
	public void testList(){
		Standard stand = new Standard();
		List<ProjectReplyVO> replies = mapper.getListWithPaging(stand, projArr[0]);
		replies.forEach(reply -> log.info(reply));
	}*/
}
