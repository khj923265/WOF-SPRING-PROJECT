package org.wof.service;

import java.util.List;

import org.wof.domain.ProjectVO;

import org.wof.domain.FollowPartnersVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.Standard;

public interface PartnersService {
	
	public List<ProjectVO> applyProject(String member_no, Standard standard);
	
	public List<ProjectVO> partnersSupport();
	
	public List<ProjectVO> dashboardpartnersApplyProject(String member_no);
	
	public List<PartnersVO> partnersList(Standard standard);
	
	public List<PartnersVO> recommend();//지역, 보유기술 받아야함.
	
	public List<PartnersVO>	followList(String member_no, Standard standard);//membar_no String으로 안돼면 객채로..
	
	public String followCheck(FollowPartnersVO followPartnersVO);
	
	public int followYes(FollowPartnersVO followPartnersVO);
	
	public int followNo(FollowPartnersVO followPartnersVO);
	
	public int getTotal(Standard standard);//페이징처리

}
