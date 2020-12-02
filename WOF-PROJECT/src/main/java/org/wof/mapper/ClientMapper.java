package org.wof.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.wof.domain.FollowPartnersVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.ProjectVO;

public interface ClientMapper {
	
	public List<ProjectVO>  dashboardclientProject(String member_no);
	
	public List<PartnersVO> dashboardFallowPartners(String member_no);
	
	public List<ProjectVO> dashboardRegisterProject(String member_no);
	
	public List<PartnersVO> dashboardRecommend(
			@Param("address") String address, 
			@Param("skillList") List<String> skillList);
	
	public String clientAddress(String member_no);//로그인한 클라이언트 주소 가저오기
	
	public List<String> projectSkill(String member_no);
}
