package org.wof.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wof.domain.FollowProjectVO;
import org.wof.mapper.ProjectMapper2;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProjectServiceTests {

	@Autowired
	private ProjectService2 service2;
	
/*	@Test
	public void addFollowService(){
		FollowProjectVO vo = new FollowProjectVO();
		vo.setFollowproject_no("followproject2");
		vo.setRelated_member("member28");
		vo.setRelated_project("project2");
		
		log.info(service2.addFollowProject(vo));
	}*/
	
	@Test
	public void deleteFollowProject(){
		log.info(service2.deleteFollowProject("project2"));
	}

}
