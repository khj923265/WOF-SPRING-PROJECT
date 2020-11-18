package org.wof.service;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.wof.domain.ProjectVO;
import org.wof.mapper.ProjectMapper2;

@Service
public class ProjectServiceImpl2 implements ProjectService2 {
	
	@Autowired
	private ProjectMapper2 projectMapper;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public List<ProjectVO> projectList() {
		return projectMapper.ProjectList();
	}
	
	@Override
	public void RecommendSendMail(ProjectVO projectVO) {
	       MimeMessage message = mailSender.createMimeMessage();
	       MimeMessageHelper messageHelper;
	      try {
	         messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	          messageHelper.setFrom("jaeeun@naver.com"); // 보내는사람 생략하거나 하면 정상작동을 안함
	          messageHelper.setTo("jaeeunlim0329@gmail.com"); // 받는사람 이메일
	          messageHelper.setSubject("[WOF] 고객님에게 알맞은 프로젝트를 추천해드립니다."); // 메일제목은 생략이 가능하다
	          messageHelper.setText("내용 test"); // 메일 내용
	          
	      } catch (MessagingException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	       mailSender.send(message);	
	}
	


}