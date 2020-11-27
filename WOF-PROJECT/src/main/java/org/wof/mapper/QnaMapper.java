package org.wof.mapper;

import java.util.List;

import org.wof.domain.QuestionVO;
import org.wof.domain.Standard;

public interface QnaMapper {
	
	public int Question(QuestionVO quest);

	public List<QuestionVO> getList();
	
	public List<QuestionVO> getListPaging(Standard standard);
	
	public int getTotalCount(Standard standard);
}
