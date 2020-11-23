package org.wof.service;

import static org.junit.Assert.*;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

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

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProjectServiceTests {

	@Autowired
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
	

}
