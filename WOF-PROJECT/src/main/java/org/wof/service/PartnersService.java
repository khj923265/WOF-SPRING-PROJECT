package org.wof.service;

import java.util.List;

import org.wof.domain.ProjectVO;

public interface PartnersService {
	public List<ProjectVO> applyProject();
	public List<ProjectVO> partnersSupport();
	
	public List<ProjectVO> dashboardpartnersApplyProject();
}
