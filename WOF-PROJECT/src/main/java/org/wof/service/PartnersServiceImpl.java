package org.wof.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.wof.domain.FollowPartnersVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.Standard;
import org.wof.mapper.PartnersMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PartnersServiceImpl implements PartnersService{
	
	private PartnersMapper partnersMapper;
	
	@Override
	public List<PartnersVO> partnersList(Standard standard) {
		
		log.info("get List with standard: "+standard);
		
		return partnersMapper.partnersList(standard);
	}
	
	//페이징처리 총 갯수
	@Override
	public int getTotal(Standard standard) {
		log.info("get total count");
		return partnersMapper.getTotalCount(standard);
	}
	
	@Override
	public List<PartnersVO> recommend() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<PartnersVO> followList(String member_no, Standard standard) {
		return partnersMapper.followList(member_no, standard);
	}
	
	@Override
	public String followCheck(FollowPartnersVO followPartnersVO) {
		return partnersMapper.followCheck(followPartnersVO);
	}
	
	@Override
	public int followYes(FollowPartnersVO followPartnersVO) {
		return partnersMapper.followYes(followPartnersVO);
	}
	
	@Override
	public int followNo(FollowPartnersVO followPartnersVO) {
		return partnersMapper.followNo(followPartnersVO);
	}
	

}
