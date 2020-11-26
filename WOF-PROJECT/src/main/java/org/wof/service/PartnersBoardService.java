package org.wof.service;

import java.util.List;

import org.wof.domain.CommunityAttachVO;
import org.wof.domain.PartnersBoardVO;
import org.wof.domain.Standard;

public interface PartnersBoardService {

	public void register(PartnersBoardVO pboard);
	
	public PartnersBoardVO get(Long bno);
	
	public boolean modify(PartnersBoardVO pboard);
	
	public boolean remove(Long bno);
	
	//public List<PartnersBoardVO> getList();
	public List<PartnersBoardVO> getList(Standard standard);
	
	public int getTotal(Standard standard);
	
	public List<CommunityAttachVO> getAttachList(Long bno);
	
	//public boolean plusCnt(Long bno);

}
