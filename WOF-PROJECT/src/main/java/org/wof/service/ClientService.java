package org.wof.service;

import java.util.List;

import org.wof.domain.FollowPartnersVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.ProjectVO;

public interface ClientService {

	public List<ProjectVO> dashboardclientProject();
	
	public List<PartnersVO> dashboardFallowPartners(String member_no);
}
