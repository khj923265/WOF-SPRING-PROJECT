package org.wof.service;

import static org.junit.Assert.*;


import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;


import lombok.AllArgsConstructor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wof.domain.FollowProjectVO;
import org.wof.domain.ProjectVO;
import org.wof.mapper.ProjectMapper2;

import org.wof.domain.ProjectVO;
import org.wof.mapper.ProjectMapperTests;

import lombok.Setter;
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
	}



	/*@Test
	public void testExist() {
		log.info(ps1);
		assertNotNull(ps1);
	}*/

	/*@Test
	public void ProjectRegister(){
		ProjectVO p1 = new ProjectVO();
		p1.setProj_title("웹사이트 만들기");
		p1.setMember_no("member6");
		p1.setProj_detail("웹사이트 구현해줄 개발자, 퍼블리셔 구합니다.");

		ps1.create(p1);
		log.info("생성된 게시무의 번호: " + p1.getProj_id());
	}*/

/*	@Test
	public void GetList(){
		ps1.getlist().forEach(project -> log.info(project));
	}

	@Test
	public void ProjectRead(){
		log.info(ps1.read("project30"));
	}

	@Test
	public void ProjectDelete(){
		log.info("REMOVE RESULT: "+ps1.delete("project30"));
	}

	@Test
	public void ProjectUpdate(){
		ProjectVO p1 = ps1.read("project30");

		if(p1 == null){
			return;
		}
		p1.setProj_title("블록체인 기반 추천서비스");
		log.info("MODIFY RESULT: "+ps1.update(p1));
	}*/
}
