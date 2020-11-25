package org.wof.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.wof.domain.FollowPartnersVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.ProjectVO;

public interface ClientMapper {
	
	public List<ProjectVO>  dashboardclientProject();
	
	public List<PartnersVO> dashboardFallowPartners(String member_no);
}
