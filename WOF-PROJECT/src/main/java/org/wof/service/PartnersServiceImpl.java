package org.wof.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.wof.domain.ProjectVO;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.wof.domain.ApplyVO;
import org.wof.domain.ContractSourceVO;
import org.wof.domain.FollowPartnersVO;
import org.wof.domain.MemberVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.ProjectVO;
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
	
	@Override
	public List<PartnersVO> partnersList(String member_no, Standard standard) {
		
		log.info("get List with standard: "+standard);
		
		return partnersMapper.partnersList(member_no, standard);
	}
	
	//페이징처리 총 갯수
	@Override
	public int getTotal(Standard standard) {
		log.info("get total count");
		return partnersMapper.getTotalCount(standard);
	}
	
	@Override
	public List<PartnersVO> recommend(String member_no, Standard standard) {
		log.info("get recommend with standard: "+member_no);
		String clientAddress = partnersMapper.clientAddress(member_no);
		
		List<String> projectSkillList = partnersMapper.projectSkill(member_no);
		
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
			
			return partnersMapper.recommend(address, skillList, standard);
		}
		
	}
	
	@Override
	public int recommendCount(String member_no, Standard standard) {
		log.info("get recommend with standard: "+member_no);
		String clientAddress = partnersMapper.clientAddress(member_no);
		
		List<String> projectSkillList = partnersMapper.projectSkill(member_no);
		
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
			return 0;
		}else{
			
			String address = clientAddress.substring(0, 2);
			
			return partnersMapper.recommendCount(address, skillList, standard);
		}
	}
	
	@Override
	public List<PartnersVO> followList(String member_no, Standard standard) {
		return partnersMapper.followList(member_no, standard);
	}
	
	@Override
	public int followCount(String member_no, Standard standard) {
		log.info("get follow total count");
		return partnersMapper.followCount(member_no, standard);
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

	@Override
	public List<ProjectVO> applyState(String member_no, Standard standard) {
		
		return partnersMapper.applyState(member_no, standard);
	}

	@Override
	public ProjectVO applyDetailProject(String proj_id) {
		
		return partnersMapper.applyDetailProject(proj_id);
	}

	@Override
	public List<PartnersVO> applyDetailPartners(String proj_id, Standard standard) {
		
		return partnersMapper.applyDetailPartners(proj_id, standard);
	}

	@Override
	public int applyPartnersTotal(String proj_id) {
		
		return partnersMapper.applyPartnersTotal(proj_id);
	}

	@Override
	public int applyRegister(String[] member_no, String proj_id) {
		
		return partnersMapper.applyRegister(member_no, proj_id);
	}
	
	@Override
	public String applyCheck(ApplyVO applyVO) {
		return partnersMapper.applyCheck(applyVO);
	}

	@Override
	public int applyDelete(String[] member_no, String proj_id) {
		
		return partnersMapper.applyDelete(member_no, proj_id);
	}
	
	@Override
	public List<ContractSourceVO> appliedPartners(String proj_id, Standard standard) {
		return partnersMapper.appliedPartners(proj_id, standard);
	}

	@Override
	public int applyStateTotal(Standard standard) {
		return partnersMapper.applyStateTotal(standard);
	}

	@Override
	public int appliedpartnersTotal(Standard standard) {
		
		return partnersMapper.appliedpartnersTotal(standard);
	}
	
	@Override
	public int applyProjectTotal(Standard standard) {
		
		return partnersMapper.applyProjectTotal(standard);
	}
	
	@Override
	public List<ProjectVO> dashboardFollowProject(String related_member) {
		
		return partnersMapper.dashboardFollowProject(related_member);
	}
}
