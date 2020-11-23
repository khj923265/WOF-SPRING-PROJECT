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

	private ProjectService2 service2;

	
	@Autowired
	private JavaMailSender mailSender;
	
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
/*		Random rm = new Random();
		int total = projectMapper2.totalProject();
		String project_id = "project" + (rm.nextInt(total)+1);
		*/
		ProjectVO vo = service2.projectList2("project24");
		
       MimeMessage message = mailSender.createMimeMessage();
       MimeMessageHelper messageHelper;
       String contents = "";
       contents += "<html><head><body>";
       contents = "<a href='#'>WOF 홈페이지로 이동하기</a>";
       contents += "<h2>고객님에게 제안드리는 오늘의 프로젝트</h2>";
       contents += "<b>"+vo.getProj_title()+"</b><br>";
       contents += "<b>"+ vo.getProj_detail()+ "</b><br>";
       contents += "<p>WOF</p></body></html>";
      try {
    	  
         messageHelper = new MimeMessageHelper(message, true, "UTF-8");
          messageHelper.setFrom("jaeeun@naver.com"); // 보내는사람 생략하거나 하면 정상작동을 안함
          messageHelper.setTo("jaeeunlim0329@gmail.com"); // 받는사람 이메일
          messageHelper.setSubject("[WOF] 고객님에게 알맞은 프로젝트를 추천해드립니다."); // 메일제목은 생략이 가능하다
          messageHelper.setText(contents); // 메일 내용
          
      } catch (MessagingException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
       mailSender.send(message);	
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
