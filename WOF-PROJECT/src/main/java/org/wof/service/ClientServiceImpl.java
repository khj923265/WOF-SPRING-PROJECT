package org.wof.service;

import java.util.ArrayList;
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
		log.info("대쉬보드 프로젝트 지원현황 리스트");
		return clientMapper.dashboardclientProject(member_no);
	}

	@Override
	public List<PartnersVO> dashboardFallowPartners(String member_no) {
		
		log.info("클라이언트 대시보드에 관심 파트너스 리스트 출력하기");
		
		return clientMapper.dashboardFallowPartners(member_no);
	}

	@Override
	public List<ProjectVO> dashboardRegisterProject(String member_no) {
		
		log.info("등록된 프로젝트 리스트");
		
		return clientMapper.dashboardRegisterProject(member_no);
	}
	
	@Override
	public List<PartnersVO> dashboardRecommend(String member_no) {
		
		log.info("추천 파트너스 대시보드");
		
		String clientAddress = clientMapper.clientAddress(member_no);
		
		List<String> projectSkillList = clientMapper.projectSkill(member_no);
		
		List<String> skillList = new ArrayList<>();
		String []skill;
		for(String data : projectSkillList){
			skill = data.split(", ");			
			for(String data2 : skill){
				data2.trim();
				if(!skillList.contains(data2)){
					skillList.add(data2);
			
				}//end if
			}//end for
		}//end for		
		
		if(clientAddress == null || clientAddress == "" || skillList == null){
			return null;
		}else{
			
			String address = clientAddress.substring(0, 2);			
			
			return clientMapper.dashboardRecommend(address, skillList);
		}
		
	}
}
