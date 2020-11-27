package org.wof.mapper;

import java.util.List;

import org.wof.domain.CommunityAttachVO;

public interface CommunityAttachMapper {

	public void insert(CommunityAttachVO vo);
	
	public void delete(String uuid);
	
	public List<CommunityAttachVO> findByBno(Long bno);
	
	public void deleteAll(Long bno);
}
