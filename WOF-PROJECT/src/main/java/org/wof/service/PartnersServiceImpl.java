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
	public List<PartnersVO> partnersList(Standard std) {
		
		log.info("get List with standard: "+std);
		
		return partnersMapper.partnersList(std);
	}
	
	@Override
	public List<PartnersVO> recommend() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<PartnersVO> followList(String member_no) {
		return partnersMapper.followList(member_no);
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
