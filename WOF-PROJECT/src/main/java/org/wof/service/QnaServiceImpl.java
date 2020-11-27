package org.wof.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wof.domain.QuestionVO;
import org.wof.domain.Standard;
import org.wof.mapper.QnaMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.sql.DATE;

@Service
@Log4j
public class QnaServiceImpl implements QnaService {

	@Setter(onMethod_= @Autowired)
	private QnaMapper qnaMapper;
	
	Date date = new Date();
	String currentDate = new SimpleDateFormat("yy-MM-dd").format(date);
	
	@Override
	public int QuestionService(QuestionVO quest) {
		
		log.info("♥♥♥♥1:1문의♥♥♥♥ question..." + quest);
		
		qnaMapper.Question(quest);
		
		quest.setQuest_ans_check(0);
		quest.setQuest_deleted(0);
		
		//log.info("quest type:");
		
		//충전여부 확인 (충전 내역)
		int questionResult = qnaMapper.Question(quest);
		
		return questionResult;
	}

	@Override
	public List<QuestionVO> ListService(Standard standard) {
		
		return qnaMapper.getListPaging(standard);
	}

	@Override
	public int getTotalService(Standard standard) {

		return qnaMapper.getTotalCount(standard);
	}

}
