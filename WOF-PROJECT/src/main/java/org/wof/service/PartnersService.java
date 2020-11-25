package org.wof.service;

import java.util.List;

import org.wof.domain.FollowPartnersVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;

public interface PartnersService {
	
	public List<PartnersVO> partnersList(String member_no, Standard standard);
	
	public List<PartnersVO> recommend(String member_no);//지역, 보유기술 받아야함.
	
	public List<PartnersVO>	followList(String member_no, Standard standard);
	
	public int followCount(String member_no, Standard standard);//관심파트너스 카운트(페이징처리)
	
	public String followCheck(FollowPartnersVO followPartnersVO);
	
	public int followYes(FollowPartnersVO followPartnersVO);
	
	public int followNo(FollowPartnersVO followPartnersVO);
	
	public int getTotal(Standard standard);//페이징처리
	
	public List<ProjectVO> applyState(String member_no, Standard standard);

}
