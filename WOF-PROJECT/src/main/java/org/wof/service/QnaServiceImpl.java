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
		
<<<<<<< HEAD
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
=======
		log.info("ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½1:1ï¿½ï¿½ï¿½Ç¢ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ question..." + quest);
>>>>>>> 853f2004e6122174ee00b08d41fe70ac9879a777
		
		log.info("======== register ========" + quest);
		
		qnaMapper.insertSelectKey(quest);
		
		quest.setQuest_ans_check(0);
		quest.setQuest_deleted(0);
		log.info("==========================");
		
		
		 try {
	            // ÀÌ¸ŞÀÏ °´Ã¼
	            MimeMessage msg = mailSender.createMimeMessage();
	 
	            // ¹Ş´Â »ç¶÷À» ¼³Á¤ (¼ö½ÅÀÚ, ¹Ş´Â»ç¶÷ÀÇ ÀÌ¸ŞÀÏ ÁÖ¼Ò °´Ã¼¸¦ »ı¼ºÇØ¼­ ¼ö½ÅÀÚ ÀÌ¸ŞÀÏÁÖ¼Ò¸¦ ´ãÀ½)
	            msg.addRecipient(RecipientType.TO, new InternetAddress(quest.getReceiveMail()));
	 
	            /*
	             * createMimeMessage() : MimeMessage°´Ã¼¸¦ »ı¼º½ÃÅ´ (ÀÌ°ÍÀ» ÀÌ¿ëÇØ¼­ ¸Ş½ÃÁö¸¦ ±¸¼ºÇÑ µÚ ¸ŞÀÏ ¹ß¼Û)
	             * addRecipient() : ¸Ş½ÃÁöÀÇ ¹ß½ÅÀÚ¸¦ ¼³Á¤ InternetAddress() : ÀÌ¸ŞÀÏ ÁÖ¼Ò getReceiveMail() :
	             * ¼ö½ÅÀÚ ÀÌ¸ŞÀÏ ÁÖ¼Ò
	             */
	 
	            // º¸³»´Â »ç¶÷(ÀÌ¸ŞÀÏÁÖ¼Ò+ÀÌ¸§)
	            // (¹ß½ÅÀÚ, º¸³»´Â »ç¶÷ÀÇ ÀÌ¸ŞÀÏ ÁÖ¼Ò¿Í ÀÌ¸§À» ´ãÀ½)
	            // ÀÌ¸ŞÀÏ ¹ß½ÅÀÚ
	            msg.addFrom(new InternetAddress[] { new InternetAddress(quest.getSenderMail(), quest.getQuest_writer()) });
	 
	            // ÀÌ¸ŞÀÏ Á¦¸ñ (ÀÎÄÚµùÀ» ÇØ¾ß ÇÑ±ÛÀÌ ±úÁöÁö ¾ÊÀ½)
	            msg.setSubject(quest.getQuest_title(), "utf-8");
	            // ÀÌ¸ŞÀÏ º»¹® (ÀÎÄÚµùÀ» ÇØ¾ß ÇÑ±ÛÀÌ ±úÁöÁö ¾ÊÀ½)
	            msg.setText(quest.getQuest_contents(), "utf-8");
	 
//	            html·Î º¸³¾ °æ¿ì            
//	            MimeMessage message = mailSender.createMimeMessage();
//	            MimeMessageHelper helper 
//	            = new MimeMessageHelper(message, true);
//	            helper.setTo("test@host.com");
//	            helper.setText("<html><body><img src='cid:identifier1234'></body></html>", true);
	 
	            // ÀÌ¸ŞÀÏ º¸³»±â
	            mailSender.send(msg);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
<<<<<<< HEAD
=======
		//ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ È®ï¿½ï¿½ (ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½)
		int questionResult = qnaMapper.Question(quest);
>>>>>>> 853f2004e6122174ee00b08d41fe70ac9879a777
		
		if(quest.getAttachList() == null || quest.getAttachList().size() <= 0) {
			return;
		}
		
		quest.getAttachList().forEach(attach -> {
			attach.setQuest_no(quest.getQuest_id());
			attachMapper.insert(attach);
		});
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
		
			log.info("====ÆÄÀÏ ¾÷·Îµå ====" + quest_no);
			
		return attachMapper.findByQuest_no(quest_no);
	}


	

}
