package org.wof.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.wof.domain.ProjectVO;
import org.wof.mapper.PartnersMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Service
@Log4j
public class PartnersServiceImpl implements PartnersService {

	
	private PartnersMapper partnersMapper;
	
	@Override
	public List<ProjectVO> applyProject() {
		log.info("get applyProject List...");
		return partnersMapper.applyProject();
	}

	@Override
	public List<ProjectVO> partnersSupport() {
		log.info("get partnersSupport List...");
		return partnersMapper.partnersSupport();
	}

	@Override
	public List<ProjectVO> dashboardpartnersApplyProject() {
		log.info("대쉬보드 파트너스 지원 리스트");
		return partnersMapper.dashboardpartnersApplyProject();
	}

}
