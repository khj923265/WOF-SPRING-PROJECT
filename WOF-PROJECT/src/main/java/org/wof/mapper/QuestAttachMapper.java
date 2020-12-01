package org.wof.mapper;

import java.util.List;

import org.wof.domain.QuestAttachVO;

public interface QuestAttachMapper {
	
	public void insert(QuestAttachVO vo);
	
	public void delete(String uuid);
	
	public List<QuestAttachVO> findByQuest_no(Long quest_no);
	
	public void deleteAll(Long quest_no);

}
