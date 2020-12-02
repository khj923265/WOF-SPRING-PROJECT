package org.wof.service;

import java.util.List;

import org.wof.domain.CommunityReplyPageDTO;
import org.wof.domain.CommunityReplyVO;
import org.wof.domain.Standard;

public interface CommunityReplyService {

	public int register(CommunityReplyVO vo);
	
	public CommunityReplyVO get(Long rno);
	
	public int modify(CommunityReplyVO vo);
	
	public int remove(Long rno);
	
	public List<CommunityReplyVO> getList(Standard standard, Long bno);
	
	public CommunityReplyPageDTO getListPage(Standard standard, Long bno);
}
