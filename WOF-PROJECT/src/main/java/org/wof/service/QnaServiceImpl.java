package org.wof.service;

import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.wof.domain.QuestAttachVO;
import org.wof.domain.QuestionVO;
import org.wof.domain.Standard;
import org.wof.mapper.QnaMapper;
import org.wof.mapper.QuestAttachMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class QnaServiceImpl implements QnaService {

	@Setter(onMethod_= @Autowired)
	private QnaMapper qnaMapper;
	
	@Setter(onMethod_= @Autowired)
	private QuestAttachMapper attachMapper;
	
	@Inject
    JavaMailSender mailSender; 
	
	//Date date = new Date();
	//String currentDate = new SimpleDateFormat("yy-MM-dd").format(date);
	
	@Override
	public List<QuestionVO> ListService(Standard standard) {
		
		log.info("========= list paging =========");
		log.info(standard);
		log.info("=======================");
		
		return qnaMapper.getListPaging(standard);
	}

	@Override
	public int getTotalService(Standard standard) {
		
		log.info("=======================");
		log.info("get total count");
		log.info("=======================");

		return qnaMapper.getTotalCount(standard);
	}
	
	//@Transactional
	@Override
	public void registerService(QuestionVO quest) {
		log.info("======== register ========" + quest);
		
		//qnaMapper.insertSelectKey(quest);
		
		qnaMapper.insert(quest);
		
		quest.setQuest_ans_check(0);
		quest.setQuest_deleted(0);
		log.info("==========================");
		
		
		 try {
	            MimeMessage msg = mailSender.createMimeMessage();
	 
	            // 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
	            msg.addRecipient(RecipientType.TO, new InternetAddress(quest.getReceiveMail()));
	 
	            /*
	             * createMimeMessage() : MimeMessage객체를 생성시킴 (이것을 이용해서 메시지를 구성한 뒤 메일 발송)
	             * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :
	             * 수신자 이메일 주소
	             */
	 
	            // 보내는 사람(이메일주소+이름)
	            // (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
	            // 이메일 발신자
	            msg.addFrom(new InternetAddress[] { new InternetAddress(quest.getSenderMail(), quest.getQuest_writer()) });
	 
	            // 이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
	            msg.setSubject(quest.getQuest_title(), "utf-8");
	            // 이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
	            msg.setText(quest.getQuest_contents(), "utf-8");
	 
//	            html�� ���� ���            
//	            MimeMessage message = mailSender.createMimeMessage();
//	            MimeMessageHelper helper 
//	            = new MimeMessageHelper(message, true);
//	            helper.setTo("test@host.com");
//	            helper.setText("<html><body><img src='cid:identifier1234'></body></html>", true);
	 
	            // 이메일 보내기
	            // �̸��� ������
	            mailSender.send(msg);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

//		int questionResult = qnaMapper.Question(quest);

		/*if(quest.getAttachList() == null || quest.getAttachList().size() <= 0) {
			return;
		}
		
		quest.getAttachList().forEach(attach -> {
			attach.setQuest_no(quest.getQuest_id());
			attachMapper.insert(attach);
		});*/
	}

	@Override
	public QuestionVO getService(Long quest_no) {
	
		log.info("========= get =========");
		log.info(quest_no);
		log.info("=======================");
		
		return qnaMapper.read(quest_no);
	}

	//@Transactional
	@Override
	public boolean removeService(Long quest_no) {
		
		log.info("========= remove =========");
		log.info(quest_no);
		log.info("=======================");
		
		return qnaMapper.delete(quest_no) == 1;
	}

	@Override
	public List<QuestAttachVO> getAttachListService(Long quest_no) {
		
			log.info("====파일 업로드 ====" + quest_no);
			
		return attachMapper.findByQuest_no(quest_no);
	}


	

}
