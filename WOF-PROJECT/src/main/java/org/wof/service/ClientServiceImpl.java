package org.wof.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.wof.domain.FollowPartnersVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.ProjectVO;
import org.wof.mapper.ClientMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Service
@Log4j
public class ClientServiceImpl implements ClientService {

	private ClientMapper clientMapper;
	
	@Override
	public List<ProjectVO> dashboardclientProject(String member_no) {
		log.info("대쉬보드 클라이언트 프로젝트 리스트");
		return clientMapper.dashboardclientProject(member_no);
	}

	@Override
	public List<PartnersVO> dashboardFallowPartners(String member_no) {
		
		log.info("클라이언트 대시보드에 관심 파트너스 리스트 출력하기");
		
		return clientMapper.dashboardFallowPartners(member_no);
	}

}
