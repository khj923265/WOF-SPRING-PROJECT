package org.wof.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
		
		qnaMapper.insertSelectKey(quest);
		
		quest.setQuest_ans_check(0);
		quest.setQuest_deleted(0);
		log.info("==========================");
		
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
		
			log.info("====파일 업로드 ====" + quest_no);
			
		return attachMapper.findByQuest_no(quest_no);
	}


	

}
