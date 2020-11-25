package org.wof.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.wof.domain.FollowPartnersVO;
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
	public List<PartnersVO> recommend(String member_no) {
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
			
			return partnersMapper.recommend(address, skillList);
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
	

}
