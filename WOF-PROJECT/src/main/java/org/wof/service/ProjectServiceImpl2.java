package org.wof.service;

import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import lombok.AllArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.wof.domain.FollowProjectVO;
import org.wof.domain.MeetVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.ProjectVO;
import org.wof.domain.QuestionVO;
import org.wof.domain.Standard;
import org.wof.mapper.ProjectMapper2;

@Service
@AllArgsConstructor
public class ProjectServiceImpl2 implements ProjectService2 {

	private ProjectMapper2 projectMapper2;
	private JavaMailSender mailSender;

	@Override
	public ProjectVO projectDetail(String proj_id) {
		return projectMapper2.projectDetail(proj_id);
	}

	@Override
	public int addFollowProject(FollowProjectVO vo) {
		return projectMapper2.addFollowProject(vo);
	}

	@Override
	public int deleteFollowProject(String followproject_no) {
		return projectMapper2.deleteFollowProject(followproject_no);
	}

	@Override
	public List<ProjectVO> listFollowProject(String related_member) {
		return projectMapper2.listFollowProject(related_member);
	}
	
	@Override
	public List<ProjectVO> listRecommendProject(PartnersVO vo) {
		return projectMapper2.listRecommendProject(vo);
	}

	@Override
	public FollowProjectVO detailFollowProject(String related_project, String related_member) {
		FollowProjectVO vo = new FollowProjectVO();
		vo.setRelated_member(related_member);
		vo.setRelated_project(related_project);
		return projectMapper2.detailFollowProject(vo);
	}
	
	@Override
	public List<ProjectVO> listRecommendProjectwithpaging(PartnersVO vo, Standard stand) {
		return projectMapper2.listRecommendProjectwithpaging(vo, stand);
	}
	
	@Override
	public int addMeeting(MeetVO vo) {
		return projectMapper2.addMeeting(vo);
	}
	
	@Override
	public int deleteMeeting(String meet_id) {
		return projectMapper2.deleteMeeting(meet_id);
	}
	
	@Override
	public List<MeetVO> listMeeting(String meet_req_mem) {
		return projectMapper2.listMeeting(meet_req_mem);
	}
	
	@Override
	public int updateMeeting(MeetVO vo) {
		return projectMapper2.updateMeeting(vo);
	}
	
	@Override
	public int totalList(Standard stand) {
		return projectMapper2.totalProject(stand);
	}
	
	@Override
	public void RecommendSendMail(String loginUser, Standard stand) {
		
			Random rm = new Random();
			int total = projectMapper2.totalProject(stand);
			String project_id = "project" + (rm.nextInt(total)+1);
			ProjectVO vo = projectMapper2.projectDetail(project_id);

	       MimeMessage message = mailSender.createMimeMessage();
	       MimeMessageHelper messageHelper;
	       
	       StringBuffer contents = new StringBuffer();
	       	contents.append("<h1>WOF")
	       	.append("?????? ????????? ?????? ????????????")
	       	.append(vo.getProj_title())
	       	.append(vo.getProj_detail())
	       	.append("</h1>");

	      try {

	         messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	          messageHelper.setFrom("wof@wof.com"); // ??????????????? ??????????????? ?????? ??????????????? ??????
	          messageHelper.setTo(loginUser); // ???????????? ?????????
	          messageHelper.setSubject("[WOF] ??????????????? ????????? ??????????????? ?????????????????????."); // ??????????????? ????????? ????????????
	          messageHelper.setText(contents.toString()); // ?????? ??????

	      } catch (MessagingException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	       mailSender.send(message);
	}
	
	@Override
	public void QnaSendMail(QuestionVO vo) {
	       MimeMessage message = mailSender.createMimeMessage();
	       MimeMessageHelper messageHelper;
	       String contents = vo.getQuest_writer()+"??? ??? ?????????????????????.";
	       contents += "[" + vo.getQuest_contents() + "]";
	       contents += " phone :" + vo.getQuest_userphone() + "???????????? ???????????? ??????????????????.";
	       
	      try {
	    	  
	         messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	          messageHelper.setFrom(vo.getQuest_id()); // ??????????????? ??????????????? ?????? ??????????????? ??????
	          messageHelper.setTo("wof.company.kosta@gmail.com"); // ???????????? ?????????
	          messageHelper.setSubject(vo.getQuest_title() + "[????????????"+vo.getQuest_writer()+"???]"); // ??????????????? ????????? ????????????
	          messageHelper.setText(contents); // ?????? ??????

	      } catch (MessagingException e) {
	         e.printStackTrace();
	      }
	       mailSender.send(message);
		
	}



}