package org.wof.service;

import java.util.List;

import org.springframework.stereotype.Service;
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
	public List<ProjectVO> dashboardclientProject() {
		log.info("대쉬보드 클라이언트 프로젝트 리스트");
		return clientMapper.dashboardclientProject();
	}

}
