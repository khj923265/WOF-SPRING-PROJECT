package org.wof.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.wof.domain.ProjectVO;
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
	public List<ProjectVO> applyProject(String member_no, Standard standard) {
		log.info("get applyProject List...");
		return partnersMapper.applyProject(member_no, standard);
	}

	@Override
	public List<ProjectVO> partnersSupport() {
		log.info("get partnersSupport List...");
		return partnersMapper.partnersSupport();
	}

	@Override
	public List<ProjectVO> dashboardpartnersApplyProject(String member_no) {
		log.info("대쉬보드 파트너스 지원 리스트");
		return partnersMapper.dashboardpartnersApplyProject(member_no);
	}
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
