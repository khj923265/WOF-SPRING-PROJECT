package org.wof.service;

import java.util.List;

import org.wof.domain.QuestionVO;
import org.wof.domain.Standard;

public interface QnaService {

	public int QuestionService(QuestionVO quest);
	
	public List<QuestionVO> ListService(Standard standard);
	
	public int getTotalService(Standard standard);
}
