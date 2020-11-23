package org.wof.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.wof.domain.CommunityAttachVO;
import org.wof.domain.PartnersBoardVO;
import org.wof.domain.Standard;
import org.wof.mapper.CommunityAttachMapper;
import org.wof.mapper.PartnersBoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Service
@Log4j
public class PartnersBoardServiceImpl implements PartnersBoardService {

	@Setter(onMethod_ = @Autowired)
	private PartnersBoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private CommunityAttachMapper attachmapper;
	
	@Transactional
	@Override
	public void register(PartnersBoardVO pboard) {
		log.info("register...." + pboard);
		
		mapper.insertSelectKey(pboard);

		if(pboard.getAttachList() == null || pboard.getAttachList().size() <= 0) {
			return;
		}
		
		pboard.getAttachList().forEach(attach -> {
			attach.setBno(pboard.getBno());
			attachmapper.insert(attach);
		});
	}

	@Override
	public PartnersBoardVO get(Long bno) {
		log.info("get" + bno);
		
		return mapper.read(bno);
	}

	@Transactional
	@Override
	public boolean modify(PartnersBoardVO pboard) {
		log.info("modify......" + pboard);
		
		attachmapper.deleteAll(pboard.getBno());
		
		boolean modifyResult = mapper.update(pboard) == 1;
		
		if(modifyResult && pboard.getAttachList() != null && pboard.getAttachList().size() > 0) {
			pboard.getAttachList().forEach(attach -> {
				attach.setBno(pboard.getBno());
				attachmapper.insert(attach);
				
			});
		}
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(Long bno) {
		log.info("remove");
		
		attachmapper.deleteAll(bno);
		
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<PartnersBoardVO> getList(Standard standard) {
		log.info("list paging" + standard);
		return mapper.getListWithPaging(standard);
	}

	@Override
	public int getTotal(Standard standard) {
		log.info("get total count");
		
		return mapper.getTotalCount(standard);
	}

	@Override
	public List<CommunityAttachVO> getAttachList(Long bno) {
		log.info("파일 번호 : " + bno);
		
		return attachmapper.findByBno(bno);
	}

/*	@Override
	public List<PartnersBoardVO> getList() {
		log.info("getList.....");
		return mapper.getList();
	}*/

}
