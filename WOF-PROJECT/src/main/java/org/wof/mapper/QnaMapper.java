package org.wof.mapper;

import java.util.List;

import org.wof.domain.QuestionVO;
import org.wof.domain.Standard;

public interface QnaMapper {

	public List<QuestionVO> getList();
	
	public List<QuestionVO> getListPaging(Standard standard);
	
	public void insert(QuestionVO quest);
	
	public void insertSelectKey(QuestionVO quest);
	
	public QuestionVO read(Long quest_no);
	
	public int delete(Long quest_no);
	
	public int getTotalCount(Standard standard);
	
}
