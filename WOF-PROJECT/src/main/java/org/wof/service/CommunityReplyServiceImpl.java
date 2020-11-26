package org.wof.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.wof.domain.CommunityReplyPageDTO;
import org.wof.domain.CommunityReplyVO;
import org.wof.domain.Standard;
import org.wof.mapper.CommunityReplyMapper;
import org.wof.mapper.PartnersBoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CommunityReplyServiceImpl implements CommunityReplyService {

	@Setter(onMethod_ = @Autowired)
	private CommunityReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PartnersBoardMapper boardmapper;
	
	@Transactional
	@Override
	public int register(CommunityReplyVO vo) {
		log.info("reply register" + vo);
		
		boardmapper.updateReplyCnt(vo.getBno(), 1);
		
		return mapper.insert(vo);
	}

	@Override
	public CommunityReplyVO get(Long rno) {
		log.info("reply get" + rno);
		
		return mapper.read(rno);
	}

	@Override
	public int modify(CommunityReplyVO vo) {
		log.info("modify reply" + vo);
		
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove reply" + rno);
		
		CommunityReplyVO vo = mapper.read(rno);
		
		boardmapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.delete(rno);
	}

	@Override
	public List<CommunityReplyVO> getList(Standard standard, Long bno) {
		log.info("get Reply list of a pboard" + bno);
		
		return mapper.getListWithPaging(standard, bno);
	}

	@Override
	public CommunityReplyPageDTO getListPage(Standard standard, Long bno) {
		
		
		return new CommunityReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(standard, bno));
	}

}
