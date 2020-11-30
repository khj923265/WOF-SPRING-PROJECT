package org.wof.service;

import java.util.List;

import org.wof.domain.CommunityAttachVO;
import org.wof.domain.PartnersBoardVO;
import org.wof.domain.QuestAttachVO;
import org.wof.domain.QuestionVO;
import org.wof.domain.Standard;

public interface QnaService {
	
	public List<QuestionVO> ListService(Standard standard);
	
	public int getTotalService(Standard standard);

	public void registerService(QuestionVO quest);
	
	public QuestionVO getService(Long quest_no);
	
	public boolean removeService(Long quest_no);
	
	public List<QuestAttachVO> getAttachListService(Long quest_no);
}
