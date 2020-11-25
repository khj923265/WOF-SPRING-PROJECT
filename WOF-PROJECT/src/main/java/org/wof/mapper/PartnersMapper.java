package org.wof.mapper;

import java.util.List;

import org.wof.domain.ProjectVO;



import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.wof.domain.FollowPartnersVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.Standard;

public interface PartnersMapper {
	
	public List<ProjectVO> applyProject(@Param("member_no") String member_no,
			@Param("standard") Standard standard);
	
	public List<ProjectVO> partnersSupport();
	
	public List<ProjectVO> dashboardpartnersApplyProject(@Param("member_no") String member_no);
	public List<PartnersVO> partnersList(Standard standard);
	
	public List<PartnersVO> recommend();//지역, 보유기술 받아야함.
	
	public List<PartnersVO>	followList(
			@Param("member_no") String member_no, 
			@Param("standard") Standard standard);
	
	public String followCheck(FollowPartnersVO followPartnersVO);
	
	public int followYes(FollowPartnersVO followPartnersVO);
	
	public int followNo(FollowPartnersVO followPartnersVO);
	
	public int getTotalCount(Standard standard);

}
